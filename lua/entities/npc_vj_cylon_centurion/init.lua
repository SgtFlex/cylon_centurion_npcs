AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.SoundTbl_Step = {
    "cylon/footstep/step2.ogg",
}

ENT.SoundTbl_Raise = {
    "cylon/footstep/raise1.ogg",
}
ENT.SoundTbl_Fire = {
    "cylon/fire/fire1.ogg",
}

ENT.SoundTbl_Breath = {
    "cylon/beepboop1.ogg"
}
ENT.NextSoundTime_Breath = VJ_Set(1, 1) -- true = Base will decide the time | VJ_Set(1, 2) = Custom time
ENT.BreathSoundPitch = VJ_Set(95, 105)
ENT.BreathSoundLevel = 70

ENT.Model = {"models/bsg/cylon_centurion.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.AnimTbl_Death = {ACT_DIESIMPLE} -- Death Animations
ENT.DeathAnimationChance = 0.5 -- Put 1 if you want it to play the animation all the time
ENT.MeleeAttackDamage = 85
ENT.TimeUntilMeleeAttackDamage = 1 -- This counted in seconds | This calculates the time until it hits something
ENT.VJ_NPC_Class = {"CLASS_CYLON"} -- NPCs with the same class with be allied to each other
ENT.MeleeAttackDamageType = DMG_CLUB -- Type of Damage

ENT.StartHealth = 1000 -- The starting health of the NPC
ENT.HasRangeAttack = true -- Should the SNPC have a range attack?
ENT.AnimTbl_RangeAttack = {} -- Range Attack Animations
ENT.TimeUntilRangeAttackProjectileRelease = 0 -- How much time until the projectile code is ran?
ENT.NextRangeAttackTime = 0.075 -- How much time until it can use a range attack?
ENT.RangeAttackReps = 1 -- How many times does it run the projectile code?
ENT.RangeToMeleeDistance = 150 -- How close does it have to be until it uses melee?
ENT.DisableDefaultRangeAttackCode = true -- When true, it won't spawn the range attack entity, allowing you to make your own
ENT.NextAnyAttackTime_Range = 0.075 -- How much time until it can use any attack again? | Counted in Seconds
-- ENT.AnimTbl_IdleStand = {ACT_IDLE_ALERTED}
ENT.RangeAttackAnimationStopMovement = false -- Should it stop moving when performing a range attack?

ENT.NoChaseAfterCertainRange = true -- Should the SNPC not be able to chase when it's between number x and y?
ENT.NoChaseAfterCertainRange_FarDistance = 500 -- How far until it can chase again? | "UseRangeDistance" = Use the number provided by the range attack instead
ENT.NoChaseAfterCertainRange_CloseDistance = 300 -- How near until it can chase again? | "UseRangeDistance" = Use the number provided by the range attack instead
ENT.NoChaseAfterCertainRange_Type = "Regular" -- "Regular" = Default behavior | "OnlyRange" = Only does it if it's able to range attack

ENT.GunDamage = nil
ENT.Vulnerability = nil
function ENT:UseConvars()
    self.GunDamageMult = GetConVar("vj_bsg_centurion_damage"):GetFloat()
    self.StartHealth = GetConVar("vj_bsg_centurion_health"):GetFloat()
    self.Vulnerability = GetConVar("vj_bsg_centurion_npc_inc_damage"):GetFloat()
    self:SetHealth(self.StartHealth)
    self:SetMaxHealth(self.StartHealth)
end

function ENT:CustomOnInitialize()
    self:UseConvars()
end

ENT.RotateSound = nil
local inputs = {
    ["Step"] = function(self)
        self:EmitSound(self.SoundTbl_Step[math.random(1, #self.SoundTbl_Step)], 80, math.random(75, 145), 0.35)
        util.ScreenShake(self:GetPos(), 5, 1, 0.25, 300)
    end,
    ["Raise"] = function(self)
        self:EmitSound(self.SoundTbl_Raise[math.random(1, #self.SoundTbl_Raise)], 70, math.random(90, 130), 0.35)
    end,
    ["KneeClank"] = function(self)
        self:EmitSound(self.SoundTbl_Step[math.random(1, #self.SoundTbl_Step)], 80, math.random(70, 90), 0.5)
        util.ScreenShake(self:GetPos(), 5, 1, 0.25, 300)
    end,
    ["GroundSlam"] = function(self)
        self:EmitSound(self.SoundTbl_Step[math.random(1, #self.SoundTbl_Step)], 80, math.random(55, 65), 0.75)
        util.ScreenShake(self:GetPos(), 5, 1, 0.25, 300)
    end,
    ["Melee_Ready"] = function(self)
        self:EmitSound("cylon/melee/ready1.ogg", 80, math.random(75, 145), 1)
    end,
    ["Melee_Slash"] = function(self)
        self:EmitSound("cylon/melee/slash1.ogg", 80, math.random(75, 145), 1)
    end,
    ["Rotate_Start"] = function(self)
        self.RotateSound = CreateSound(self, "cylon/idle/Turn_loop.wav")
        self.RotateSound:PlayEx(0.5, 85)
        timer.Simple(1, function()
            if (!IsValid(self.RotateSound)) then return end
            self.RotateSound:Stop()
        end)
    end,
    ["Rotate_Stop"] = function(self)
        if (self.RotateSound) then self.RotateSound:Stop() end
        self:EmitSound("cylon/idle/Turn_stop.ogg", 80, math.random(75, 85), 0.4)
    end,
}
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if inputs[key] then inputs[key](self) end
end

function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo, hitgroup)
    if (dmginfo:GetAttacker():IsNPC()) then
        dmginfo:ScaleDamage(self.Vulnerability)
    end
end

function ENT:CustomOnRemove()
    if (self.RotateSound) then self.RotateSound:Stop() end
end



local muzzles = {
    "RArmRCannon",
    "RArmLCannon",
    "RArmTCannon",
    "LArmRCannon",
    "LArmLCannon",
    "LArmTCannon",
}
local counter = 1
function ENT:CustomRangeAttackCode() 
    if (!IsValid(self:GetEnemy())) then return end
    local pos = self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter()
    self:VJ_ACT_PLAYACTIVITY("vjges_Shooting_Gesture", false, 0, true)
    self:EmitSound(self.SoundTbl_Fire[math.random(1, (#self.SoundTbl_Fire))], 75, math.random(80, 120), 1)
    for i = 1, 2 do
        muzzle = math.random(1, 3) + 3*(i-1)
        ParticleEffectAttach("vj_rifle_full", 4, self, self:LookupAttachment(muzzles[muzzle]))
        local bulletInfo = {
            Attacker = self,
            Damage = 1.75 * self.GunDamageMult,
            Force = 10,
            Num = 1,
            Tracer = 0,
            Dir = (pos - self:GetAttachment(self:LookupAttachment(muzzles[muzzle]))["Pos"]):GetNormalized(),
            Src = self:GetAttachment(self:LookupAttachment(muzzles[muzzle]))["Pos"],
            Spread = Vector(0.04, 0.04, 0)
        }
        self:FireBullets(bulletInfo)
    end
end

function ENT:CustomOnThink()
    
    if (self:GetEnemy()) then
        local distance = self:GetPos():Distance(self:GetEnemy():GetPos())
        if (distance < self.RangeDistance and distance > self.RangeToMeleeDistance) then
            self.AnimTbl_IdleStand = {"Shooting_Stance"}
            self.AnimTbl_Walk = {ACT_WALK_AIM}
            self.AnimTbl_Run = {ACT_WALK_AIM}
        else
            self.AnimTbl_IdleStand = {"Shooting_Stance"}
            self.AnimTbl_Walk = {ACT_RUN_AIM}
            self.AnimTbl_Run = {ACT_RUN_AIM}
        end
    else
        self.AnimTbl_IdleStand = {ACT_IDLE}
        self.AnimTbl_Walk = {ACT_WALK}
        self.AnimTbl_Run = {ACT_RUN}
    end
end