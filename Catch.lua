if game.PlaceId == 75418531859354 then
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Xlur │ Catch A Brainrot", HidePremium = false, IntroEnabled = false,IntroText = "Xlur", SaveConfig = true, ConfigFolder = "XlurConfig"})

local MainTab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4299432428",
	PremiumOnly = false
})

MainTab:AddToggle({
	Name = "Auto Claim",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})




end
OrionLib:Init()

