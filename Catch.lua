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
            local trapReady = game:GetService("ReplicatedStorage").Packages.Knit.Services.TrapService.RF.CanReveal:InvokeServer("Trap3")

            if trapReady then
                game:GetService("ReplicatedStorage").Packages.Knit.Services.TrapService.RF.Reveal:InvokeServer("Trap3")
                print("Trap Revealed!")

                local claimReady = game:GetService("ReplicatedStorage").Packages.Knit.Services.TrapService.RF.CanClaim:InvokeServer("Trap3")
                if claimReady then
                    game:GetService("ReplicatedStorage").Packages.Knit.Services.TrapService.RF.Claim:InvokeServer("Trap3")
                    print("Trap Claimed!")
                end
            end

            wait(1)
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
