--[[Creative Commons Legal Code

CC0 1.0 Universal

    CREATIVE COMMONS CORPORATION IS NOT A LAW FIRM AND DOES NOT PROVIDE
    LEGAL SERVICES. DISTRIBUTION OF THIS DOCUMENT DOES NOT CREATE AN
    ATTORNEY-CLIENT RELATIONSHIP. CREATIVE COMMONS PROVIDES THIS
    INFORMATION ON AN "AS-IS" BASIS. CREATIVE COMMONS MAKES NO WARRANTIES
    REGARDING THE USE OF THIS DOCUMENT OR THE INFORMATION OR WORKS
    PROVIDED HEREUNDER, AND DISCLAIMS LIABILITY FOR DAMAGES RESULTING FROM
    THE USE OF THIS DOCUMENT OR THE INFORMATION OR WORKS PROVIDED
    HEREUNDER.

Statement of Purpose

The laws of most jurisdictions throughout the world automatically confer
exclusive Copyright and Related Rights (defined below) upon the creator
and subsequent owner(s) (each and all, an "owner") of an original work of
authorship and/or a database (each, a "Work").

Certain owners wish to permanently relinquish those rights to a Work for
the purpose of contributing to a commons of creative, cultural and
scientific works ("Commons") that the public can reliably and without fear
of later claims of infringement build upon, modify, incorporate in other
works, reuse and redistribute as freely as possible in any form whatsoever
and for any purposes, including without limitation commercial purposes.
These owners may contribute to the Commons to promote the ideal of a free
culture and the further production of creative, cultural and scientific
works, or to gain reputation or greater distribution for their Work in
part through the use and efforts of others.

For these and/or other purposes and motivations, and without any
expectation of additional consideration or compensation, the person
associating CC0 with a Work (the "Affirmer"), to the extent that he or she
is an owner of Copyright and Related Rights in the Work, voluntarily
elects to apply CC0 to the Work and publicly distribute the Work under its
terms, with knowledge of his or her Copyright and Related Rights in the
Work and the meaning and intended legal effect of CC0 on those rights.

1. Copyright and Related Rights. A Work made available under CC0 may be
protected by copyright and related or neighboring rights ("Copyright and
Related Rights"). Copyright and Related Rights include, but are not
limited to, the following:

  i. the right to reproduce, adapt, distribute, perform, display,
     communicate, and translate a Work;
 ii. moral rights retained by the original author(s) and/or performer(s);
iii. publicity and privacy rights pertaining to a person's image or
     likeness depicted in a Work;
 iv. rights protecting against unfair competition in regards to a Work,
     subject to the limitations in paragraph 4(a), below;
  v. rights protecting the extraction, dissemination, use and reuse of data
     in a Work;
 vi. database rights (such as those arising under Directive 96/9/EC of the
     European Parliament and of the Council of 11 March 1996 on the legal
     protection of databases, and under any national implementation
     thereof, including any amended or successor version of such
     directive); and
vii. other similar, equivalent or corresponding rights throughout the
     world based on applicable law or treaty, and any national
     implementations thereof.

2. Waiver. To the greatest extent permitted by, but not in contravention
of, applicable law, Affirmer hereby overtly, fully, permanently,
irrevocably and unconditionally waives, abandons, and surrenders all of
Affirmer's Copyright and Related Rights and associated claims and causes
of action, whether now known or unknown (including existing as well as
future claims and causes of action), in the Work (i) in all territories
worldwide, (ii) for the maximum duration provided by applicable law or
treaty (including future time extensions), (iii) in any current or future
medium and for any number of copies, and (iv) for any purpose whatsoever,
including without limitation commercial, advertising or promotional
purposes (the "Waiver"). Affirmer makes the Waiver for the benefit of each
member of the public at large and to the detriment of Affirmer's heirs and
successors, fully intending that such Waiver shall not be subject to
revocation, rescission, cancellation, termination, or any other legal or
equitable action to disrupt the quiet enjoyment of the Work by the public
as contemplated by Affirmer's express Statement of Purpose.

3. Public License Fallback. Should any part of the Waiver for any reason
be judged legally invalid or ineffective under applicable law, then the
Waiver shall be preserved to the maximum extent permitted taking into
account Affirmer's express Statement of Purpose. In addition, to the
extent the Waiver is so judged Affirmer hereby grants to each affected
person a royalty-free, non transferable, non sublicensable, non exclusive,
irrevocable and unconditional license to exercise Affirmer's Copyright and
Related Rights in the Work (i) in all territories worldwide, (ii) for the
maximum duration provided by applicable law or treaty (including future
time extensions), (iii) in any current or future medium and for any number
of copies, and (iv) for any purpose whatsoever, including without
limitation commercial, advertising or promotional purposes (the
"License"). The License shall be deemed effective as of the date CC0 was
applied by Affirmer to the Work. Should any part of the License for any
reason be judged legally invalid or ineffective under applicable law, such
partial invalidity or ineffectiveness shall not invalidate the remainder
of the License, and in such case Affirmer hereby affirms that he or she
will not (i) exercise any of his or her remaining Copyright and Related
Rights in the Work or (ii) assert any associated claims and causes of
action with respect to the Work, in either case contrary to Affirmer's
express Statement of Purpose.

4. Limitations and Disclaimers.

 a. No trademark or patent rights held by Affirmer are waived, abandoned,
    surrendered, licensed or otherwise affected by this document.
 b. Affirmer offers the Work as-is and makes no representations or
    warranties of any kind concerning the Work, express, implied,
    statutory or otherwise, including without limitation warranties of
    title, merchantability, fitness for a particular purpose, non
    infringement, or the absence of latent or other defects, accuracy, or
    the present or absence of errors, whether or not discoverable, all to
    the greatest extent permissible under applicable law.
 c. Affirmer disclaims responsibility for clearing rights of other persons
    that may apply to the Work or any use thereof, including without
    limitation any person's Copyright and Related Rights in the Work.
    Further, Affirmer disclaims responsibility for obtaining any necessary
    consents, permissions or other rights required for any use of the
    Work.
 d. Affirmer understands and acknowledges that Creative Commons is not a
    party to this document and has no duty or obligation with respect to
    this CC0 or use of the Work.

***Made by rain_bob,if you want to fork this,please dont remove this line***
]]--
AddCSLuaFile()
--Error Library
--Advanced Error
AddCSLuaFile "lib/sh_errors.lua"
include "lib/sh_errors.lua"
--Shared Table
--Share data from server to client
AddCSLuaFile "lib/sh_sharedtable.lua"
include "lib/sh_sharedtable.lua"

--Easy language
--An easy way to do langugage.
AddCSLuaFile "lib/cl_easylang.lua"
include "lib/cl_easylang.lua"

--Create a shared table.
local WEPEDITED=sharedtable.New("RBWEPEDITOR",true)
WE_WEPDEFAULT=sharedtable.New("RBWEDEFAULT",true)

--Modify the weapon
local WE_Modify=function(SWEP,classname,edited)
    local wepmeta=FindMetaTable("Weapon")
    if(edited.PDamage and edited.PDamage~=-1)then
        local damage=edited.PDamage
        if(SWEP.Primary)then
            SWEP.Primary.Damage=damage
        end
    end
    if(edited.SDamage and edited.SDamage~=-1)then
        local damage=edited.SDamage
        if(SWEP.Secondary)then
            SWEP.Secondary.Damage=damage
        end
    end
    if(edited.PDelay and edited.PDelay~=-1)then
        local dl=edited.PDelay
        local setprimfire=wepmeta.SetNextPrimaryFire
        function wepmeta:SetNextPrimaryFire(d)
            if(self:GetClass()==classname)then
                return setprimfire(self,CurTime()+dl)
            end
            return setprimfire(self,d)
        end
        if(SWEP.Primary)then
            SWEP.Primary.Delay=dl
        end
    end
    if(edited.SDelay and edited.SDelay~=-1)then
        local dl=edited.SDelay
        local setprimfire=wepmeta.SetNextSecondaryFire
        function wepmeta:SetNextSecondaryFire(d)
            if(self:GetClass()==classname)then
                return setprimfire(self,CurTime()+dl)
            end
            return setprimfire(self,d)
        end
        if(SWEP.Secondary)then
            SWEP.Secondary.Delay=dl
        end
    end
    if(edited.TakePAmmo and edited.TakePAmmo~=-1)then
        local take=edited.TakePAmmo
        function SWEP:TakePrimaryAmmo()
            local num=take
            -- Doesn't use clips
            if ( self:Clip1() <= 0 ) then
        
                if ( self:Ammo1() <= 0 ) then return end
        
                self:GetOwner():RemoveAmmo( num, self:GetPrimaryAmmoType() )
        
            return end
        
            self:SetClip1( self:Clip1() - num )
        
        end
    end
    if(edited.TakeSAmmo and edited.TakeSAmmo~=-1)then
        local take=edited.TakeSAmmo
        function SWEP:TakeSecondaryAmmo()
            local num=take
            -- Doesn't use clips
            if ( self:Clip1() <= 0 ) then
        
                if ( self:Ammo1() <= 0 ) then return end
        
                self:GetOwner():RemoveAmmo( num, self:GetSecondaryAmmoType() )
        
            return end
        
            self:SetClip2( self:Clip2() - num )
        
        end
    end
    if(edited.ViewModel and edited.ViewModel~="")then
        SWEP.ViewModel=edited.ViewModel
    end
    if(edited.AdminOnly)then
        SWEP.AdminOnly=edited.AdminOnly
    end
    if(edited.PrintName and edited.PrintName~="")then
        SWEP.PrintName=edited.PrintName
    end
    if(edited.Spawnable)then
        SWEP.Spawnable=edited.Spawnable
    end
    if(edited.PAmmo and edited.PAmmo~="")then
        if(SWEP.Primary)then
            SWEP.Primary.Ammo=edited.PAmmo
        end
    end
    if(edited.SAmmo and edited.SAmmo~="")then
        if(SWEP.Secondary)then
            SWEP.Secondary.Ammo=edited.SAmmo
        end
    end
    if(edited.PClip and edited.PClip~=-1)then
        if(SWEP.Primary)then
            SWEP.Primary.ClipSize=edited.PClip
        end
    end
    if(edited.SClip and edited.SClip~=-1)then
        if(SWEP.Secondary)then
            SWEP.Secondary.ClipSize=edited.SClip
        end
    end
    if(edited.HoldType and edited.HoldType~="")then
        SWEP.OldSetHoldType=SWEP.SetHoldType
        function SWEP:SetHoldType()
            return self.OldSetHoldType(edited.HoldType)
        end
    end
    if(edited.VMFOV and edited.VMFOV~=-1)then
        SWEP.ViewModelFOV=edited.VMFOV
    end
    if(edited.PA)then
        if(SWEP.Primary)then
            SWEP.Primary.Automatic=true
        end
    end
    if(edited.SA)then
        if(SWEP.Secondary)then
            SWEP.Secondary.Automatic=true
        end
    end
    for i,v in pairs(edited)do
        if(i=="PrintName" or i=="ViewModel" or v==-1 or v=="-1")then continue end
        SWEP[i]=v
    end
end

--Set Receiver
local oldsweps={}
WEPEDITED:SetReceive(
    function(self)
        timer.Create("WEP EDITOR",0.2,1,function()
            for i,v in pairs(CLIENT and self.tbl or self.tbl:GETT())do
                local SWEP=weapons.GetStored(tostring(i))
                if(SWEP)then
                    oldsweps[i]=v
                    local copyed=table.Copy(v)
                    DoLoop=function(tbl,ignore)
                        local ignore=ignore or {}
                        for k,e in pairs(tbl)do
                            --print(k,e)
                            if(istable(e) and not ignore[e])then
                                ignore[e]=true
                                DoLoop(e,ignore)
                            end
                            if(istable(k) and not ignore[k])then
                                ignore[k]=true
                                DoLoop(k,ignore)
                            end
                            if not istable(k) then
                                if not isstring(k) and not isnumber(k) then
                                    tbl[k]=nil
                                end
                            end
                            if not istable(e) then
                                if not isstring(e) and not isnumber(e) and not isvector(e) and not isangle(e) then
                                    tbl[e]=nil
                                end
                            end
                        end
                    end
                    DoLoop(copyed)
                    --PrintTable(copyed)
                    WE_WEPDEFAULT[i]=copyed
                    WE_Modify(SWEP,i,v)  
                end
            end
            --PrintTable(WE_WEPDEFAULT)
        end)
        --PrintTable(self)
    end
)

local Version=0.1

if(SERVER)then
    --I hate sql.
    local Update=function()
        local jsons=sql.Query("SELECT * FROM weaponedited")
        for i,v in pairs(jsons or {})do
            print(v.ClassName,v)
            local t=util.JSONToTable(v.Json)
            if(t)then
                WEPEDITED.tbl[v.ClassName]=t
            end
        end
    end
    timer.Simple(0,function()
        Update()
    end)
    sql.Query("CREATE TABLE IF NOT EXISTS weaponedited ( ClassName TEXT, Json TEXT, PRIMARY KEY('ClassName'))")
    util.AddNetworkString("rbwepedit_request")
    util.AddNetworkString("rbwepedit_request2")
    util.AddNetworkString("rbwepedit_delete")
    util.AddNetworkString("rbwepedit_deleteall")
    util.AddNetworkString("rbwepedit_restart")
    util.AddNetworkString("rbwepedit_give")
    net.Receive("rbwepedit_request",function(len,ply)
        local cn=net.ReadString()
        local json=net.ReadString()
        if(IsValid(ply) and ply:IsSuperAdmin() and cn and json)then
            sql.Query("INSERT INTO weaponedited (ClassName,Json) VALUES(".. sql.SQLStr(cn) ..",".. sql.SQLStr(json) ..");")
            print(sql.Query("UPDATE weaponedited SET Json = "..sql.SQLStr(json).."WHERE ClassName".."="..sql.SQLStr(cn)..";"))
            print("Weapon edited "..cn.."="..json)
            Update()
        end
    end)
    net.Receive("rbwepedit_request2",function(len,ply)
        local cn=net.ReadString()
        local json=net.ReadString()
        if(IsValid(ply) and ply:IsSuperAdmin() and cn and json)then
            if(IsValid(ply:GetActiveWeapon()))then
                local SWEP=ply:GetActiveWeapon()
                Modify(SWEP,SWEP:GetClass(),util.JSONToTable(json) or {})
            end
        end
    end)
    net.Receive("rbwepedit_delete",function(len,ply)
        local cn=net.ReadString()
        if(IsValid(ply) and ply:IsSuperAdmin() and cn)then
            sql.Query("DELETE FROM weaponedited WHERE ClassName = ".. sql.SQLStr(cn) .. ";")
            Update()
        end
    end)
    net.Receive("rbwepedit_give",function(len,ply)
        local cn=net.ReadString()
        if(IsValid(ply) and ply:IsSuperAdmin() and cn)then
            ply:Give(cn)
            ply:SelectWeapon(cn)
        end
    end)
    net.Receive("rbwepedit_deleteall",function(len,ply)
        if(IsValid(ply) and ply:IsSuperAdmin())then
            ServerLog(ply:SteamID().." Deleted every weapon editor data.")
            sql.Query("DELETE FROM weaponedited;")
            Update()
        end
    end)
    net.Receive("rbwepedit_restart",function(len,ply)
        if(IsValid(ply) and ply:IsSuperAdmin())then
            ServerLog(ply:SteamID().." Restarted map.")
            RunConsoleCommand("changelevel",game.GetMap() or "gm_flatgrass")
        end
    end)
else
    --Moved to client/!rbwepedit_menu.lua
end

