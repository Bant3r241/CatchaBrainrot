-- Variables for UI elements
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

-- Create main frame (holds the entire GUI)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.Position = UDim2.new(0.25, 0, 0.25, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.Parent = screenGui

-- Create tabs frame (for tab buttons)
local tabsFrame = Instance.new("Frame")
tabsFrame.Size = UDim2.new(1, 0, 0, 50)
tabsFrame.Position = UDim2.new(0, 0, 0, 0)
tabsFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
tabsFrame.Parent = mainFrame

-- Tab buttons (Main and Misc)
local mainTabButton = Instance.new("TextButton")
mainTabButton.Size = UDim2.new(0.5, 0, 1, 0)
mainTabButton.Position = UDim2.new(0, 0, 0, 0)
mainTabButton.Text = "Main"
mainTabButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
mainTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
mainTabButton.Parent = tabsFrame

local miscTabButton = Instance.new("TextButton")
miscTabButton.Size = UDim2.new(0.5, 0, 1, 0)
miscTabButton.Position = UDim2.new(0.5, 0, 0, 0)
miscTabButton.Text = "Misc"
miscTabButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
miscTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
miscTabButton.Parent = tabsFrame

-- Create content frames for each tab
local mainTabContent = Instance.new("Frame")
mainTabContent.Size = UDim2.new(1, 0, 1, -50)  -- Fill the remaining space below tabs
mainTabContent.Position = UDim2.new(0, 0, 0, 50)
mainTabContent.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
mainTabContent.Visible = true  -- Make the Main tab content visible initially
mainTabContent.Parent = mainFrame

local miscTabContent = Instance.new("Frame")
miscTabContent.Size = UDim2.new(1, 0, 1, -50)
miscTabContent.Position = UDim2.new(0, 0, 0, 50)
miscTabContent.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
miscTabContent.Visible = false  -- Hide the Misc tab content initially
miscTabContent.Parent = mainFrame

-- Add some sample content to the tabs
local mainLabel = Instance.new("TextLabel")
mainLabel.Size = UDim2.new(0, 200, 0, 50)
mainLabel.Position = UDim2.new(0.5, -100, 0.5, -25)
mainLabel.Text = "Main Tab Content"
mainLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
mainLabel.BackgroundTransparency = 1
mainLabel.Parent = mainTabContent

local miscLabel = Instance.new("TextLabel")
miscLabel.Size = UDim2.new(0, 200, 0, 50)
miscLabel.Position = UDim2.new(0.5, -100, 0.5, -25)
miscLabel.Text = "Misc Tab Content"
miscLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
miscLabel.BackgroundTransparency = 1
miscLabel.Parent = miscTabContent

-- Tab Button Click Functions
local function showMainTab()
    mainTabContent.Visible = true
    miscTabContent.Visible = false
    mainTabButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    miscTabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
end

local function showMiscTab()
    mainTabContent.Visible = false
    miscTabContent.Visible = true
    mainTabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    miscTabButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
end

-- Connect the tab buttons to their functions
mainTabButton.MouseButton1Click:Connect(showMainTab)
miscTabButton.MouseButton1Click:Connect(showMiscTab)

-- Start with the Main tab visible
showMainTab()
