-- Create the GUI Setup
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

-- Main frame for the GUI
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.3, 0, 0.6, 0)
mainFrame.Position = UDim2.new(0.35, 0, 0.2, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Sidebar (for tabs like Discord, Player Tab, etc.)
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(0, 200, 1, 0)
sidebar.Position = UDim2.new(0, 0, 0, 0)
sidebar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
sidebar.BorderSizePixel = 0
sidebar.Parent = mainFrame

-- Sidebar Header (App Name)
local header = Instance.new("TextLabel")
header.Size = UDim2.new(1, 0, 0, 40)
header.Position = UDim2.new(0, 0, 0, 0)
header.Text = "Pulsar X / Steal A Brainrot"
header.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
header.TextColor3 = Color3.fromRGB(255, 255, 255)
header.TextSize = 16
header.TextXAlignment = Enum.TextXAlignment.Center
header.Parent = sidebar

-- Create the Tabs Frame (located inside the sidebar)
local tabsFrame = Instance.new("Frame")
tabsFrame.Size = UDim2.new(1, 0, 0, 300)
tabsFrame.Position = UDim2.new(0, 0, 0, 40)
tabsFrame.BackgroundTransparency = 1
tabsFrame.Parent = sidebar

-- Create buttons for the tabs in the sidebar (like Discord Tab, Player Tab, etc.)
local tabs = {
    "Discord Tab", "Brainrot Management", "Weird Tab", "Steal Tab",
    "Buy Tab", "Server Hop Tab", "Webhook Tab", "Player Management", "Esp Tab", "Window and File Configuration"
}

local tabButtons = {}

for i, tabName in ipairs(tabs) do
    local tabButton = Instance.new("TextButton")
    tabButton.Size = UDim2.new(1, 0, 0, 40)
    tabButton.Position = UDim2.new(0, 0, 0, (i - 1) * 40)
    tabButton.Text = tabName
    tabButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabButton.TextSize = 14
    tabButton.TextXAlignment = Enum.TextXAlignment.Left
    tabButton.Parent = tabsFrame
    table.insert(tabButtons, tabButton)
end

-- Create the Tab Area (Main and Misc)
local tabArea = Instance.new("Frame")
tabArea.Size = UDim2.new(1, 0, 1, -40)
tabArea.Position = UDim2.new(0, 0, 0, 40)
tabArea.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
tabArea.Parent = mainFrame

-- Tabs Content
local mainTabContent = Instance.new("Frame")
mainTabContent.Size = UDim2.new(1, 0, 1, 0)
mainTabContent.Position = UDim2.new(0, 0, 0, 0)
mainTabContent.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainTabContent.Visible = true
mainTabContent.Parent = tabArea

local miscTabContent = Instance.new("Frame")
miscTabContent.Size = UDim2.new(1, 0, 1, 0)
miscTabContent.Position = UDim2.new(0, 0, 0, 0)
miscTabContent.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
miscTabContent.Visible = false
miscTabContent.Parent = tabArea

-- Main Tab: Add toggles like Aimbot, Anti Hit, etc.
local aimbotButton = Instance.new("TextButton")
aimbotButton.Size = UDim2.new(1, 0, 0, 40)
aimbotButton.Position = UDim2.new(0, 0, 0, 0)
aimbotButton.Text = "Aimbot with Webslinger"
aimbotButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
aimbotButton.TextColor3 = Color3.fromRGB(255, 255, 255)
aimbotButton.Parent = mainTabContent

local antiHitButton = Instance.new("TextButton")
antiHitButton.Size = UDim2.new(1, 0, 0, 40)
antiHitButton.Position = UDim2.new(0, 0, 0, 50)
antiHitButton.Text = "Anti Hit"
antiHitButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
antiHitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
antiHitButton.Parent = mainTabContent

-- Misc Tab: Infinite Jump Toggle
local infiniteJumpButton = Instance.new("TextButton")
infiniteJumpButton.Size = UDim2.new(1, 0, 0, 40)
infiniteJumpButton.Position = UDim2.new(0, 0, 0, 0)
infiniteJumpButton.Text = "Infinite Jump"
infiniteJumpButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
infiniteJumpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
infiniteJumpButton.Parent = miscTabContent

-- Infinite Jump Toggle Logic
local infiniteJumpEnabled = false
infiniteJumpButton.MouseButton1Click:Connect(function()
    infiniteJumpEnabled = not infiniteJumpEnabled
    if infiniteJumpEnabled then
        infiniteJumpButton.Text = "Disable Infinite Jump"
        -- Infinite Jump code (to prevent fall)
        game:GetService("UserInputService").JumpRequest:Connect(function()
            if infiniteJumpEnabled then
                local character = game.Players.LocalPlayer.Character
                local humanoid = character and character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:ChangeState(Enum.HumanoidStateType.Physics)
                    character:Move(Vector3.new(0, 50, 0)) -- Keeps jumping
                end
            end
        end)
    else
        infiniteJumpButton.Text = "Enable Infinite Jump"
    end
end)

-- Tab Switching Logic
local function showMainTab()
    mainTabContent.Visible = true
    miscTabContent.Visible = false
end

local function showMiscTab()
    mainTabContent.Visible = false
    miscTabContent.Visible = true
end

-- Connect the buttons to switch tabs
tabButtons[1].MouseButton1Click:Connect(showMainTab)
tabButtons[2].MouseButton1Click:Connect(showMiscTab)

-- Start with the Main tab visible
showMainTab()
