-- Create the ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Create the main frame (background with transparency)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.6, 0, 0.8, 0)  -- Adjust size to 60% width and 80% height of the screen
mainFrame.Position = UDim2.new(0.2, 0, 0.1, 0)  -- Center the frame
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BackgroundTransparency = 0.5  -- Make it semi-transparent
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Create the side menu frame (vertical menu)
local sideMenu = Instance.new("Frame")
sideMenu.Size = UDim2.new(0, 100, 1, 0)  -- Adjust the side menu size to fit mobile screens better
sideMenu.Position = UDim2.new(0, 0, 0, 0)
sideMenu.BackgroundColor3 = Color3.fromRGB(30, 30, 30)  -- Dark color for the menu
sideMenu.BackgroundTransparency = 0.6
sideMenu.BorderSizePixel = 0
sideMenu.Parent = mainFrame

-- Create a list of tabs for the menu
local tabs = {"Discord Tab", "Brainrot Management", "Player Management", "Player Tab"}
local tabButtons = {}

for i, tab in ipairs(tabs) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 40)  -- Adjust size as needed
    button.Position = UDim2.new(0, 0, 0, (i-1) * 40)
    button.Text = tab
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    button.BackgroundTransparency = 0.6
    button.BorderSizePixel = 0
    button.Font = Enum.Font.GothamBold
    button.TextSize = 16
    button.Parent = sideMenu
    table.insert(tabButtons, button)
end

-- Create the content frame for toggles (right side of the UI)
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, -100, 1, 0)
contentFrame.Position = UDim2.new(0, 100, 0, 0)
contentFrame.BackgroundTransparency = 1  -- Transparent background
contentFrame.Parent = mainFrame

-- Create toggles for features
local toggleLabels = {"Aimbot with Webslinger", "Anti Traps", "Anti Hit", "Speed Boost req", "Jump Power", "Jump Power Strength"}
local toggles = {}

for i, label in ipairs(toggleLabels) do
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Size = UDim2.new(1, 0, 0, 40)
    toggleFrame.Position = UDim2.new(0, 0, 0, (i-1) * 50)
    toggleFrame.BackgroundTransparency = 0.5
    toggleFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    toggleFrame.BorderSizePixel = 0
    toggleFrame.Parent = contentFrame

    local toggleLabel = Instance.new("TextLabel")
    toggleLabel.Size = UDim2.new(0, 180, 1, 0)
    toggleLabel.Position = UDim2.new(0, 10, 0, 0)
    toggleLabel.Text = label
    toggleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleLabel.BackgroundTransparency = 1
    toggleLabel.Font = Enum.Font.Gotham
    toggleLabel.TextSize = 14
    toggleLabel.Parent = toggleFrame

    local toggleSwitch = Instance.new("TextButton")
    toggleSwitch.Size = UDim2.new(0, 40, 0, 20)
    toggleSwitch.Position = UDim2.new(1, -50, 0, 10)
    toggleSwitch.Text = "OFF"
    toggleSwitch.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleSwitch.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    toggleSwitch.BackgroundTransparency = 0.5
    toggleSwitch.BorderSizePixel = 0
    toggleSwitch.Font = Enum.Font.Gotham
    toggleSwitch.TextSize = 12
    toggleSwitch.Parent = toggleFrame

    -- Toggle switch functionality
    toggleSwitch.MouseButton1Click:Connect(function()
        if toggleSwitch.Text == "OFF" then
            toggleSwitch.Text = "ON"
            toggleSwitch.BackgroundColor3 = Color3.fromRGB(0, 255, 0)  -- Green for ON
        else
            toggleSwitch.Text = "OFF"
            toggleSwitch.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Red for OFF
        end
    end)
end
