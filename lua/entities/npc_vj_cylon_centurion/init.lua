AddCSLuaFile("shared.lua")
include('shared.lua')

ENT.SoundTbl_Step = {
    "cylon/footstep/step1.ogg",
    "cylon/footstep/step2.ogg",
}

ENT.SoundTbl_StabDirt = {
    "cylon/footstep/stab01.ogg",
    "cylon/footstep/stab02.ogg",
}
ENT.SoundTbl_Scrape = {
    "cylon/footstep/scrape01.ogg",
    "cylon/footstep/scrape02.ogg",
    "cylon/footstep/scrape03.ogg",
    "cylon/footstep/scrape04.ogg",
}

ENT.SoundTbl_Slash = {
    "cylon/melee/slash01.ogg",
    "cylon/melee/slash02.ogg",
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
ENT.DisableRangeAttackAnimation = true -- if true, it will disable the animation code
ENT.AnimTbl_WeaponAttack = {ACT_IDLE_AGITATED} -- Animation played when the SNPC does weapon attack



ENT.NoChaseAfterCertainRange = true -- Should the SNPC not be able to chase when it's between number x and y?
ENT.NoChaseAfterCertainRange_FarDistance = 500 -- How far until it can chase again? | "UseRangeDistance" = Use the number provided by the range attack instead
ENT.NoChaseAfterCertainRange_CloseDistance = 300 -- How near until it can chase again? | "UseRangeDistance" = Use the number provided by the range attack instead
ENT.NoChaseAfterCertainRange_Type = "Regular" -- "Regular" = Default behavior | "OnlyRange" = Only does it if it's able to range attack

ENT.CanFlinch = 1
ENT.FlinchChance = 4 -- Chance of it flinching from 1 to x | 1 will make it always flinch
ENT.HitGroupFlinching_DefaultWhenNotHit = false -- If it uses hitgroup flinching, should it do the regular flinch if it doesn't hit any of the specified hitgroups?

ENT.HitGroupFlinching_Values = {
    {
        HitGroup = {500},
        Animation = {ACT_FLINCH_CHEST}
    },
    {
        HitGroup = {501},
        Animation = {ACT_FLINCH_HEAD}
    },
    {
        HitGroup = {502},
        Animation = {ACT_FLINCH_RIGHTARM}
    },
    {
        HitGroup = {503},
        Animation = {ACT_FLINCH_LEFTARM}
    },
    {
        HitGroup = {504},
        Animation = {ACT_FLINCH_RIGHTLEG}
    },
    {
        HitGroup = {505},
        Animation = {ACT_FLINCH_LEFTLEG}
    }
} -- EXAMPLES: {{HitGroup = {HITGROUP_HEAD}, Animation = {ACT_FLINCH_HEAD}}, {HitGroup = {HITGROUP_LEFTARM}, Animation = {ACT_FLINCH_LEFTARM}}, {HitGroup = {HITGROUP_RIGHTARM}, Animation = {ACT_FLINCH_RIGHTARM}}, {HitGroup = {HITGROUP_LEFTLEG}, Animation = {ACT_FLINCH_LEFTLEG}}, {HitGroup = {HITGROUP_RIGHTLEG}, Animation = {ACT_FLINCH_RIGHTLEG}}}


ENT.GunDamage = nil
ENT.Vulnerability = nil
ENT.Accuracy = 0.05

ENT.AnimSets = {
    ["Stand"] = {
        ["Unalerted"] = (function(self)
            self.AnimTbl_IdleStand = {ACT_IDLE}
            self.AnimTbl_Walk = {ACT_WALK}
            self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1} -- Melee Attack Animations
            self.RunAnim = {ACT_RUN}
            self.AnimTbl_Run = self.RunAnim
            
        end),
        ["Alerted"] = (function(self)
            self.AnimTbl_IdleStand = {ACT_IDLE_AGITATED}
            self.AnimTbl_Walk = {ACT_WALK_AGITATED}
            self.RunAnim = {ACT_RUN_AGITATED}
            self.AnimTbl_Run = self.RunAnim
            self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1} -- Melee Attack Animations
        end),
    },
    ["Crawl"] = {
        ["Unalerted"] = (function(self)
            self.AnimTbl_IdleStand = {ACT_PRONE_IDLE}
            self.AnimTbl_Walk = {ACT_PRONE_FORWARD}
            self.RunAnim = {ACT_PRONE_FORWARD}
            self.AnimTbl_Run = self.RunAnim
            self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK2} -- Melee Attack Animations

        end),
        ["Alerted"] = (function(self)
            self.AnimTbl_IdleStand = {ACT_RANGE_ATTACK1_LOW}
            self.AnimTbl_Walk = {ACT_PRONE_FORWARD}
            self.RunAnim = {ACT_PRONE_FORWARD}
            self.AnimTbl_Run = self.RunAnim
            self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK2} -- Melee Attack Animations
        end)
    }
}

ENT.SelectedAnimSet = "Stand"



ENT.Limbs = {
    [500] = {
        Health = 300,
        bodygroup = 0,
        gibs = {"models/gibs/scanner_gib02.mdl", "models/gibs/scanner_gib02.mdl", "models/gibs/scanner_gib02.mdl","models/combine_helicopter/bomb_debris_3.mdl", "models/combine_helicopter/bomb_debris_3.mdl", "models/gibs/metal_gib1.mdl", "models/gibs/metal_gib5.mdl"},
        removed = false,
        extra = (function(self, dmginfo)
            if (self.SelectedAnimSet=="Stand") then self:VJ_ACT_PLAYACTIVITY(ACT_FLINCH_CHEST, true, 1.5, false) end
            local chestBone = self:GetBonePosition(self:LookupBone("Chest"))
            print(chestBone)
            self:EmitSound("phx/explode00.wav", 75, math.random(80, 120), .25)
            ParticleEffect("bsg_mini_explosion01", chestBone, Angle(0,0,0))
            ParticleEffectAttach("bsg_sparks_continous", PATTACH_POINT_FOLLOW, self, self:LookupAttachment("sparks01"))
            ParticleEffectAttach("bsg_sparks_continous", PATTACH_POINT_FOLLOW, self, self:LookupAttachment("sparks02"))
            self.DamageSound = CreateSound(self, "cylon/damage01.wav")
            self.DamageSound:PlayEx(1, 100)
        end)
    },
    [501] = {
        Health = 150,
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
        gibs = {"models/bsg/cylon_shoulder.mdl", "models/bsg/cylon_upperarm.mdl", "models/bsg/cylon_forearm.mdl",  "models/bsg/cylon_hand.mdl", "models/bsg/cylon_gun.mdl", "models/bsg/cylon_gun.mdl", "models/bsg/cylon_cannon.mdl"},
        removed = false,
        extra = (function(self, dmginfo)
            if (self.SelectedAnimSet=="Stand") then self:VJ_ACT_PLAYACTIVITY(ACT_FLINCH_RIGHTARM, true, 1.5, false) end

            if (self.Limbs[503]["removed"] == true) then
                self.HasRangeAttack = false
                self.NoChaseAfterCertainRange = false
                self.AnimTbl_MeleeAttack = {ACT_LEAP} -- Melee Attack Animations
                self.MeleeAttackDistance = 250 -- How close does it have to be until it attacks?
                self.MeleeAttackAnimationFaceEnemy = false -- Should it face the enemy while playing the melee attack animation?
                self.HasDeathAnimation = false
                self.HasDeathRagdoll = false -- If set to false, it will not spawn the regular ragdoll of the SNPC

            end
        end)
    },
    [503] = {
        Health = 150,
        bodygroup = 3,
        gibs = {"models/bsg/cylon_shoulder.mdl", "models/bsg/cylon_upperarm.mdl", "models/bsg/cylon_forearm.mdl", "models/bsg/cylon_hand.mdl", "models/bsg/cylon_gun.mdl", "models/bsg/cylon_gun.mdl", "models/bsg/cylon_cannon.mdl"},
        removed = false,
        extra = (function(self, dmginfo)
            if (self.SelectedAnimSet=="Stand") then self:VJ_ACT_PLAYACTIVITY(ACT_FLINCH_LEFTARM, true, 1.5, false) end

            if (self.Limbs[502]["removed"] == true) then
                self.HasRangeAttack = false
                self.NoChaseAfterCertainRange = false
                self.AnimTbl_MeleeAttack = {ACT_LEAP} -- Melee Attack Animations
                self.MeleeAttackDistance = 250 -- How close does it have to be until it attacks?
                self.MeleeAttackAnimationFaceEnemy = false -- Should it face the enemy while playing the melee attack animation?
                

            end
        end)
    },
    [504] = {
        Health = 150,
        bodygroup = 4,
        gibs = {"models/bsg/cylon_foot.mdl", "models/bsg/cylon_lowerleg.mdl", "models/bsg/cylon_upperleg.mdl",},
        removed = false,
        extra = (function(self, dmginfo)
            if (self.Limbs[505]["removed"] == true) then return end
            self.CanFlinch = 0
            self.HasDeathAnimation = false
            self.RangeAttackAnimationStopMovement = true -- Should it stop moving when performing a range attack?
            self:SetCollisionBounds(Vector(-50, -50, 0), Vector(50, 50, 40))
            self.SelectedAnimSet = "Crawl"
            self:VJ_ACT_PLAYACTIVITY("StandToCrawl01", true, 1.5, false)
        end)
    },
    [505] = {
        Health = 150,
        bodygroup = 5,
        gibs = {"models/bsg/cylon_foot.mdl", "models/bsg/cylon_lowerleg.mdl", "models/bsg/cylon_upperleg.mdl"},
        removed = false,
        extra = (function(self, dmginfo)
            if (self.Limbs[504]["removed"] == true) then return end
            self.CanFlinch = 0
            self:VJ_ACT_PLAYACTIVITY("StandToCrawl01", true, 1.5, false)
            self.HasDeathAnimation = false
            self.RangeAttackAnimationStopMovement = true -- Should it stop moving when performing a range attack?
            self:SetCollisionBounds(Vector(-50, -50, 0), Vector(50, 50, 40))
            self.SelectedAnimSet = "Crawl"
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
    ["StabDirt"] = function(self)
        self:EmitSound(self.SoundTbl_StabDirt[math.random(1, #self.SoundTbl_StabDirt)], 80, math.random(70, 90), 0.5)
    end,
    ["Crawl"] = function(self)
        self:EmitSound(self.SoundTbl_Scrape[math.random(1, #self.SoundTbl_Scrape)], 80, math.random(70, 90), 0.5)
    end,
    ["Slash"] = function(self)
        self:EmitSound("cylon/melee/slash01.ogg", 80, math.random(70, 90), 0.5)
    end,
}

function ENT:EngageSuicideMode()
end

function ENT:CustomOnMeleeAttack_AfterStartTimer(seed) 
    if (self.HasRangeAttack==true) then return end
    timer.Simple(0.7, function()
        self.HasDeathAnimation = false
        self.HasDeathRagdoll = false -- If set to false, it will not spawn the regular ragdoll of the SNPC
        local blast = DamageInfo()
        blast:SetDamage(50)
        blast:SetDamageType(DMG_BLAST)
        util.BlastDamageInfo(blast, self:GetPos(), 1000)
        self:TakeDamage(self:Health()-1)
        self:SetUpGibesOnDeath()
    end)
end


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
                gib.Collide_Decal = "None"
                gib:SetModel(v)
                gib:SetPos(dmginfo:GetDamagePosition())
                gib:SetAngles(Angle(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180)))
                gib:Spawn()
                gib:GetPhysicsObject():SetAngleVelocityInstantaneous(Vector(math.random(0, 5000)), Vector(math.random(0, 5000)),Vector(math.random(0, 5000)))
                if (hitgroup != 500) then gib:GetPhysicsObject():ApplyForceCenter(dmginfo:GetDamageForce()) else gib:GetPhysicsObject():ApplyForceCenter(Vector(math.random(-300, 300), math.random(-300, 300), math.random(100, 300))) end
                gib.Collide_Decal = ""
                gib.CollideSound = {"physics/metal/metal_solid_impact_hard1.wav", "physics/metal/metal_solid_impact_hard2.wav", "physics/metal/metal_solid_impact_hard3.wav", "physics/metal/metal_solid_impact_hard4.wav", "physics/metal/metal_solid_impact_hard5.wav", }
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
local muzzle = 0
function ENT:CustomRangeAttackCode() 
    if (!IsValid(self:GetEnemy())) then return end
    local pos = self:GetEnemy():GetPos() + self:GetEnemy():OBBCenter()
    self:VJ_ACT_PLAYACTIVITY("vjges_Shooting_Gesture", false, 0, true)
    self:EmitSound(self.SoundTbl_Fire[math.random(1, (#self.SoundTbl_Fire))], 90, math.random(80, 120), 1)
    self:AddGesture(ACT_RANGE_ATTACK1, true)
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

local runAnim = nil
function ENT:CustomOnThink()
    if (self:GetEnemy() and self.HasRangeAttack==true) then
        local distance = self:GetPos():Distance(self:GetEnemy():GetPos())
        self.AnimSets[self.SelectedAnimSet]["Alerted"](self)
        if (distance < self.RangeDistance and distance > self.RangeToMeleeDistance) then
            
            self.AnimTbl_Run = self.AnimTbl_Walk
        else
            self.AnimTbl_Run = self.RunAnim
        end
    else
        self.AnimSets[self.SelectedAnimSet]["Unalerted"](self)
        if (self.HasRangeAttack==false) then self.AnimTbl_MeleeAttack = {ACT_LEAP} end -- Melee Attack Animations
    end
    self:SetIdleAnimation(self.AnimTbl_IdleStand)
end

function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
    self:SetSkin(1)
end



function ENT:SetUpGibesOnDeath(dmginfo, hitgroup)
    self:EmitSound("phx/explode00.wav", 75, math.random(80, 120), .25)
    util.ScreenShake(self:GetPos(), 5, 1, 0.5, 300)
    ParticleEffect("bsg_explosion", self:GetPos() + self:OBBCenter(), Angle(0,0,0))
    local gibParts = {
        "models/bsg/cylon_chest.mdl",
        "models/bsg/cylon_collar.mdl",
        "models/bsg/cylon_pelvis.mdl",
        "models/bsg/cylon_stomach.mdl",
    }
    for k, v in pairs(self.Limbs) do
        if (v.removed==false) then
            table.Add(gibParts, v.gibs)
        end
    end
    for k, v in pairs(gibParts) do
        local gib = ents.Create("obj_vj_gib")
        gib:SetModel(v)
        gib:SetPos(self:GetPos() + self:OBBCenter())
        gib:SetAngles(Angle(math.random(-180, 180), math.random(-180, 180), math.random(-180, 180)))
        gib:Spawn()
        gib:GetPhysicsObject():SetVelocityInstantaneous(Vector(math.random(-200, 200),math.random(-200, 200),math.random(50, 600)))
        gib:GetPhysicsObject():SetAngleVelocityInstantaneous(Vector(math.random(0, 5000)), Vector(math.random(0, 5000)),Vector(math.random(0, 5000)))
        gib.Collide_Decal = ""
        gib.CollideSound = {"physics/metal/metal_solid_impact_hard1.wav", "physics/metal/metal_solid_impact_hard2.wav", "physics/metal/metal_solid_impact_hard3.wav", "physics/metal/metal_solid_impact_hard4.wav", "physics/metal/metal_solid_impact_hard5.wav", }
    end

	return true, {DeathAnim = false, AllowCorpse = false} -- Return to true if it gibbed!
	/*--------------------------------------
		-- Extra Features --
			Extra features allow you to have more control over the gibbing system.
			--/// Types \\\--
				AllowCorpse -- Should it allow corpse to spawn?
				DeathAnim -- Should it allow death animation?
			--/// Implementing it \\\--
				1. Let's use type DeathAnim as an example. NOTE: You can have as many types as you want!
				2. Put a comma next to return. 		===> return true,
				3. Make a table after the comma. 	===> return true, {}
				4. Put the type(s) that you want.	===> return true, {DeathAnim=true}
				5. And you are done!
				Example with multiple types:		===> return true, {DeathAnim=true,AllowCorpse=true}
	--------------------------------------*/
end

function ENT:CustomOnMeleeAttack_BeforeStartTimer(seed) 
    self:EmitSound("cylon/melee/ready01.ogg", 80, math.random(80, 120), 1)
end

function ENT:CustomOnRemove()
    if (self.DamageSound) then self.DamageSound:Stop() end
end