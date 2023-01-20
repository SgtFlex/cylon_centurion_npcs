AddCSLuaFile()
ENT.Type = "ai"
ENT.Base = "base_ai"
ENT.Spawnable		= true
ENT.AutomaticFrameAdvance = true
ENT.Category = "Battlestar Galactica"
ENT.PrintName = "Cylon Centurion V2"
ENT.Author = "SgtFlex"

ENT.m_fMaxYawSpeed = 200

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

if SERVER then
	local schedule = ai_schedule.New("MySchedule")
	schedule:EngTask("TASK_TARGET_PLAYER", 0)
	schedule:EngTask("TASK_FACE_TARGET", 0)
	schedule:EngTask("TASK_GET_PATH_TO_PLAYER", 0)
	schedule:EngTask("TASK_RUN_PATH", 0)
	schedule:EngTask("TASK_WAIT_FOR_MOVEMENT_STEP", 0)

	

	function ENT:SelectSchedule()
		self:StartSchedule(schedule)
	end
	
	function ENT:Initialize()
		self:SetSaveValue("m_vecLastPosition", Vector(0,0,0))
		self:SetModel( "models/bsg/cylon_centurion3.mdl" )
		self:SetHullType(HULL_HUMAN)
		self:SetHullSizeNormal()

		self:SetNPCState(NPC_STATE_IDLE)
		self:SetSolid(SOLID_BBOX)
		self:DropToFloor()

		self:SetHealth(25)
		self:CapabilitiesAdd(CAP_MOVE_GROUND)
		
		self:SetMoveType(MOVETYPE_STEP)
	end

	function ENT:OnTakeDamage(dmginfo)
		self:SetHealth(self:Health() - dmginfo:GetDamage())
		if (self:Health() <= 0) then
			SafeRemoveEntity(self)
		end
	end

	function ENT:AcceptInput(key, activator, caller, data)
		if inputs[key] then inputs[key](self) end
	end
end

function ENT:Think()
	self:NextThink(CurTime())
	return true
end


-- if CLIENT then
-- 	function ENT:Draw()
-- 		self:DrawModel()
-- 	end
-- end

list.Set( "NPC", "npc_cylon", {
	Name = ENT.PrintName,
	Class = "npc_cylon",
	Category = ENT.Category
})