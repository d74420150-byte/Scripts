local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ButtonGui"
screenGui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, 0, 160)
mainFrame.Position = UDim2.new(0, 10, 0, 10)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 8)
uiCorner.Parent = mainFrame

local cashLabel = Instance.new("TextLabel")
cashLabel.Name = "CashLabel"
cashLabel.Size = UDim2.new(0, 180, 0, 30)
cashLabel.Position = UDim2.new(0, 10, 0, 10)
cashLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
cashLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
cashLabel.Text = "Money: $0"
cashLabel.TextSize = 14
cashLabel.Font = Enum.Font.GothamBold
cashLabel.Parent = mainFrame

local labelCorner = Instance.new("UICorner")
labelCorner.CornerRadius = UDim.new(0, 6)
labelCorner.Parent = cashLabel

local mangoButton = Instance.new("TextButton")
mangoButton.Name = "GiveMangosButton"
mangoButton.Size = UDim2.new(0, 180, 0, 40)
mangoButton.Position = UDim2.new(0, 10, 0, 50)
mangoButton.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
mangoButton.Text = "Give Mangos"
mangoButton.TextColor3 = Color3.fromRGB(255, 255, 255)
mangoButton.TextSize = 14
mangoButton.Font = Enum.Font.GothamBold
mangoButton.Parent = mainFrame

local moneyButton = Instance.new("TextButton")
moneyButton.Name = "MoneyRainButton"
moneyButton.Size = UDim2.new(0, 180, 0, 40)
moneyButton.Position = UDim2.new(0, 10, 0, 100)
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

local function updateCashLabel()
    local leaderstats = player:FindFirstChild("leaderstats")
    if leaderstats then
        local money = leaderstats:FindFirstChild("Money")
        if money then
            cashLabel.Text = "Money: $" .. tostring(money.Value)
        end
    end
end

local function onMoneyChanged()
    updateCashLabel()
end

local leaderstats = player:WaitForChild("leaderstats")
local money = leaderstats:WaitForChild("Money")
money.Changed:Connect(onMoneyChanged)
updateCashLabel()

mangoButton.MouseButton1Click:Connect(function()
    game:GetService("ReplicatedStorage"):WaitForChild("MANGOREALEVENT"):FireServer()
end)

moneyButton.MouseButton1Click:Connect(function()
    game:GetService("ReplicatedStorage"):WaitForChild("cashflow"):FireServer()
end)