include "lib/cl_easylang.lua"
local langs={
    ['zh-TW']={
        PA="主攻擊自動",SA="副攻擊自動",
        AdminOnly="管理員",PDamage="主攻擊傷害",SDamage="副攻擊傷害",
        PClip="主彈匣",SClip="副彈匣",
        PDelay="主攻擊間隔",SDelay="副攻擊間隔",Spawnable="可生成",wepname="武器名稱",
        notadmin="你不是管理員!",
        wepeditor="武器編輯器",getholding="得到目前\n拿著的武器",invaildhold="不是LUA武器\n或沒被發送到客戶端",give="給予被\n選取的武器",
        tip=[[
        -1是保持不變,某些武器的數值無法被改變,
        因為那些武器沒按照好大多武器的規矩
        滑鼠放在文字框框上,可看見數值的鍵.
        ]],
        right="右鍵可以暫時修改你手上拿著的武器,請確保你拿著的武器跟你選取的是同一把!",
        delete="刪除掉這個武器編輯數據",
        deletea="刪除所有武器編輯數據!",
        apply="應用",
        --NS="射出的子彈數量"
    },
    ['zh-CN']={
        PA="主攻击自动",SA="副攻击自动",
        AdminOnly="管理员",PDamage="主攻击伤害",SDamage="副攻击伤害",
        PClip="主弹匣",SClip="副弹匣",
        PDelay="主攻击间隔",SDelay="副攻击间隔",Spawnable="可生成",wepname="武器名称",
        notadmin="你不是管理员！",
        wepeditor="武器修改器",getholding="得到目前\n拿着的武器",invaildhold="不是LUA武器\n或没被发送到客户端",give="给予被\n选取的武器",
        tip=[[
        -1是保持不变,某些武器的数值无法被改变，
        因为那些武器没按照好大多武器的规矩。
        鼠标放在文字框框上，可看见数值的键。
        ]],
        right="右击可以暂时修改你手上拿着的武器，请确保你拿着的武器跟你选取的是同一把！",
        delete="删除掉这个武器编辑数据",
        deletea="删除所有武器编辑数据!",
        apply="应用",
        --NS="射出的子彈數量"
    },
    ["ru"]={
        PA="Первичный автоматический",
		SA="Вторичный автоматический",
        AdminOnly="Только для администраторов",
		PDamage="Первичный урон",
		SDamage="Вторичный урон",
        PClip="Первичный клип (он же Clip1)",
		SClip="Вторичный клип (он же Clip2)",
        PDelay="Задержка первичной атаки",
		SDelay="Задержка вторичной атаки",
		Spawnable="Можно заспавнить?",
		wepname="Название оружия",
        notadmin="Вы не администратор!",
        wepeditor="Редактор оружия",
		getholding="Получить текущее\n удерживаемое оружие",
		invalidhold="Не SWEP\nИли не отправлено клиенту.",
		give="Отдать\nвыбранное оружие",
        tip="Примечание:-1=Оставить текущее значение\nДля текстовых записей",
		blank="Оставить текущее значение\nНаведите курсор на текстовые записи, чтобы увидеть подсказку.\nНекоторые не редактируются этим редактором оружия\nПо причине проблем с кодом оружия.",
        right="Щелкните правой кнопкой мыши для временного редактирования этого оружия, пожалуйста, убедитесь, что вы держите то же оружие, что и выбранное.",
        delete="Удалить данные редактирования этого оружия",
        deletea="Удалить все данные о редактировании оружия!",
        apply="Применить"
    },
    ["tr"]={
	PA="Birincil otomatik",
	SA="İkincil otomatik",
	AdminOnly="Sadece yönetici",
	PDamage="Birincil hasar",
	SDamage="İkincil hasar",
 	PClip="Birincil şarjör (diğer adıyla Clip1)",
	SClip="İkincil şarjör(diğer adıyla Clip2)",
 	PDelay="Birincil saldırı gecikmesi",
	SDelay ="İkincil saldırı gecikmesi",
	Spawnable ="Oluşturulabilir",
	wepname="Silah Adı",
 	notadmin="Yönetici değilsin!",
 	wepeditor="Silah Düzenleyici",
	getholding ="Tutulan silahı\n al",invalidhold ="SWEP değil \n veya kullanıcıya gönderilmedi.",give="Seçili\nsilahı ver",
 	tip='Not:-1=Mevcut değeri koru\nMetin girişlerinde,boş=Mevcut değeri koru\nAraç ipucunu görmek için metin girişlerinin üzerine gel.\nBazıları silah düzenleyicisi tarafından düzenlenemez\nçünkü silah kodlamasında sorun var.',
 	right="Bu silahı geçici olarak düzenlemek için sağ tıkla,lütfen seçilen silahla elindeki silahın aynı olduğundan emin ol.",
 	delete="Silah düzenleme verilerini sil.",
 	deletea="Bütün silah düzenleme verilerini sil!",
	"apply":"Uygula",
	 --NS="Atılan Mermi Sayısı"
    },
    def={
        PA="Primary automatic",SA="Secondary automatic",
        AdminOnly="Admin only",PDamage="Primary damage",SDamage="Secondary damage",
        PClip="Primary clip(aka Clip1)",SClip="Secondary clip(aka Clip2)",
        PDelay="Primary attack delay",SDelay="Secondary attack delay",Spawnable="Spawnable",wepname="Weapon Name",
        notadmin="You're not admin!",
        wepeditor="Weapon Editor",getholding="Get current\nholding weapon",invalidhold="Not SWEP\nOr not sent to client.",give="Give\nselected weapon",
        tip='Note:-1=Keep current value\nOn Text entrys,blank=Keep current value\nHover on text entrys to see tooltip.\nSome are not editable by this weapon editor\nBecause weapon coding problem.',
        right="Right Click to temporary edit this weapon,please make sure you're holding the same as selected weapon.",
        delete="Delete this weapon edit data.",
        deletea="Delete every weapon edit data!",
        apply="Apply",
        --NS="NumShots"
    }
}
we_easylang.DoLang(langs)
concommand.Add("rbwepeditor_refreshlangs",function()
    we_easylang.DoLang(langs)
end)
local function TableInherit( t, base )

	for k, v in pairs( base ) do

		if ( t[ k ] == nil ) then
			t[ k ] = v
		elseif ( k != "BaseClass" && istable( t[ k ] ) && istable( v ) ) then
			TableInherit( t[ k ], v )
		end

	end

	t[ "BaseClass" ] = base

	return t

end
function WE_Get_Wep( name, retval )

	local Stored = weapons.GetStored( name )
	if ( !Stored ) then return nil end

	-- Create/copy a new table
	local retval = retval or {}
	for k, v in pairs( Stored ) do
		if ( istable( v ) ) then
			retval[ k ] = table.Copy( v )
		else
			retval[ k ] = v
		end
	end
	retval.Base = retval.Base or "weapon_base"

	-- If we're not derived from ourselves (a base weapon)
	-- then derive from our 'Base' weapon.
	if ( retval.Base != name ) then

		local base = WE_Get_Wep( retval.Base )

		if ( !base ) then
			Msg( "ERROR: Trying to derive weapon " .. tostring( name ) .. " from non existant SWEP " .. tostring( retval.Base ) .. "!\n" )
		else
			retval = TableInherit( retval, base )
		end

	end

	return retval
end
local el=we_easylang
local getlang=el.GetLang
local getphrase=el.GetLangPhrase
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
local Booleans={PA=getlang("PA"),SA=getlang("SA"),AdminOnly=getlang("AdminOnly"),Spawnable=getlang("Spawnable")}
local BoolsVar={
    PA=function(SWEP) if(SWEP.Primary)then return SWEP.Primary.Automatic or false else return false end end,
    SA=function(SWEP) if(SWEP.Secondary)then return SWEP.Secondary.Automatic or false else return false end end,
    AdminOnly=function(SWEP) return SWEP.AdminOnly end,
    Spawnable=function(SWEP) return SWEP.Spawnable end
}
local Ints={PDamage=getlang("PDamage"),SDamage=getlang("SDamage"),PClip=getlang("PClip"),SClip=getlang("SClip")
--,NS=getlang("NS")
}
local IntsVar={
    PDamage=function(SWEP) if(SWEP.Primary)then return SWEP.Primary.Damage or -1 else return -1 end end,
    SDamage=function(SWEP) if(SWEP.Secondary)then return SWEP.Secondary.Damage or -1 else return -1 end end,
    PClip=function(SWEP) if(SWEP.Primary)then return SWEP.Primary.ClipSize or -1 else return -1 end end,
    SClip=function(SWEP) if(SWEP.Secondary)then return SWEP.Secondary.ClipSize or -1 else return -1 end end,
    NS=function(SWEP) if(SWEP.Primary)then return SWEP.Primary.NumShots or -1 else return -1 end end
}
local Floats={PDelay=getlang("PDelay"),SDelay=getlang("SDelay"),VMFOV="Viewmodel FOV"}
local FloatsVar={
    PDelay=function(SWEP) if(SWEP.Primary)then  return SWEP.Primary.Delay or -1 else return -1 end end,
    SDelay=function(SWEP) if(SWEP.Secondary)then  return SWEP.Secondary.Delay or -1 else return -1 end end,
    VMFOV=function(SWEP) return SWEP.ViewModelFOV or -1 end
}
local Strings={PrintName=getlang("wepname")}
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
                draw.DrawText(getphrase("notadmin"),"DermaLarge",600+math.sin(RealTime()+math.deg(i))*400,350+math.cos(RealTime()+math.deg(i))*300,red,tc)
            end
            draw.DrawText("Weapon Editor --[TW]Rain_Bob","DermaLarge",600,350+math.cos(RealTime()*2)*64,Color(0,255,0),tc)
        end
    end
    if(notadmin)then return end
    local Title=vgui.Create("DLabel",Main)
    Title:SetText(getlang("wepeditor"))
    Title:AlignLeft(15)
    Title:AlignTop(4.5)
    Title:SetSize(350,45)
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
    get:SetText(getlang("getholding"))
    get:AlignLeft(15)
    get:AlignBottom(35/2+10)
    get:SetSize(100,35)
    --get:SetFont("CloseCaption_Normal")
    function get:DoClick()
        local wep=LocalPlayer():GetActiveWeapon()
        if(IsValid(wep) and Main.Rows[wep:GetClass()])then
            Main.List:OnRowSelected(0,Main.Rows[wep:GetClass()])
        else
            self:SetText(getlang("invalidhold"))
            self:SetEnabled(false)
            timer.Create("vgui_get_resettext",1,1,function()
                if(IsValid(self))then
                    self:SetText(getlang("getholding"))
                    self:SetEnabled(true)
                end
            end)
        end
    end
    local give=vgui.Create("DButton",Main)
    give:SetText(getlang("give"))
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
    List:AlignTop(45)
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
        row.SWEP=WE_Get_Wep(v.ClassName)
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
        tip:SetText(getlang("tip"))
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
        Apply:SetText(getlang("apply"))
        Apply:SetEnabled(false)
        Apply:SetTooltip(getlang("right"))
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
                WE_Modify(SWEP,SWEP:GetClass(),vars)
                net.WriteString(Main.Selected)
                net.WriteString(json)
                net.SendToServer()
            end
        end
        self:Add(Apply)
        local DeleteAll=vgui.Create("DButton")
        DeleteAll:Dock(TOP)
        DeleteAll:SetText(getlang("deletea"))
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
        Delete:SetText(getlang("delete"))
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
--aaa
concommand.Add("rbwepedit_menu",function()
    Open()
end)
