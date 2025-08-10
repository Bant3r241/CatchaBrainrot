--// Services
local Players = game:GetService("Players")
local player = Players.LocalPlayer

--// GUI Creation
local ScreenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
ScreenGui.Name = "PulsarXTheme"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

--// Main Frame (Container)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Name = "MainFrame"
MainFrame.AnchorPoint = Vector2.new(0, 0.5)
MainFrame.Position = UDim2.new(0.05, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 600, 0, 400)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0

--// UICorner for rounded edges
local Corner = Instance.new("UICorner", MainFrame)
Corner.CornerRadius = UDim.new(0, 6)

--// SideBar
local SideBar = Instance.new("Frame", MainFrame)
SideBar.Name = "SideBar"
SideBar.Size = UDim2.new(0, 150, 1, 0)
SideBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
SideBar.BorderSizePixel = 0

local SideBarCorner = Instance.new("UICorner", SideBar)
SideBarCorner.CornerRadius = UDim.new(0, 6)

--// TopBar
local TopBar = Instance.new("Frame", MainFrame)
TopBar.Name = "TopBar"
TopBar.Position = UDim2.new(0, 150, 0, 0)
TopBar.Size = UDim2.new(1, -150, 0, 30)
TopBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TopBar.BorderSizePixel = 0

local TopBarCorner = Instance.new("UICorner", TopBar)
TopBarCorner.CornerRadius = UDim.new(0, 6)

local TitleLabel = Instance.new("TextLabel", TopBar)
TitleLabel.Text = "Player Tab"
TitleLabel.Font = Enum.Font.SourceSansSemibold
TitleLabel.TextSize = 16
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Size = UDim2.new(1, 0, 1, 0)
TitleLabel.Position = UDim2.new(0, 0, 0, 0)

--// Content Area
local Content = Instance.new("Frame", MainFrame)
Content.Name = "Content"
Content.Position = UDim2.new(0, 150, 0, 30)
Content.Size = UDim2.new(1, -150, 1, -30)
Content.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Content.BorderSizePixel = 0

local ContentCorner = Instance.new("UICorner", Content)
ContentCorner.CornerRadius = UDim.new(0, 6)
