if SERVER then
    AddCSLuaFile("shared.lua")
end

if CLIENT then
    SWEP.PrintName = "Magnet Gun"
    SWEP.Slot = 5
    SWEP.SlotPos = 3
    SWEP.DrawCrosshair = true
end
SWEP.Category = "Scary"
SWEP.Primary.ClipSize = 3
SWEP.Primary.Ammo = "Battery"

SWEP.Secondary.Ammo = "none"

SWEP.Spawnable = true
SWEP.AdminSpawnable = true

SWEP.ViewModel = "models/weapons/v_RPG.mdl"
SWEP.WorldModel = "models/weapons/w_rocket_launcher.mdl"



function SWEP:PrimaryAttack()
    local tr = self.Owner:GetEyeTrace()
    if(IsValid(tr.Entity)) then
        self:EmitSound("weapons/crossbow/bolt_skewer1.wav")
        tr.Entity:EmitSound("ambient/levels/citadel/zapper_warmup1.wav")
        local entpos = tr.Entity:GetPos()
        local li = ents.FindInBox(entpos-Vector(400,400,400), entpos+Vector(400,400,400))
        for i = 1,#li do
            if li[i]:GetClass() == "prop_physics" then
                li[i]:GetPhysicsObject():AddVelocity((entpos-li[i]:GetPos())*(15-li[i]:GetPos():Distance(entpos)/30))
            end
        end
    else
        self:EmitSound("npc/turret_floor/click1.wav")
    end
end

function SWEP:SecondaryAttack()

end