module("we_easylang",package.seeall)
if(SERVER)then return end
local lang=GetConVar("gmod_language"):GetString()
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
        end
    end
end
function GetLang(lang)
    return "#rb_"..lang
end
function GetLangPhrase(lang)
    return language.GetPhrase("rb_"..lang)
end