module("we_easylang",package.seeall)
if(SERVER)then return end
local lang=GetConVar("gmod_language"):GetString()
timer.Create("we_easylang_update lang",1.5,0,function()
    local langcvarstr=GetConVar("gmod_language"):GetString()
    if lang~=langcvarstr then
        local olang=lang
        lang=langcvarstr
        hook.Run("WE_UPDATELANG",olang,langcvarstr)
    end
end)
function DoLang(langs)
    local lan=lang
    if(not langs[lang])then
        lan="def"
    end
    for l,t in pairs(langs)do
        if(l==lan)then
            for i,v in pairs(t)do
                language.Add("rb_"..i,v)
            end
            if lan~="def" then
                table.Inherit(langs["def"],t)
            end
            break
        end
    end
end
function GetLang(lang)
    return "#rb_"..lang
end
function GetLangPhrase(lang)
    return language.GetPhrase("rb_"..lang)
end
