include "lib/cl_easylang.lua"
local langs={
    ['zh-TW']={
        simple_stuff="簡易",
        wepeditor="武器編輯器",
        openwepeditor="打開武器編輯器"
    },
    ['zh-CN']={
        simple_stuff="简易",
        wepeditor="武器修改器",
        openwepeditor="开启武器修改器"
    },
    ['tr']={
        simple_stuff="Basit",
        wepeditor="Silah Düzenleyici",
        openwepeditor="Silah Düzenleyici Menüsünü Aç"
    },
    def={
        simple_stuff="Simple",
        wepeditor="Weapon Editor",
        openwepeditor="Open Weapon Editor Menu"
    }
}
we_easylang.DoLang(langs)
concommand.Add("rbwepeditor_smrefreshlangs",function()
    we_easylang.DoLang(langs)
end)
hook.Add("PopulateToolMenu","rbwepedit_spawnmenu",function()
    spawnmenu.AddToolMenuOption("Rain","#rb_simple_stuff","wepeditor","#rb_wepeditor","","",function(panel)
		panel:Button("#rb_openwepeditor","rbwepedit_menu")
	end)
end)
hook.Add("WE_UPDATELANG","rbwepeditor_spawnmenu update lang",function()
	we_easylang.DoLang(langs)
end)
