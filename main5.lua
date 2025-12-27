-- Place this in StarterPlayerScripts
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Function to find and make all Ability buttons visible
local function revealAllAbilityButtons()
    local foundButtons = {}
    
    -- Search through all ScreenGuis
    for _, screenGui in ipairs(playerGui:GetChildren()) do
        if screenGui:IsA("ScreenGui") then
            -- Check all descendants for ability buttons
            for _, guiObject in ipairs(screenGui:GetDescendants()) do
                -- Look for ImageButtons or TextButtons
                if guiObject:IsA("ImageButton") or guiObject:IsA("TextButton") then
                    -- Check if button name indicates it's an ability button
                    local buttonName = guiObject.Name:lower()
                    local isAbilityButton = false
                    
                    -- Common ability button naming patterns
                    if buttonName:find("ability") 
                        or buttonName:find("skill")
                        or buttonName:find("attack") 
                        or buttonName:find("spell")
                        or buttonName:find("power")
                        or buttonName:find("cast")
                        or buttonName:find("ability1")
                        or buttonName:find("ability2")
                        or buttonName:find("ability3")
                        or buttonName:find("skill1")
                        or buttonName:find("skill2")
                        or buttonName:find("qbutton")  -- Q ability
                        or buttonName:find("ebutton")  -- E ability
                        or buttonName:find("rbutton")  -- R ability
                        or buttonName:find("fbutton") then  -- F ability
                        isAbilityButton = true
                    end
                    
                    -- Also check if it has specific tags or parents
                    local parentName = guiObject.Parent and guiObject.Parent.Name:lower() or ""
                    if parentName:find("ability") or parentName:find("skill") then
                        isAbilityButton = true
                    end
                    
                    if isAbilityButton then
                        table.insert(foundButtons, guiObject)
                        
                        -- Make the button and its parents visible
                        local current = guiObject
                        while current and current:IsA("GuiObject") do
                            if current.Visible == false then
                                current.Visible = true
                                print("Revealed: " .. current.Name)
                            end
                            current = current.Parent
                        end
                    end
                end
            end
        end
    end
    
    -- Report findings
    if #foundButtons > 0 then
        print("Found and revealed " .. #foundButtons .. " ability buttons")
    end
end

-- Run when GUI loads
wait(2) -- Wait for GUI to fully load
revealAllAbilityButtons()

-- Set up automatic checking
local RunService = game:GetService("RunService")
local lastCheck = 0

RunService.Heartbeat:Connect(function(deltaTime)
    lastCheck = lastCheck + deltaTime
    if lastCheck >= 3 then -- Check every 3 seconds
        lastCheck = 0
        revealAllAbilityButtons()
    end
end)

-- Also check when new GUIs are added
playerGui.ChildAdded:Connect(function(child)
    if child:IsA("ScreenGui") then
        wait(1) -- Wait for GUI to populate
        revealAllAbilityButtons()
    end
end)