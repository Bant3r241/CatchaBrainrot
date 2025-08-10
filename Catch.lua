local Gui = Instance.new("ScreenGui")
Gui.Parent = game.Players.LocalPlayer.PlayerGui

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 400)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.Parent = Gui

-- Tab Buttons
local tabButtons = Instance.new("Frame")
tabButtons.Size = UDim2.new(1, 0, 0, 40)
tabButtons.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
tabButtons.Position = UDim2.new(0, 0, 0, 0)
tabButtons.Parent = mainFrame

local mainButton = Instance.new("TextButton")
mainButton.Text = "Main"
mainButton.Size = UDim2.new(0.5, 0, 1, 0)
mainButton.Position = UDim2.new(0, 0, 0, 0)
mainButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainButton.TextColor3 = Color3.fromRGB(255, 255, 255)
mainButton.Parent = tabButtons

local miscButton = Instance.new("TextButton")
miscButton.Text = "Misc"
miscButton.Size = UDim2.new(0.5, 0, 1, 0)
miscButton.Position = UDim2.new(0.5, 0, 0, 0)
miscButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
miscButton.TextColor3 = Color3.fromRGB(255, 255, 255)
miscButton.Parent = tabButtons

-- Main Content Frame
local mainContent = Instance.new("Frame")
mainContent.Size = UDim2.new(1, 0, 1, -40)
mainContent.Position = UDim2.new(0, 0, 0, 40)
mainContent.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
mainContent.Visible = true
mainContent.Parent = mainFrame

local miscContent = Instance.new("Frame")
miscContent.Size = UDim2.new(1, 0, 1, -40)
miscContent.Position = UDim2.new(0, 0, 0, 40)
miscContent.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
miscContent.Visible = false
miscContent.Parent = mainFrame

-- Toggle between tabs
mainButton.MouseButton1Click:Connect(function()
    mainContent.Visible = true
    miscContent.Visible = false
end)

miscButton.MouseButton1Click:Connect(function()
    mainContent.Visible = false
    miscContent.Visible = true
end)

-- Add some components to the Main tab
local aimbotToggle = Instance.new("TextButton")
aimbotToggle.Text = "Aimbot with Webslinger"
aimbotToggle.Size = UDim2.new(1, 0, 0, 40)
aimbotToggle.Position = UDim2.new(0, 0, 0, 0)
aimbotToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
aimbotToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
aimbotToggle.Parent = mainContent

-- Add components to the Misc tab
local speedBoostToggle = Instance.new("TextButton")
speedBoostToggle.Text = "Speed Boost (750 cash)"
speedBoostToggle.Size = UDim2.new(1, 0, 0, 40)
speedBoostToggle.Position = UDim2.new(0, 0, 0, 0)
speedBoostToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
speedBoostToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
speedBoostToggle.Parent = miscContent
