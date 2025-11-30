local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ButtonGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, 0, 170)
mainFrame.Position = UDim2.new(0, 10, 0, 10)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 8)
uiCorner.Parent = mainFrame

local titleBar = Instance.new("TextLabel")
titleBar.Size = UDim2.new(1, 0, 0, 20)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
titleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
titleBar.Text = "Drag Me"
titleBar.TextSize = 12
titleBar.Font = Enum.Font.Gotham
titleBar.Parent = mainFrame

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 8)
titleCorner.Parent = titleBar

local mangoButton = Instance.new("TextButton")
mangoButton.Name = "GiveMangosButton"
mangoButton.Size = UDim2.new(0, 180, 0, 40)
mangoButton.Position = UDim2.new(0, 10, 0, 30)
mangoButton.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
mangoButton.Text = "Give Mangos"
mangoButton.TextColor3 = Color3.fromRGB(255, 255, 255)
mangoButton.TextSize = 14
mangoButton.Font = Enum.Font.GothamBold
mangoButton.Parent = mainFrame

local moneyButton = Instance.new("TextButton")
moneyButton.Name = "MoneyRainButton"
moneyButton.Size = UDim2.new(0, 180, 0, 40)
moneyButton.Position = UDim2.new(0, 10, 0, 80)
moneyButton.BackgroundColor3 = Color3.fromRGB(50, 168, 82)
moneyButton.Text = "Money Rain"
moneyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
moneyButton.TextSize = 14
moneyButton.Font = Enum.Font.GothamBold
moneyButton.Parent = mainFrame

local teleportButton = Instance.new("TextButton")
teleportButton.Name = "Free100kButton"
teleportButton.Size = UDim2.new(0, 180, 0, 40)
teleportButton.Position = UDim2.new(0, 10, 0, 130)
teleportButton.BackgroundColor3 = Color3.fromRGB(0, 119, 182)
teleportButton.Text = "Free 100k"
teleportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
teleportButton.TextSize = 14
teleportButton.Font = Enum.Font.GothamBold
teleportButton.Parent = mainFrame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 6)
buttonCorner:Clone().Parent = mangoButton
buttonCorner:Clone().Parent = moneyButton
buttonCorner:Clone().Parent = teleportButton

local dragging = false
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

titleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

mangoButton.MouseButton1Click:Connect(function()
    game:GetService("ReplicatedStorage"):WaitForChild("MANGOREALEVENT"):FireServer()
end)

moneyButton.MouseButton1Click:Connect(function()
    game:GetService("ReplicatedStorage"):WaitForChild("cashflow"):FireServer()
end)

teleportButton.MouseButton1Click:Connect(function()
    local character = player.Character
    if character then
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            humanoidRootPart.CFrame = CFrame.new(-2132.3, 3.1, 21.5)
        end
    end
end)

local function updateCashLabel()
    local cashLabel = playerGui:FindFirstChild("CashLabel", true)
    if cashLabel then
        local leaderstats = player:FindFirstChild("leaderstats")
        if leaderstats then
            local cash = leaderstats:FindFirstChild("Cash")
            if cash then
                cashLabel.Text = "Cash: $" .. tostring(cash.Value)
            end
        end
    end
end

spawn(function()
    local success, err = pcall(function()
        local leaderstats = player:WaitForChild("leaderstats")
        local cash = leaderstats:WaitForChild("Cash")
        cash.Changed:Connect(updateCashLabel)
        updateCashLabel()
    end)
end)