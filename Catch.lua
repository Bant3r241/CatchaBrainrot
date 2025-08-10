-- Create the main screen GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "xlur_GUI"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main Background Frame (black background)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 400, 0, 600)
MainFrame.Position = UDim2.new(0, 50, 0, 50)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)  -- Dark background color
MainFrame.Parent = ScreenGui
MainFrame.Active = true
MainFrame.Draggable = true  -- Makes the GUI draggable

-- Title at the top of the GUI
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 40)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "xlur ┃ Catch A Brainrot"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 24
TitleLabel.TextXAlignment = Enum.TextXAlignment.Center
TitleLabel.TextYAlignment = Enum.TextYAlignment.Center
TitleLabel.Parent = MainFrame

-- Sidebar with buttons on the left
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 100, 1, 0)
Sidebar.Position = UDim2.new(0, 0, 0, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Sidebar.Parent = MainFrame

-- Sample button in the sidebar
local DiscordTabButton = Instance.new("TextButton")
DiscordTabButton.Size = UDim2.new(1, 0, 0, 40)
DiscordTabButton.Position = UDim2.new(0, 0, 0, 0)
DiscordTabButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
DiscordTabButton.Text = "Discord Tab"
DiscordTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordTabButton.TextSize = 18
DiscordTabButton.Parent = Sidebar

-- More buttons in the sidebar can be added similarly
local BrainrotManagementButton = Instance.new("TextButton")
BrainrotManagementButton.Size = UDim2.new(1, 0, 0, 40)
BrainrotManagementButton.Position = UDim2.new(0, 0, 0, 40)
BrainrotManagementButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
BrainrotManagementButton.Text = "Brainrot Management"
BrainrotManagementButton.TextColor3 = Color3.fromRGB(255, 255, 255)
BrainrotManagementButton.TextSize = 18
BrainrotManagementButton.Parent = Sidebar

-- Content Area (right side, where you can place options or features)
local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1, -100, 1, 0)
ContentArea.Position = UDim2.new(0, 100, 0, 0)
ContentArea.BackgroundColor3 = Color3.fromRGB(25, 25, 25)  -- Dark content background
ContentArea.Parent = MainFrame

-- Example of adding a sample toggle switch inside the content area
local ToggleSwitch = Instance.new("TextButton")
ToggleSwitch.Size = UDim2.new(0, 200, 0, 40)
ToggleSwitch.Position = UDim2.new(0, 50, 0, 100)
ToggleSwitch.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ToggleSwitch.Text = "Sample Toggle"
ToggleSwitch.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleSwitch.TextSize = 18
ToggleSwitch.Parent = ContentArea
