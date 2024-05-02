module("sharedtable",package.seeall)
local id=debug.getinfo(1,"S").short_src
local shareds={}
local waiting={}
local sharedtable={}
if(SERVER)then
    util.AddNetworkString("sharedtable_update")
    util.AddNetworkString("sharedtable_updatej")
else
    local function Received(name,newtbl)
        shareds[name].tbl=newtbl
        if(shareds[name].Receive)then
            shareds[name]:Receive()
        end
    end
    net.Receive("sharedtable_update",function()
        local name=net.ReadString()
        local newtbl=net.ReadTable()
        if(name and newtbl)then
            if(not shareds[name])then
                waiting[name]=function() Received(name,newtbl) end
            else
                Received(name,newtbl)
            end
            
        end
    end)
    net.Receive("sharedtable_updatej",function()
        local name=net.ReadString()
        local bytes_amount = net.ReadUInt(16)
        local newtbl=util.JSONToTable(util.Decompress(net.ReadData(bytes_amount)),true,true)
        if(name and newtbl)then
            if(not shareds[name])then
                waiting[name]=function() Received(name,newtbl) end
            else
                Received(name,newtbl)
            end
            
        end
    end)
    timer.Create(id.." Waiting for table created...",0.5,0,function()
        for i,v in pairs(waiting)do
            if(v and shareds[i])then
                v()
                waiting[i]=nil
            end
        end
    end)
end
function sharedtable:New(name,json)
    local OBJ={}
    local t={}
    OBJ.tbl={}
    OBJ.name=name
    local main=OBJ
    OBJ.tbl.GETT=function()
        return t
    end
    setmetatable(
        OBJ.tbl,
        {
        __index=function(_,k)
            return t[k]
        end,
        __newindex=function(self,k,v)
            rawset(t,k,v)
            if(main and main.OnUpdated)then
                main:OnUpdated(t,k,v,main)
            end
        end,
        }
    )
    setmetatable(OBJ,{__index=self})
    shareds[name]=OBJ
    OBJ.json=json or false
    return OBJ
end

function sharedtable:SetReceive(f)
    rawset(self,"Receive",f)
end
function sharedtable:Get()
    return self.tbl
end
function sharedtable:OnUpdated(tbl,k,v,main)
    if(CLIENT)then return end
    if not self.json and net.Start("sharedtable_update")then
        local newtbl=table.Copy(tbl)
        newtbl.main=main
        newtbl.main={name=newtbl.main.name}
        for i,v in pairs(newtbl)do
            if(isfunction(v))then
                newtbl[i]=nil
            end
        end
        net.WriteString(self.name)
        net.WriteTable(newtbl)
        net.Broadcast()
    elseif(net.Start("sharedtable_updatej"))then
        local data=util.Compress(util.TableToJSON(newtbl,false))
        net.WriteString(self.name)
        local bytes=#data
        net.WriteUInt(bytes,16)
        net.WriteData(data)
        net.Broadcast()
    end
    if(self.Receive)then
        self:Receive()
    end
end
function New(name)
    if(not name)then we_error.Error("sh_sharedtable.lua - Attempted to use nil as a name.",true) end
    if(not isstring(name))then if(tostring(name))then name=tostring(name) else we_error.Error("sh_sharedtable.lua - Couldn't convert this object to string.".." Object Type:"..type(name),true) end end
    return sharedtable:New(name)
end
hook.Add("PlayerInitialSpawn",id.."_SendTBL",function(ply)
    if(not ply.SharedTableSended)then
        ply.SharedTableSended=true
        for i,v in pairs(shareds)do
            local tbl=v.tbl:GETT()
            if v.json and net.Start("sharedtable_update")then
                local newtbl=table.Copy(tbl)
                newtbl.main={name=v.name}
                for i,v in pairs(newtbl)do
                    if(isfunction(v))then
                        newtbl[i]=nil
                    end
                end
                net.WriteString(self.name)
                net.WriteTable(newtbl)
                net.Send(ply)
            elseif(net.Start("sharedtable_updatej"))then
                local newtbl=table.Copy(tbl)
                if(newtbl.main)then
                    newtbl.main={name=newtbl.main.name}
                end
                for i,v in pairs(newtbl)do
                    if(isfunction(v))then
                        newtbl[i]=nil
                    end
                end
                local data=util.Compress(util.TableToJSON(newtbl,false))
                net.WriteString(v.name)
                local bytes=#data
                net.WriteUInt(bytes,16)
                net.WriteData(data)
                net.Broadcast()
            end
        end
    end
end)