-- Create the main screen GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "xlur_GUI"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Create the main black background frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 400, 0, 600)
MainFrame.Position = UDim2.new(0, 50, 0, 50)
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40) -- Dark gray background
MainFrame.Parent = ScreenGui
MainFrame.Active = true
MainFrame.Draggable = true  -- Allows dragging of the GUI

-- Title label at the top
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 40)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "xlur ┃ Catch A Brainrot"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 24
TitleLabel.TextXAlignment = Enum.TextXAlignment.Center
TitleLabel.TextYAlignment = Enum.TextYAlignment.Center
TitleLabel.Parent = MainFrame

-- Sidebar Frame
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 100, 1, 0)
Sidebar.Position = UDim2.new(0, 0, 0, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(35, 35, 35) -- Darker sidebar background
Sidebar.Parent = MainFrame

-- Sidebar buttons with hover effect
local function createSidebarButton(text, position)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1, 0, 0, 40)
    Button.Position = UDim2.new(0, 0, 0, position)
    Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Button.Text = text
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 18
    Button.TextXAlignment = Enum.TextXAlignment.Left
    Button.TextButtonMode = Enum.TextButtonMode.Static
    Button.Parent = Sidebar
    
    Button.MouseEnter:Connect(function()
        Button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)  -- Change color on hover
    end)
    
    Button.MouseLeave:Connect(function()
        Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)  -- Reset color on hover leave
    end)

    return Button
end

-- Sidebar buttons
local DiscordButton = createSidebarButton("Discord Tab", 0)
local BrainrotManagementButton = createSidebarButton("Brainrot Management", 40)
local WeirdTabButton = createSidebarButton("Weird Tab", 80)
local StealTabButton = createSidebarButton("Steal Tab", 120)
local BuyTabButton = createSidebarButton("Buy Tab", 160)
local ServerHopButton = createSidebarButton("Server Hop Tab", 200)
local WebhookTabButton = createSidebarButton("Webhook Tab", 240)
local PlayerTabButton = createSidebarButton("Player Tab", 280)
local EspTabButton = createSidebarButton("Esp Tab", 320)
local ConfigButton = createSidebarButton("Window/File Config", 360)

-- Content Frame (right side, where options or features appear)
local ContentArea = Instance.new("Frame")
ContentArea.Size = UDim2.new(1, -100, 1, 0)
ContentArea.Position = UDim2.new(0, 100, 0, 0)
ContentArea.BackgroundColor3 = Color3.fromRGB(25, 25, 25)  -- Dark content area background
ContentArea.Parent = MainFrame

-- Example of adding a sample toggle switch in the content area
local ToggleSwitch = Instance.new("TextButton")
ToggleSwitch.Size = UDim2.new(0, 200, 0, 40)
ToggleSwitch.Position = UDim2.new(0, 50, 0, 100)
ToggleSwitch.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
ToggleSwitch.Text = "Enable Feature"
ToggleSwitch.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleSwitch.TextSize = 18
ToggleSwitch.Parent = ContentArea

-- Add a line to separate sections (like in the original image)
local Line = Instance.new("Frame")
Line.Size = UDim2.new(1, 0, 0, 1)
Line.Position = UDim2.new(0, 0, 0, 150)
Line.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Line.Parent = ContentArea
