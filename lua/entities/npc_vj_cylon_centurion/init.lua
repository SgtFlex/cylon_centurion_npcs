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
ENT.RangeAttackAnimationFaceEnemy = true -- Should it face the enemy while playing the range attack animation?



ENT.NoChaseAfterCertainRange = true -- Should the SNPC not be able to chase when it's between number x and y?
ENT.NoChaseAfterCertainRange_FarDistance = 500 -- How far until it can chase again? | "UseRangeDistance" = Use the number provided by the range attack instead
ENT.NoChaseAfterCertainRange_CloseDistance = 300 -- How near until it can chase again? | "UseRangeDistance" = Use the number provided by the range attack instead
ENT.NoChaseAfterCertainRange_Type = "Regular" -- "Regular" = Default behavior | "OnlyRange" = Only does it if it's able to range attack



ENT.GunDamage = nil
ENT.Vulnerability = nil
ENT.Accuracy = 0.05

ENT.Limbs = {
    [500] = {
        Health = 500,
        bodygroup = 0,
        gibs = {},
        removed = false,
        extra = (function(self, dmginfo)
        end)
    },
    [501] = {
        Health = 300,
        bodygroup = 1,
        gibs = {"models/bsg/cylon_head.mdl"},
        removed = false,
        extra = (function(self, dmginfo)
            dmginfo:SetDamage(self:Health())
        end)
    },
    [502] = {
        Health = 150,
        bodygroup = 2,
        gibs = {"models/bsg/cylon_shoulder.mdl", "models/bsg/cylon_upperarm.mdl", "models/bsg/cylon_forearm.mdl"},
        removed = false,
        extra = (function(self, dmginfo)
            self.HasMeleeAttack = false
            if (self.Limbs[503]["removed"] == true) then
                self.HasRangeAttack = false
                self.NoChaseAfterCertainRange = false
            end
        end)
    },
    [503] = {
        Health = 150,
        bodygroup = 3,
        gibs = {"models/bsg/cylon_shoulder.mdl", "models/bsg/cylon_upperarm.mdl", "models/bsg/cylon_forearm.mdl", "models/bsg/cylon_hand.mdl",},
        removed = false,
        extra = (function(self, dmginfo)
            if (self.Limbs[502]["removed"] == true) then
                self.HasRangeAttack = false
                self.NoChaseAfterCertainRange = false
            end
        end)
    },
    [504] = {
        Health = 150,
        bodygroup = 4,
        gibs = {"models/bsg/cylon_foot.mdl", "models/bsg/cylon_lowerleg.mdl", "models/bsg/cylon_upperleg.mdl", "models/bsg/cylon_hand.mdl",},
        removed = false,
        extra = (function(self, dmginfo)
            if (self.Limbs[505]["removed"] == true) then return end
            self:VJ_ACT_PLAYACTIVITY("FallToCrawl", true, 1, false)
            self.HasDeathAnimation = false
            self.AnimTbl_Walk = {ACT_PRONE_FORWARD} -- Set the walking animations | Put multiple to let the base pick a random animation when it moves
            self.AnimTbl_Run = {ACT_PRONE_FORWARD} -- Set the running animations | Put multiple to let the base pick a random animation when it moves
            self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK2} -- Melee Attack Animations
            self.AnimTbl_IdleStand = {ACT_PRONE_IDLE} -- The idle animation table when AI is enabled | DEFAULT: {ACT_IDLE}
            self.RangeAttackAnimationStopMovement = true -- Should it stop moving when performing a range attack?
            self:SetCollisionBounds(Vector(-50, -50, 0), Vector(50, 50, 40))
        end)
    },
    [505] = {
        Health = 150,
        bodygroup = 5,
        gibs = {"models/bsg/cylon_foot.mdl", "models/bsg/cylon_lowerleg.mdl", "models/bsg/cylon_upperleg.mdl"},
        removed = false,
        extra = (function(self, dmginfo)
            if (self.Limbs[504]["removed"] == true) then return end
            self:VJ_ACT_PLAYACTIVITY("FallToCrawl", true, 1, false)
            self.HasDeathAnimation = false
            self.AnimTbl_Walk = {ACT_PRONE_FORWARD} -- Set the walking animations | Put multiple to let the base pick a random animation when it moves
            self.AnimTbl_Run = {ACT_PRONE_FORWARD} -- Set the running animations | Put multiple to let the base pick a random animation when it moves
            self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK2} -- Melee Attack Animations
            self.AnimTbl_IdleStand = {ACT_PRONE_IDLE} -- The idle animation table when AI is enabled | DEFAULT: {ACT_IDLE}
            self.RangeAttackAnimationStopMovement = true -- Should it stop moving when performing a range attack?
            self:SetCollisionBounds(Vector(-50, -50, 0), Vector(50, 50, 40))
        end)
    },
}

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
            if (!self.RotateSound) then return end
            self.RotateSound:Stop()
        end)
    end,
    ["Rotate_Stop"] = function(self)
        if (self.RotateSound) then self.RotateSound:Stop() end
        self:EmitSound("cylon/idle/Turn_stop.ogg", 80, math.random(75, 85), 0.4)
    end,
}

function ENT:UseConvars()
    self.GunDamageMult = GetConVar("vj_bsg_centurion_damage"):GetFloat()
    self.StartHealth = GetConVar("vj_bsg_centurion_health"):GetFloat()
    self.Vulnerability = GetConVar("vj_bsg_centurion_npc_inc_damage"):GetFloat()
    self.Accuracy = GetConVar("vj_bsg_centurion_accuracy"):GetFloat()
    self.MeleeAttackDamage = self.MeleeAttackDamage * GetConVar("vj_bsg_centurion_melee_damage"):GetFloat()
    self:SetHealth(self.StartHealth)
    self:SetMaxHealth(self.StartHealth)
end

function ENT:CustomOnInitialize()
    self:UseConvars()
    self:SetCollisionBounds(Vector(-15, -15, 0), Vector(15, 15, 90))
end



function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if inputs[key] then inputs[key](self) end
end

function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo, hitgroup)
    local dmgpos = dmginfo:GetDamagePosition()
    dmgpos.z = 0
    local pos = self:GetPos()
    pos.z = 0
    local dot = self:GetForward():Dot((dmgpos - pos):GetNormalized())
    local x = self:GetRight():Dot((dmgpos - pos):GetNormalized())
    local finalAng = math.deg(math.acos(dot))
    if (x > 0) then
        finalAng = finalAng * -1
    end
    self:SetPoseParameter("hit_angle", finalAng)
    self:AddGesture(ACT_FLINCH_PHYSICS, true)
    if (dmginfo:GetAttacker():IsNPC()) then
        dmginfo:ScaleDamage(self.Vulnerability)
    end
    if (self.Limbs[hitgroup] and self.Limbs[hitgroup]["removed"] == false) then
        self.Limbs[hitgroup]["Health"] = self.Limbs[hitgroup]["Health"] - dmginfo:GetDamage()
        if (self.Limbs[hitgroup]["Health"] <= 0) then
            self.Limbs[hitgroup]["removed"] = true
            self:SetBodygroup(self.Limbs[hitgroup]["bodygroup"], 1)
            for k, v in pairs(self.Limbs[hitgroup]["gibs"]) do
                local gib = ents.Create("obj_vj_gib")
                gib.CollideSound = {}
                gib.Collide_Decal = "None"
                gib:SetModel(v)
                gib:SetPos(dmginfo:GetDamagePosition())
                gib:SetAngles(self:GetAngles())
                gib:Spawn()
                gib:GetPhysicsObject():ApplyForceCenter(dmginfo:GetDamageForce())
            end
            self:RemoveAllDecals()
            self.Limbs[hitgroup]["extra"](self, dmginfo)
        end
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
    self:EmitSound(self.SoundTbl_Fire[math.random(1, (#self.SoundTbl_Fire))], 90, math.random(80, 120), 1)
    if (self.Limbs[502]["Health"] > 0) then
        muzzle = math.random(1, 3)
        ParticleEffectAttach("vj_rifle_full", 4, self, self:LookupAttachment(muzzles[muzzle]))
        local bulletInfo = {
            Attacker = self,
            Damage = 1.75 * self.GunDamageMult,
            Force = 10,
            Num = 1,
            Tracer = 0,
            Dir = (pos - self:GetAttachment(self:LookupAttachment(muzzles[muzzle]))["Pos"]):GetNormalized(),
            Src = self:GetAttachment(self:LookupAttachment(muzzles[muzzle]))["Pos"],
            Spread = Vector(0.06 * self.Accuracy, 0.06 * self.Accuracy, 0)
        }
        self:FireBullets(bulletInfo)
    end
    if (self.Limbs[503]["Health"] > 0) then
        muzzle = math.random(4, 6)
        ParticleEffectAttach("vj_rifle_full", 4, self, self:LookupAttachment(muzzles[muzzle]))
        local bulletInfo = {
            Attacker = self,
            Damage = 1.75 * self.GunDamageMult,
            Force = 10,
            Num = 1,
            Tracer = 0,
            Dir = (pos - self:GetAttachment(self:LookupAttachment(muzzles[muzzle]))["Pos"]):GetNormalized(),
            Src = self:GetAttachment(self:LookupAttachment(muzzles[muzzle]))["Pos"],
            Spread = Vector(0.06 * self.Accuracy, 0.06 * self.Accuracy, 0)
        }
        self:FireBullets(bulletInfo)
    end
end

function ENT:CustomOnThink()
    if (self.Limbs[504]["Health"] > 0 and self.Limbs[505]["Health"] > 0) then
        if (self:GetEnemy()) then
            local distance = self:GetPos():Distance(self:GetEnemy():GetPos())
            if (distance < self.RangeDistance and distance > self.RangeToMeleeDistance) then
                self.AnimTbl_IdleStand = {ACT_IDLE_AGITATED}
                self.AnimTbl_Walk = {ACT_WALK_AGITATED}
                self.AnimTbl_Run = {ACT_WALK_AGITATED}
            else
                self.AnimTbl_IdleStand = {ACT_IDLE_AGITATED}
                self.AnimTbl_Walk = {ACT_WALK_AGITATED}
                self.AnimTbl_Run = {ACT_RUN_AGITATED}
            end
        else
            self.AnimTbl_IdleStand = {ACT_IDLE}
            self.AnimTbl_Walk = {ACT_WALK}
            self.AnimTbl_Run = {ACT_RUN}
        end
    end
end

function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
    self:SetSkin(1)
end
