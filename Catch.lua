-- Create the main screen GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "xlur_GUI"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Create the background frame (black)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 300, 0, 500)
MainFrame.Position = UDim2.new(0, 50, 0, 50)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.Parent = ScreenGui
MainFrame.Active = true
MainFrame.Draggable = true  -- This makes the GUI draggable

-- Title Label
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 40)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "xlur ┃ Catch A Brainrot"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 24
TitleLabel.TextXAlignment = Enum.TextXAlignment.Center
TitleLabel.TextYAlignment = Enum.TextYAlignment.Center
TitleLabel.Parent = MainFrame

-- Create the Tab buttons container (left side)
local TabContainer = Instance.new("Frame")
TabContainer.Size = UDim2.new(0, 80, 1, 0)
TabContainer.Position = UDim2.new(0, 0, 0, 0)
TabContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TabContainer.Parent = MainFrame

-- Main Tab Button
local MainTabButton = Instance.new("TextButton")
MainTabButton.Size = UDim2.new(1, 0, 0, 40)
MainTabButton.Position = UDim2.new(0, 0, 0, 0)
MainTabButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MainTabButton.Text = "Main"
MainTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MainTabButton.TextSize = 18
MainTabButton.Parent = TabContainer

-- Misc Tab Button
local MiscTabButton = Instance.new("TextButton")
MiscTabButton.Size = UDim2.new(1, 0, 0, 40)
MiscTabButton.Position = UDim2.new(0, 0, 0, 40)
MiscTabButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
MiscTabButton.Text = "Misc"
MiscTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MiscTabButton.TextSize = 18
MiscTabButton.Parent = TabContainer

-- Content Frames for Main and Misc tabs
local MainTabFrame = Instance.new("Frame")
MainTabFrame.Size = UDim2.new(1, -80, 1, 0)
MainTabFrame.Position = UDim2.new(0, 80, 0, 0)
MainTabFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainTabFrame.Visible = true
MainTabFrame.Parent = MainFrame

local MiscTabFrame = Instance.new("Frame")
MiscTabFrame.Size = UDim2.new(1, -80, 1, 0)
MiscTabFrame.Position = UDim2.new(0, 80, 0, 0)
MiscTabFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MiscTabFrame.Visible = false
MiscTabFrame.Parent = MainFrame

-- Tab Switching Logic
MainTabButton.MouseButton1Click:Connect(function()
    MainTabFrame.Visible = true
    MiscTabFrame.Visible = false
end)

MiscTabButton.MouseButton1Click:Connect(function()
    MainTabFrame.Visible = false
    MiscTabFrame.Visible = true
end)

-- Example Button in Main Tab
local MainButton = Instance.new("TextButton")
MainButton.Size = UDim2.new(0, 200, 0, 40)
MainButton.Position = UDim2.new(0, 50, 0, 100)
MainButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
MainButton.Text = "Main Button"
MainButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MainButton.TextSize = 18
MainButton.Parent = MainTabFrame

-- Example Button in Misc Tab
local MiscButton = Instance.new("TextButton")
MiscButton.Size = UDim2.new(0, 200, 0, 40)
MiscButton.Position = UDim2.new(0, 50, 0, 100)
MiscButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
MiscButton.Text = "Misc Button"
MiscButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MiscButton.TextSize = 18
MiscButton.Parent = MiscTabFrame
