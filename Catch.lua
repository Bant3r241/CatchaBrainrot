local Gui = Instance.new("ScreenGui")
Gui.Parent = game.Players.LocalPlayer.PlayerGui
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main Frame
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 350, 0, 400)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BackgroundTransparency = 0.3
mainFrame.BorderSizePixel = 0
mainFrame.Parent = Gui

-- Tab Buttons
local tabButtons = Instance.new("Frame")
tabButtons.Size = UDim2.new(1, 0, 0, 40)
tabButtons.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
tabButtons.BackgroundTransparency = 0.5
tabButtons.Position = UDim2.new(0, 0, 0, 0)
tabButtons.BorderSizePixel = 0
tabButtons.Parent = mainFrame

local mainButton = Instance.new("TextButton")
mainButton.Text = "Main"
mainButton.Size = UDim2.new(0.5, 0, 1, 0)
mainButton.Position = UDim2.new(0, 0, 0, 0)
mainButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainButton.BackgroundTransparency = 0.5
mainButton.TextColor3 = Color3.fromRGB(255, 255, 255)
mainButton.TextSize = 18
mainButton.BorderSizePixel = 0
mainButton.Parent = tabButtons

local miscButton = Instance.new("TextButton")
miscButton.Text = "Misc"
miscButton.Size = UDim2.new(0.5, 0, 1, 0)
miscButton.Position = UDim2.new(0.5, 0, 0, 0)
miscButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
miscButton.BackgroundTransparency = 0.5
miscButton.TextColor3 = Color3.fromRGB(255, 255, 255)
miscButton.TextSize = 18
miscButton.BorderSizePixel = 0
miscButton.Parent = tabButtons

-- Content Frames
local mainContent = Instance.new("Frame")
mainContent.Size = UDim2.new(1, 0, 1, -40)
mainContent.Position = UDim2.new(0, 0, 0, 40)
mainContent.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
mainContent.BackgroundTransparency = 0.5
mainContent.Visible = true
mainContent.BorderSizePixel = 0
mainContent.Parent = mainFrame

local miscContent = Instance.new("Frame")
miscContent.Size = UDim2.new(1, 0, 1, -40)
miscContent.Position = UDim2.new(0, 0, 0, 40)
miscContent.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
miscContent.BackgroundTransparency = 0.5
miscContent.Visible = false
miscContent.BorderSizePixel = 0
miscContent.Parent = mainFrame

-- Toggle Switch function
local function createToggleButton(parent, text, position, toggleFunction)
    local buttonFrame = Instance.new("Frame")
    buttonFrame.Size = UDim2.new(1, 0, 0, 40)
    buttonFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    buttonFrame.Position = position
    buttonFrame.BorderSizePixel = 0
    buttonFrame.Parent = parent

    local buttonText = Instance.new("TextLabel")
    buttonText.Text = text
    buttonText.Size = UDim2.new(0.7, 0, 1, 0)
    buttonText.Position = UDim2.new(0, 10, 0, 0)
    buttonText.BackgroundTransparency = 1
    buttonText.TextColor3 = Color3.fromRGB(255, 255, 255)
    buttonText.TextSize = 16
    buttonText.TextXAlignment = Enum.TextXAlignment.Left
    buttonText.Parent = buttonFrame

    local toggleButton = Instance.new("TextButton")
    toggleButton.Text = "Off"
    toggleButton.Size = UDim2.new(0.3, 0, 1, 0)
    toggleButton.Position = UDim2.new(0.7, 0, 0, 0)
    toggleButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.TextSize = 16
    toggleButton.BorderSizePixel = 0
    toggleButton.Parent = buttonFrame

    local isToggled = false
    toggleButton.MouseButton1Click:Connect(function()
        isToggled = not isToggled
        toggleButton.Text = isToggled and "On" or "Off"
        toggleButton.BackgroundColor3 = isToggled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(100, 100, 100)
        
        -- Trigger the associated function when toggled
        toggleFunction(isToggled)
    end)
end

-- Infinite Jump Script in Misc Tab
local function enableInfiniteJump(isToggled)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    -- Infinite Jump Logic
    if isToggled then
        humanoid.Changed:Connect(function()
            if humanoid:GetState() == Enum.HumanoidStateType.Physics and humanoid.PlatformStand == false then
                humanoid:ChangeState(Enum.HumanoidStateType.Physics)
                humanoid:Move(Vector3.new(0, 100, 0)) -- Keep jumping
            end
        end)
    else
        humanoid:ChangeState(Enum.HumanoidStateType.Physics)
    end
end

-- Add Toggle Buttons to Main Tab (Empty for now)
-- (No options are in Main Tab anymore)

-- Add Infinite Jump toggle button to Misc Tab
createToggleButton(miscContent, "Infinite Jump", UDim2.new(0, 0, 0, 0), enableInfiniteJump)

-- Tab Switch
mainButton.MouseButton1Click:Connect(function()
    mainContent.Visible = true
    miscContent.Visible = false
end)

miscButton.MouseButton1Click:Connect(function()
    mainContent.Visible = false
    miscContent.Visible = true
end)
