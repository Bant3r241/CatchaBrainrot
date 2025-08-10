-- GUI Setup
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

-- Main frame for the GUI
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0.4, 0, 0.6, 0)
mainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.Parent = screenGui

-- Tabs
local tabsFrame = Instance.new("Frame")
tabsFrame.Size = UDim2.new(1, 0, 0, 50)
tabsFrame.Position = UDim2.new(0, 0, 0, 0)
tabsFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
tabsFrame.Parent = mainFrame

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

-- Content for Main Tab
local mainTabContent = Instance.new("Frame")
mainTabContent.Size = UDim2.new(1, 0, 1, -50)
mainTabContent.Position = UDim2.new(0, 0, 0, 50)
mainTabContent.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
mainTabContent.Visible = true
mainTabContent.Parent = mainFrame

-- Content for Misc Tab
local miscTabContent = Instance.new("Frame")
miscTabContent.Size = UDim2.new(1, 0, 1, -50)
miscTabContent.Position = UDim2.new(0, 0, 0, 50)
miscTabContent.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
miscTabContent.Visible = false
miscTabContent.Parent = mainFrame

-- Example button for Main Tab (you can add more like this)
local aimbotButton = Instance.new("TextButton")
aimbotButton.Size = UDim2.new(1, 0, 0, 40)
aimbotButton.Position = UDim2.new(0, 0, 0, 0)
aimbotButton.Text = "Aimbot with Webslinger"
aimbotButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
aimbotButton.TextColor3 = Color3.fromRGB(255, 255, 255)
aimbotButton.Parent = mainTabContent

-- Add more buttons in the same way for Main Tab...

-- Infinite Jump Toggle (Misc Tab)
local infiniteJumpButton = Instance.new("TextButton")
infiniteJumpButton.Size = UDim2.new(1, 0, 0, 40)
infiniteJumpButton.Position = UDim2.new(0, 0, 0, 0)
infiniteJumpButton.Text = "Infinite Jump"
infiniteJumpButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
infiniteJumpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
infiniteJumpButton.Parent = miscTabContent

-- Toggle Infinite Jump functionality
local infiniteJumpEnabled = false
infiniteJumpButton.MouseButton1Click:Connect(function()
    infiniteJumpEnabled = not infiniteJumpEnabled
    if infiniteJumpEnabled then
        infiniteJumpButton.Text = "Disable Infinite Jump"
        -- Enable Infinite Jump (for example)
        game:GetService("UserInputService").JumpRequest:Connect(function()
            if infiniteJumpEnabled then
                -- Prevent jumping from stopping (infinite jump logic)
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
                game.Players.LocalPlayer.Character.Humanoid:Move(Vector3.new(0, 50, 0)) -- Keeps jump upwards
            end
        end)
    else
        infiniteJumpButton.Text = "Enable Infinite Jump"
        -- Disable Infinite Jump
    end
end)

-- Tab Switching Logic
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

-- Connect buttons to their respective functions
mainTabButton.MouseButton1Click:Connect(showMainTab)
miscTabButton.MouseButton1Click:Connect(showMiscTab)

-- Start with the Main tab visible
showMainTab()
