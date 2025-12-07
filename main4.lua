--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local getgenv, getnamecallmethod, hookmetamethod, hookfunction, newcclosure, checkcaller =
    getgenv, getnamecallmethod, hookmetamethod, hookfunction, newcclosure, checkcaller

local string_lower, string_gsub = string.lower, string.gsub

if getgenv().ED_AntiKick then return end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local kickKeywords = {"kick", "shutdown", "ban", "destroy", "kickplayer", "kickuser"}

local function containsKickKeyword(str)
    if not str then return false end
    local lowerStr = string_lower(str)
    for _, keyword in pairs(kickKeywords) do
        if string_lower(keyword) and string.match(lowerStr, string_lower(keyword)) then
            return true
        end
    end
    return false
end

local function compareInstances(inst1, inst2)
    if typeof(inst1) == "Instance" and typeof(inst2) == "Instance" then
        return inst1 == inst2
    end
    return false
end

getgenv().ED_AntiKick = {
    Enabled = true,
    CheckCaller = true
}

local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
local oldKickFunction = LocalPlayer.Kick

setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}

    if (getgenv().ED_AntiKick.Enabled) then
        local checkCallerPass = (not getgenv().ED_AntiKick.CheckCaller) or (getgenv().ED_AntiKick.CheckCaller and not checkcaller())
        if checkCallerPass and compareInstances(self, LocalPlayer) and string_gsub(method, "^%l", string.upper) == "Kick" then
            return
        end
    end

    if containsKickKeyword(method) then
        return
    end

    return oldNamecall(self, ...)
end)

setreadonly(mt, true)

LocalPlayer.Kick = newcclosure(function(...)
    local checkCallerPass = (not getgenv().ED_AntiKick.CheckCaller) or (getgenv().ED_AntiKick.CheckCaller and not checkcaller())
    if checkCallerPass and getgenv().ED_AntiKick.Enabled then
        return
    end
    return oldKickFunction(...)
end)

local function hookRemote(remote)
    if remote:IsA("RemoteEvent") then
        local oldFireServer = remote.FireServer
        remote.FireServer = function(self, ...)
            local args = {...}
            for _, v in pairs(args) do
                if type(v) == "string" and containsKickKeyword(v) then
                    return
                end
            end
            return oldFireServer(self, ...)
        end
    elseif remote:IsA("RemoteFunction") then
        local oldInvokeServer = remote.InvokeServer
        remote.InvokeServer = function(self, ...)
            local args = {...}
            for _, v in pairs(args) do
                if type(v) == "string" and containsKickKeyword(v) then
                    return
                end
            end
            return oldInvokeServer(self, ...)
        end
    end
end

local function scanAndHookRemotes()
    local containers = {ReplicatedStorage, workspace}
    for _, container in pairs(containers) do
        for _, remote in pairs(container:GetDescendants()) do
            if remote:IsA("RemoteEvent") or remote:IsA("RemoteFunction") then
                pcall(hookRemote, remote)
            end
        end
    end
end

scanAndHookRemotes()

coroutine.wrap(function()
    while true do
        wait(30)
        scanAndHookRemotes()
    end
end)()

local success, Admin = pcall(function() return _G.Adonis or _G.Admin end)
if success and Admin then
    for name, func in pairs(Admin) do
        if type(func) == "function" and containsKickKeyword(name) then
            Admin[name] = function(...)
                return
            end
        end
    end
end

game:GetService("Players").LocalPlayer.PlayerScripts.__fe2classic:Destroy()