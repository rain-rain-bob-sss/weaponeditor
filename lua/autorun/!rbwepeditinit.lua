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

--Create a shared table.
local WEPEDITED=sharedtable.New("RBWEPEDITOR",true)

--Modify the weapon
local Modify=function(SWEP,classname,edited)
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
                    Modify(SWEP,i,v)  
                end
            end
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
    do 
        local SKIN={}
        SKIN.colTextEntryBG=Color(60,60,60)
        SKIN.colTextEntryBorder=Color(245,245,245)
        SKIN.colTextEntryTextCursor=Color(200,200,200)
        SKIN.colTextEntryTextHighlight=Color(155,155,155)
        derma.DefineSkin("rbwepeditor","stupid skin",table.Merge(SKIN,{},derma.GetDefaultSkin()))
    end
    local BlackList={
        ViewModelFOV=true,
        Spawnable=true,
        AdminOnly=true,
        RenderGroup=true,ClassName=true,Class=true,Base=true,
        Folder=true,ClassNameOverride=true,WepSelectIcon=true,ScriptedEntityType=true,
        Author=true--I DONT Want player being able to edit author
    }
    local ForceInt={
        Slot=true,SlotPos=true,
        Weight=true,WepSelectIcon=true,
    }
    local Booleans={PA="Primary Automatic",SA="Secondary Automatic",AdminOnly="Admin Only",Spawnable="Spawnable"}
    local BoolsVar={
        PA=function(SWEP) if(SWEP.Primary)then return SWEP.Primary.Automatic else return false end end,
        SA=function(SWEP) if(SWEP.Secondary)then return SWEP.Secondary.Automatic else return false end end,
        AdminOnly=function(SWEP) return SWEP.AdminOnly end,
        Spawnable=function(SWEP) return SWEP.Spawnable end
    }
    local Ints={PDamage="Primary Damage",SDamage="Secondary Damage",PClip="Primary Clipsize",SClip="Secondary Clipsize"}
    local IntsVar={
        PDamage=function(SWEP) if(SWEP.Primary)then return SWEP.Primary.Damage else return -1 end end,
        SDamage=function(SWEP) if(SWEP.Secondary)then return SWEP.Secondary.Damage else return -1 end end,
        PClip=function(SWEP) if(SWEP.Primary)then return SWEP.Primary.ClipSize else return -1 end end,
        SClip=function(SWEP) if(SWEP.Secondary)then return SWEP.Secondary.ClipSize else return -1 end end,
    }
    local Floats={PDelay="Primary delay",SDelay="Secondary delay",VMFOV="Viewmodel FOV"}
    local FloatsVar={
        PDelay=function(SWEP) if(SWEP.Primary)then return SWEP.Primary.Delay else return -1 end end,
        SDelay=function(SWEP) if(SWEP.Secondary)then return SWEP.Secondary.Delay else return -1 end end,
        VMFOV=function(SWEP) return SWEP.ViewModelFOV or -1 end
    }
    local Strings={PrintName="Weapon Name"}
    local StringsVar={
        PrintName=function(SWEP) if((SWEP.PrintName=="" or not SWEP.PrintName) and language.GetPhrase(SWEP.ClassName) and language.GetPhrase(SWEP.ClassName)~="" and language.GetPhrase(SWEP.ClassName)~=SWEP.ClassName)then return language.GetPhrase(SWEP.ClassName) end return SWEP.PrintName or "" end
    }
    for i,v in pairs(Booleans)do
        BlackList[i]=true
    end
    for i,v in pairs(Ints)do
        BlackList[i]=true
    end
    for i,v in pairs(Floats)do
        BlackList[i]=true
    end
    for i,v in pairs(Strings)do
        BlackList[i]=true
    end
    local Open=function()
        local red=Color(255,0,0,255)
        local bg=Color(35,35,35)
        local tc=TEXT_ALIGN_CENTER
        local Main = vgui.Create( "DFrame" )
        Main:SetSize(1200,700)
        Main:Center()
        Main:SetTitle("")
        Main:SetVisible(true)
        Main:SetDraggable(true)
        Main:ShowCloseButton(true)
        Main:MakePopup()
        local notadmin=not LocalPlayer():IsSuperAdmin()
        --local notadmin=true
        function Main:Paint(w,h)
            draw.RoundedBox(15,2,2,w-4,h-4,bg)
            if(notadmin)then
                for i=1,360,12 do
                    draw.DrawText("You're not admin!","DermaLarge",600+math.sin(RealTime()+math.deg(i))*400,350+math.cos(RealTime()+math.deg(i))*300,red,tc)
                end
                draw.DrawText("Weapon Editor By [TW]Rain_Bob","DermaLarge",600,350+math.cos(RealTime()*2)*64,Color(0,255,0),tc)
            end
        end
        if(notadmin)then return end
        local Title=vgui.Create("DLabel",Main)
        Title:SetText("Weapon Editor")
        Title:AlignLeft(15)
        Title:AlignTop(7.5)
        Title:SetSize(350,25)
        Title:SetFont("DermaLarge")
        Title:SetTextColor(Color(228, 231, 237))
        local WeaponName=vgui.Create("DLabel",Main)
        WeaponName:SetText("")
        WeaponName:AlignLeft(15)
        WeaponName:AlignBottom(120)
        WeaponName:SetWrap(true)
        WeaponName:SetSize(350,85)
        WeaponName:SetFont("CloseCaption_Normal")
        WeaponName:SetTextColor(Color(228, 231, 237))
        local get=vgui.Create("DButton",Main)
        get:SetText("Get Current\nHolding Weapon")
        get:AlignLeft(15)
        get:AlignBottom(35/2+10)
        get:SetSize(100,35)
        --get:SetFont("CloseCaption_Normal")
        function get:DoClick()
            local wep=LocalPlayer():GetActiveWeapon()
            if(IsValid(wep) and Main.Rows[wep:GetClass()])then
                Main.List:OnRowSelected(0,Main.Rows[wep:GetClass()])
            else
                self:SetText("Non lua weapon\n/Not sent to client")
                self:SetEnabled(false)
                timer.Create("vgui_get_resettext",1,1,function()
                    if(IsValid(self))then
                        self:SetText("Get Current\nHolding Weapon")
                        self:SetEnabled(true)
                    end
                end)
            end
        end
        local give=vgui.Create("DButton",Main)
        give:SetText("Give\nselected weapon")
        give:AlignLeft(100/2+30+100/2)
        give:AlignBottom(35/2+10)
        give:SetSize(100,35)
        give:SetEnabled(false)
        --get:SetFont("CloseCaption_Normal")
        function give:DoClick()
            if(Main.Selected)then
                if(Main.SWEP.Spawnable and GAMEMODE.IsSandboxDerived)then
                    RunConsoleCommand("gm_giveswep",Main.Selected)
                else                                                                                                                           
                    if net.Start("rbwepedit_give") then
                        net.WriteString(Main.Selected)
                        net.SendToServer()
                    end
                end
            end
        end
        local mdlxoffset=550-320/2
        local greenscreen=vgui.Create("DPanel",Main)
        greenscreen:AlignLeft(mdlxoffset)
        greenscreen:AlignTop(80)
        greenscreen:SetSize(320,320)
        greenscreen:SetBackgroundColor(Color(0,255,0,255))
        local Model=vgui.Create("DModelPanel",Main)
        Model:SetModel( "models/player/alyx.mdl" )
        Model:AlignLeft(550-320/1.5)
        Model:AlignTop(80)
        Model:SetSize(320,320)
        Model:SetVisible(false)
        Model:SetFOV(70)
        local KillIcon=vgui.Create("DKillIcon",Main)
        KillIcon:AlignLeft(mdlxoffset)
        KillIcon:AlignTop(80+330)
        KillIcon:SetName("")
        KillIcon:SetSize(320,320)
        KillIcon:SetVisible(false)
        local ol=ClientsideModel("models/player/alyx.mdl")
        ol:SetNoDraw(true)
        ol:SetColor(Color(0,0,0))
        ol:SetMaterial("model_color")
        ol:SetParent(Model:GetEntity())
        ol:SetPos(Vector(0,-3,0))
        ol:SetAngles(Angle(0,0,0))
        local scale=Vector(1,1,1)
        function Model:PostDrawModel()
            local matrix = Matrix()
			matrix:Scale(scale)
            render.SetColorModulation(0,0,0)
            for x=-2,2 do
                for y=-1,-1 do
                    for z=-2,2 do
                        matrix:SetTranslation(Vector(x*0.125,y*0.25,z*0.25))
                        ol:EnableMatrix( "RenderMultiply", matrix )
                        ol:DrawModel()
                    end
                end
            end
            render.SetColorModulation(1,1,1)
        end
        Model.Ol=ol
        local List=vgui.Create("DListView",Main)
        --List:Dock(LEFT)
        List:AlignTop(35)
        List:AlignLeft(10)
        List:SetSize(200,350)
        Main.Rows={}
        Main.List=List

        local Column=List:AddColumn("Weapons")
        function Column.Header:Paint(w,h)
            draw.RoundedBox(5,0,0,w,h,Color(165,228,249))
        end
        function List.VBar:Paint(w,h)
            draw.RoundedBox(5,0,0,w,h,Color(80,80,80))
        end
        Column.DraggerBar:SetCursor( "" )
        for i,v in pairs(weapons.GetList())do
            local row=List:AddLine((v.PrintName~="" and v.PrintName) and v.PrintName or v.ClassName)
            row.ClassName=v.ClassName
            row:SetToolTip(row.ClassName)
            row.Name=v.PrintName or v.ClassName
            function row:Paint(w,h)
                draw.RoundedBox(5,0,0,w,h,Color(38,100,122))
                if(self:IsHovered() or Main.SelectedRow==self)then
                    draw.RoundedBox(0,-2,-2,w+2,h+2,Main.SelectedRow==self and Color(0,169,231) or Color(103,214,255))
                end
            end
            row.SWEP=v
            Main.Rows[v.ClassName]=row
        end

        function List:OnRowSelected(index,row)
            self:ClearSelection()
            give:SetEnabled(true)
            KillIcon:SetVisible(true)
            KillIcon:SetName(row.ClassName)
            KillIcon:SizeToContents()
            Main.Selected=row.ClassName
            Main.SelectedRow=row
            Main.SWEP=row.SWEP
            Main.Scroll:Create()
            Main.Scroll.Apply:SetEnabled(true)
            Model:SetModel(Main.SWEP.WorldModel or "models/error.mdl")
            Model:SetVisible(true)
            Model:SetCamPos(Vector(10,65,-10))
            ol:SetModel(Main.SWEP.WorldModel or "models/error.mdl")
            local size=35
            if(IsValid(Model:GetEntity()))then
                local mins,maxs=Model:GetEntity():GetModelRenderBounds()
                size=maxs:Length()*1.25
                Model:SetCamPos(Vector(0,size,-5)+maxs/2)
                Model:GetEntity():SetMaterial("model_color")
            end
            function Model:LayoutEntity(ent)

                -- Point camera toward the look pos
                --local lookAng = (self.vLookatPos-self.vCamPos):Angle()
                local lookAng=Angle(0,-90,0)
                
                -- Rotate the look angles based on incrementing yaw value
                lookAng:RotateAroundAxis(Vector(0, 1, 0),0)
                
                -- Set camera look angles
                self:SetLookAng(lookAng)
            end
            WeaponName:SetText(row.Name)
            WeaponName:SizeToContents()
            local w,h=WeaponName:GetSize()
            WeaponName:SetSize(350,h)
            WeaponName:AlignBottom(80+h/2)
        end

        local Scroll = vgui.Create( "DScrollPanel", Main )
        Main.Scroll=Scroll
        Scroll:SetSize(400,665)
        Scroll:AlignRight(50)
        Scroll:AlignTop(20)
        function Scroll:Create()
            local bg=Color(60,60,60)
            self:Clear()
            local tip=vgui.Create("DLabel")
            tip:SetTextColor(Color(228, 231, 237))
            tip:Dock(TOP)
            tip:DockMargin(0,0,0,15)
            tip:SetText("Note:-1=Keep current value\nOn Text entrys,blank=Keep current value\nHover on text entrys to see tooltip.\nSome are not editable by this weapon editor\nBecause weapon coding problem.")
            tip:SetTooltip("Weapon editor by [TW]Rain_bob :)")
            tip:SizeToContents()
            self:Add(tip)
            Scroll.Ints={}
            for i,v in pairs(Ints)do
                local Int=vgui.Create("DNumSlider")
                Int.Var=i
                Int:Dock( TOP )
                Int:DockMargin( 0, 0, 0, 5 )
                Int:SetMax(100000)
                Int:SetMin(-100000)
                Int:SetDecimals(0)
                Int:SetSize(500,20)
                Int:SetText(v)
                Int.Label:SetTextColor(Color(228, 231, 237))
                Int:ApplySchemeSettings()
                local vf=IntsVar[i]
                if(vf and Main.Selected)then
                    Int:SetValue(vf(Main.SWEP))
                end 
                self:Add(Int)
                Scroll.Ints[i]=Int
            end
            Scroll.Floats={}
            for i,v in pairs(Floats)do
                local Float=vgui.Create("DNumSlider")
                Float.Var=i
                Float:Dock( TOP )
                Float:DockMargin( 0, 0, 0, 5 )
                Float:SetMax(100000)
                Float:SetMin(-100000)
                Float:SetSize(500,20)
                Float:SetText(v)
                Float.Label:SetTextColor(Color(228, 231, 237))
                Float:ApplySchemeSettings()
                local vf=FloatsVar[i]
                if(vf and Main.Selected)then
                    Float:SetValue(vf(Main.SWEP))
                end 
                self:Add(Float)
                Scroll.Floats[i]=Float
            end
            Scroll.Bools={}
            for i,v in pairs(Booleans)do
                local Panel=vgui.Create("DPanel")
                Panel:Dock(TOP)
                Panel:DockMargin(0,2,380/4,2)
                Panel:SetBGColor(0,0,0,0)
                Panel:SetPaintBackground(false)
                local Bool=vgui.Create("DCheckBoxLabel",Panel)
                Bool.Var=i
                --Bool:SetTextColor(Color(20,20,20))
                --Bool:SetSize(120,20)
                Bool:SetText(v)
                Bool:SizeToContents()
                Bool.Label:SetTextColor(Color(228, 231, 237))
                local vf=BoolsVar[i]
                if(vf and Main.Selected)then
                    Bool:SetChecked(vf(Main.SWEP) or false)
                end 
                Scroll.Bools[i]=Bool
                self:Add(Panel)
            end
            Scroll.Strings={}
            for i,v in pairs(Strings)do
                local String=vgui.Create("DTextEntry")
                String.Var=i
                String:Dock(TOP)
                String:SetToolTip(v)
                String:SizeToContents()
                String:SetSkin("rbwepeditor")
                --String:SetTextColor(Color(228, 231, 237))
                --String:SetDark(true)
                --function String:Paint() return false end
                local vf=StringsVar[i]
                if(vf and Main.Selected)then
                    String:SetValue(vf(Main.SWEP) or false)
                end 
                Scroll.Strings[i]=String
                self:Add(String)
            end
            if(Main.SWEP)then
                for i,v in pairs(Main.SWEP)do
                    if(type(v)=="number" and not BlackList[i])then
                        local Float=vgui.Create("DNumSlider")
                        Float.Var=i
                        if(ForceInt[i])then
                            Float:SetDecimals(0)
                        end
                        Float:Dock( TOP )
                        Float:DockMargin( 0, 0, 0, 5 )
                        Float:SetMax(100000)
                        Float:SetMin(-100000)
                        Float:SetSize(500,20)
                        Float:SetText(i)
                        Float:SetValue(v)
                        Float.Label:SetTextColor(Color(228, 231, 237))
                        Float:ApplySchemeSettings()
                        self:Add(Float)
                        Scroll.Floats[i]=Float
                    elseif(isbool(v) and not BlackList[i])then
                        local Panel=vgui.Create("DPanel")
                        Panel:Dock(TOP)
                        Panel:DockMargin(0,2,380/4,2)
                        Panel:SetBGColor(0,0,0,0)
                        Panel:SetPaintBackground(false)
                        local Bool=vgui.Create("DCheckBoxLabel",Panel)
                        Bool.Var=i
                        --Bool:SetTextColor(Color(20,20,20))
                        --Bool:SetSize(120,20)
                        Bool:SetText(i)
                        Bool:SizeToContents()
                        Bool:SetValue(v)
                        Bool.Label:SetTextColor(Color(228, 231, 237))
                        self:Add(Panel)
                        Scroll.Bools[i]=Bool
                    elseif(isstring(v) and not BlackList[i])then
                        local String=vgui.Create("DTextEntry")
                        String.Var=i
                        String:Dock(TOP)
                        String:SetToolTip(i)
                        String:SizeToContents()
                        String:SetValue(v)
                        String:SetSkin("rbwepeditor")
                        --String:SetTextColor(Color(228, 231, 237))
                        --function String:Paint() return false end
                        Scroll.Strings[i]=String
                        self:Add(String)
                    end
                end
            end
            local Apply=vgui.Create("DButton")
            Apply:Dock(TOP)
            Apply:SetText("Apply")
            Apply:SetEnabled(false)
            Apply:SetTooltip("Right Click to temporary edit this weapon(the one you holding)")
            Scroll.Apply=Apply
            function Apply:DoClick()
                if(not Main.SWEP)then
                    return true
                end
                local vars={}
                for i,v in pairs(Scroll.Ints)do
                    vars[i]=math.floor(v:GetValue())
                end
                for i,v in pairs(Scroll.Floats)do
                    if(ForceInt[i])then vars[i]=math.floor(v:GetValue()) continue end
                    vars[i]=v:GetValue()
                end
                for i,v in pairs(Scroll.Bools)do
                    vars[i]=v:GetChecked()
                end
                for i,v in pairs(Scroll.Strings)do
                    vars[i]=string.Replace(tostring(v:GetValue()),"\\n","\n")
                end
                PrintTable(vars)
                local json=util.TableToJSON(vars,false)
                if net.Start("rbwepedit_request") then
                    net.WriteString(Main.Selected)
                    net.WriteString(json)
                    net.SendToServer()
                end
            end
            function Apply:DoRightClick()
                if(not Main.SWEP)then
                    return true
                end
                local vars={}
                for i,v in pairs(Scroll.Ints)do
                    vars[i]=math.floor(v:GetValue())
                end
                for i,v in pairs(Scroll.Floats)do
                    if(ForceInt[i])then vars[i]=math.floor(v:GetValue()) continue end
                    vars[i]=v:GetValue()
                end
                for i,v in pairs(Scroll.Bools)do
                    vars[i]=v:GetChecked()
                end
                local json=util.TableToJSON(vars,false)
                local SWEP=LocalPlayer():GetActiveWeapon()
                if IsValid(SWEP) and net.Start("rbwepedit_request2") and SWEP:GetClass()==Main.Selected then
                    Modify(SWEP,SWEP:GetClass(),vars)
                    net.WriteString(Main.Selected)
                    net.WriteString(json)
                    net.SendToServer()
                end
            end
            self:Add(Apply)
            local DeleteAll=vgui.Create("DButton")
            DeleteAll:Dock(TOP)
            DeleteAll:SetText("Delete Every Weapon Editor data")
            Scroll.DeleteAll=DeleteAll
            function DeleteAll:DoClick()
                Derma_Query(
                    "Are you sure about to delete every data?",
                    "Confirmation:",
                    "Yes",
                    function() 
                        if net.Start("rbwepedit_deleteall") then net.SendToServer() end 
                        Derma_Query("It requires restart map to reset weapons. Do you want to restart map?",
                            "Confirmation:",
                            "Restart",
                            function()
                                if net.Start("rbwepedit_restart") then
                                    net.SendToServer()
                                end
                            end,
                            "No",
                            function() 

                            end
                        )
                    end,
                    "No",
                    function() end
                )
            end
            self:Add(DeleteAll)
            local Delete=vgui.Create("DButton")
            Delete:Dock(TOP)
            Delete:SetText("Delete This Weapon data")
            Scroll.Delete=Delete
            function Delete:DoClick()
                if(not Main.SWEP)then return true end
                Derma_Query(
                    "Are you sure about to delete every data?",
                    "Confirmation:",
                    "Yes",
                    function() 
                        if net.Start("rbwepedit_delete") then net.WriteString(Main.Selected) net.SendToServer() end 
                        Derma_Query("It requires restart map to reset this weapon. Do you want to restart map?",
                            "Confirmation:",
                            "Restart",
                            function()
                                if net.Start("rbwepedit_restart") then
                                    net.SendToServer()
                                end
                            end,
                            "No",
                            function() 

                            end
                        )
                    end,
                    "No",
                    function() end
                )
            end
            self:Add(Delete)
        end
        Scroll:Create()
    end
    concommand.Add("rbwepedit_menu",function()
        Open()
    end)
end

