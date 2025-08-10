if game.PlaceId == 75418531859354 then
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
    local Window = OrionLib:MakeWindow({
        Name = "Xlur │ Catch A Brainrot", 
        HidePremium = false, 
        IntroEnabled = false, 
        IntroText = "Xlur", 
        SaveConfig = true, 
        ConfigFolder = "XlurConfig"
    })

    _G.autoClaim = false

    local function autoClaimTrap()
        while _G.autoClaim do
            for i = 1, 12 do
                local trapName = "Trap" .. i
                game:GetService("ReplicatedStorage").Packages.Knit.Services.TrapService.RF.Reveal:InvokeServer(trapName)
                print(trapName .. " Revealed!")

                game:GetService("ReplicatedStorage").Packages.Knit.Services.TrapService.RF.Claim:InvokeServer(trapName)
                print(trapName .. " Claimed!")

                wait(1)
            end
        end
    end

    local MainTab = Window:MakeTab({
        Name = "Main",
        Icon = "rbxassetid://4299432428",
        PremiumOnly = false
    })
    
    MainTab:AddToggle({
        Name = "Auto Claim",
        Default = false,
        Callback = function(Value)
            _G.autoClaim = Value
            print("Auto Claim: " .. tostring(Value))
            if Value then
                autoClaimTrap()
            end
        end    
    })

end

OrionLib:Init()
