local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0.3, 0, 0.6, 0)
MainFrame.Position = UDim2.new(0.02, 0, 0.2, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)  -- Dark gray background
MainFrame.BorderSizePixel = 0
MainFrame.BackgroundTransparency = 0.1
MainFrame.AnchorPoint = Vector2.new(0, 0)

local TabButton = Instance.new("TextButton")
TabButton.Parent = MainFrame
TabButton.Size = UDim2.new(1, 0, 0.1, 0)
TabButton.Position = UDim2.new(0, 0, 0, 0)
TabButton.Text = "Player Tab"
TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TabButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)  -- Slightly lighter gray
TabButton.Font = Enum.Font.SourceSans
TabButton.TextSize = 16
TabButton.BorderSizePixel = 0
TabButton.TextButton.MouseButton1Click:Connect(function()
    -- Add functionality for clicking this tab here
end)

local UIS = game:GetService("UserInputService")

-- Add hover effect for buttons
TabButton.MouseEnter:Connect(function()
    TabButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)  -- Darker gray when hovered
end)

TabButton.MouseLeave:Connect(function()
    TabButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
end)

local SectionFrame = Instance.new("Frame")
SectionFrame.Parent = MainFrame
SectionFrame.Size = UDim2.new(1, 0, 0.8, 0)
SectionFrame.Position = UDim2.new(0, 0, 0.1, 0)
SectionFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)  -- Lighter gray section background
SectionFrame.BorderSizePixel = 0
SectionFrame.BackgroundTransparency = 0.2

-- Add more buttons or toggles to this section frame as needed

