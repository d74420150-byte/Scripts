local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ButtonGui"
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, 0, 120)
mainFrame.Position = UDim2.new(0, 10, 0, 10)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 8)
uiCorner.Parent = mainFrame

local mangoButton = Instance.new("TextButton")
mangoButton.Name = "GiveMangosButton"
mangoButton.Size = UDim2.new(0, 180, 0, 40)
mangoButton.Position = UDim2.new(0, 10, 0, 10)
mangoButton.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
mangoButton.Text = "Give Mangos"
mangoButton.TextColor3 = Color3.fromRGB(255, 255, 255)
mangoButton.TextSize = 14
mangoButton.Font = Enum.Font.GothamBold
mangoButton.Parent = mainFrame

local moneyButton = Instance.new("TextButton")
moneyButton.Name = "MoneyRainButton"
moneyButton.Size = UDim2.new(0, 180, 0, 40)
moneyButton.Position = UDim2.new(0, 10, 0, 60)
moneyButton.BackgroundColor3 = Color3.fromRGB(50, 168, 82)
moneyButton.Text = "Money Rain"
moneyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
moneyButton.TextSize = 14
moneyButton.Font = Enum.Font.GothamBold
moneyButton.Parent = mainFrame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 6)
buttonCorner:Clone().Parent = mangoButton
buttonCorner:Clone().Parent = moneyButton

-- Button functionality
mangoButton.MouseButton1Click:Connect(function()
    game:GetService("ReplicatedStorage"):WaitForChild("MANGOREALEVENT"):FireServer()
end)

moneyButton.MouseButton1Click:Connect(function()
    game:GetService("ReplicatedStorage"):WaitForChild("cashflow"):FireServer()
end)

-- Cash label update function
local function updateCashLabel()
    local cashLabel = playerGui:FindFirstChild("CashLabel", true)
    if cashLabel then
        local leaderstats = player:FindFirstChild("leaderstats")
        if leaderstats then
            local money = leaderstats:FindFirstChild("Money")
            if money then
                cashLabel.Text = "Money: $" .. tostring(money.Value)
            end
        end
    end
end

-- Set up cash label updates
spawn(function()
    local success, err = pcall(function()
        local leaderstats = player:WaitForChild("leaderstats")
        local money = leaderstats:WaitForChild("Money")
        money.Changed:Connect(updateCashLabel)
        updateCashLabel()
    end)
end)