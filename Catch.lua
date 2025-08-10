local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Create main frame (black background)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, 0, 400)
mainFrame.Position = UDim2.new(0, 0, 0, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.Parent = screenGui

-- Create tabs container
local tabContainer = Instance.new("Frame")
tabContainer.Size = UDim2.new(1, 0, 0, 50)
tabContainer.Position = UDim2.new(0, 0, 0, 0)
tabContainer.BackgroundTransparency = 1
tabContainer.Parent = mainFrame

-- Create Tab buttons
local mainTabButton = Instance.new("TextButton")
mainTabButton.Size = UDim2.new(0.5, 0, 1, 0)
mainTabButton.Text = "Main"
mainTabButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
mainTabButton.Parent = tabContainer

local miscTabButton = Instance.new("TextButton")
miscTabButton.Size = UDim2.new(0.5, 0, 1, 0)
miscTabButton.Position = UDim2.new(0.5, 0, 0, 0)
miscTabButton.Text = "Misc"
miscTabButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
miscTabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
miscTabButton.Parent = tabContainer

-- Create pages (Main and Misc)
local mainPage = Instance.new("Frame")
mainPage.Size = UDim2.new(1, 0, 1, -50) -- fill remaining space
mainPage.Position = UDim2.new(0, 0, 0, 50)
mainPage.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
mainPage.Visible = true
mainPage.Parent = mainFrame

local miscPage = Instance.new("Frame")
miscPage.Size = UDim2.new(1, 0, 1, -50)
miscPage.Position = UDim2.new(0, 0, 0, 50)
miscPage.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
miscPage.Visible = false
miscPage.Parent = mainFrame

-- Switch between tabs
mainTabButton.MouseButton1Click:Connect(function()
    mainPage.Visible = true
    miscPage.Visible = false
end)

miscTabButton.MouseButton1Click:Connect(function()
    mainPage.Visible = false
    miscPage.Visible = true
end)

-- Make GUI movable
local dragging = false
local dragStart = nil
local startPos = nil

-- Function to update position while dragging
local function updatePosition(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

-- Detect when the user starts dragging
tabContainer.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)

-- Detect when the user stops dragging
tabContainer.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- Update the position as the user drags
game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging then
        updatePosition(input)
    end
end)
