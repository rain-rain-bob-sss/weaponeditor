module("we_error",package.seeall)
ErrorsType={
    NULL_ENTITY="Entity is invalid.",
    NIL="Attempted to use nil value.",
    NOREASON="No Reason.",
    WIP="Work in progress.",--why
    INVALIDMODEL="Invalid model.",
    OVERFLOW="Number overflow.",
    STACKOVERFLOW="Stack overflow.",
    UNDERFLOW="Number underflow."
}
function Error(Reason,Halt)
    if(Halt)then
        _G.Error("")
    end
    if(ErrorsType[Reason])then
        Reason=ErrorsType[Reason]
    end
    local infos={}
    for i=2,1000 do 
        local info=debug.getinfo(i)
        if(not info)then return end
        if(i==2)then
            timer.Simple(0.05,function()
                if info and info.func then
                    if(not info.name)then
                        info.name="?"
                    end
                    MsgC(CLIENT and Color(0,255,0) or Color(71,158,216),"[ERROR]"..Reason.."\nFrom function:"..info.name.."["..info.what.."]".."\nDefined in:"..info.linedefined.." To "..info.lastlinedefined.."\nPath:"..info.short_src.."\n")
                end
            end)
        else
            infos[i]=info
            timer.Create("WEERROR"..Reason,0.2,1,function()
                for i,info in pairs(infos)do
                    MsgC(CLIENT and Color(0,255,0) or Color(71,158,216),"LEVEL:"..i..":\n\tfunction:"..(info.name or "?").."["..info.what.."]".."\n\tDefined in:"..info.linedefined.." To "..info.lastlinedefined.."\n\tPath:"..info.short_src.."\n")
                end
            end)
        end
    end
end