local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "CustomGUI"
gui.Parent = player:WaitForChild("PlayerGui")
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 150)
frame.Position = UDim2.new(0, 10, 0, 10)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BorderSizePixel = 0
frame.Parent = gui
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = frame
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Text = "Script GUI"
title.Font = Enum.Font.GothamBold
title.TextSize = 14
title.Parent = frame
local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 8)
titleCorner.Parent = title
local button1 = Instance.new("TextButton")
button1.Size = UDim2.new(0.9, 0, 0, 30)
button1.Position = UDim2.new(0.05, 0, 0, 40)
button1.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
button1.TextColor3 = Color3.fromRGB(255, 255, 255)
button1.Text = "Inf Money"
button1.Font = Enum.Font.Gotham
button1.TextSize = 12
button1.Parent = frame
local button1Corner = Instance.new("UICorner")
button1Corner.CornerRadius = UDim.new(0, 6)
button1Corner.Parent = button1
local button2 = Instance.new("TextButton")
button2.Size = UDim2.new(0.9, 0, 0, 30)
button2.Position = UDim2.new(0.05, 0, 0, 75)
button2.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
button2.TextColor3 = Color3.fromRGB(255, 255, 255)
button2.Text = "Rebirth"
button2.Font = Enum.Font.Gotham
button2.TextSize = 12
button2.Parent = frame
local button2Corner = Instance.new("UICorner")
button2Corner.CornerRadius = UDim.new(0, 6)
button2Corner.Parent = button2
local button3 = Instance.new("TextButton")
button3.Size = UDim2.new(0.9, 0, 0, 30)
button3.Position = UDim2.new(0.05, 0, 0, 110)
button3.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
button3.TextColor3 = Color3.fromRGB(255, 255, 255)
button3.Text = "Build Mango Somewhere"
button3.Font = Enum.Font.Gotham
button3.TextSize = 12
button3.Parent = frame
local button3Corner = Instance.new("UICorner")
button3Corner.CornerRadius = UDim.new(0, 6)
button3Corner.Parent = button3
button1.MouseEnter:Connect(function() button1.BackgroundColor3 = Color3.fromRGB(90, 90, 90) end)
button1.MouseLeave:Connect(function() button1.BackgroundColor3 = Color3.fromRGB(75, 75, 75) end)
button2.MouseEnter:Connect(function() button2.BackgroundColor3 = Color3.fromRGB(90, 90, 90) end)
button2.MouseLeave:Connect(function() button2.BackgroundColor3 = Color3.fromRGB(75, 75, 75) end)
button3.MouseEnter:Connect(function() button3.BackgroundColor3 = Color3.fromRGB(90, 90, 90) end)
button3.MouseLeave:Connect(function() button3.BackgroundColor3 = Color3.fromRGB(75, 75, 75) end)
button1.MouseButton1Click:Connect(function()
    local args = {0, math.huge}
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("EndRun"):FireServer(unpack(args))
end)
button2.MouseButton1Click:Connect(function()
    local args = {0, math.huge}
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("EndRun"):FireServer(unpack(args))
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Rebirth"):FireServer()
end)
button3.MouseButton1Click:Connect(function()
    local randomX = math.random(-500, 500)
    local randomY = math.random(-50, 100)
    local randomZ = math.random(-500, 500)
    local args = {"Mango", CFrame.new(randomX, randomY, randomZ)}
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Build"):WaitForChild("Build"):FireServer(unpack(args))
end)