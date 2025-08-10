if game.PlaceId == 75418531859354 then
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
    local Window = OrionLib:MakeWindow({Name = "Xlur │ Catch A Brainrot", HidePremium = false, IntroEnabled = false, IntroText = "Xlur", SaveConfig = true, ConfigFolder = "XlurConfig"})

    _G.autoClaim = true
    _G.FuseAll = false

    local function autoClaimTrap()
        while _G.autoClaim do
            for i = 1, 12 do
                local trap = "Trap" .. i
                game:GetService("ReplicatedStorage").Packages.Knit.Services.TrapService.RF.Reveal:InvokeServer(trap)
                game:GetService("ReplicatedStorage").Packages.Knit.Services.TrapService.RF.Claim:InvokeServer(trap)
                wait(1)
            end
        end
    end

    local function FuseAll()
        game:GetService("ReplicatedStorage").Packages.Knit.Services.RelicService.RF.SubmitAll:InvokeServer()
    end

    local MainTab = Window:MakeTab({Name = "Main", Icon = "rbxassetid://4299432428", PremiumOnly = false})
    MainTab:AddToggle({Name = "Auto Claim", Default = false, Callback = function(v) _G.autoClaim = v if v then autoClaimTrap() end end})
    MainTab:AddToggle({Name = "Fuse All With Relic", Default = false, Callback = function(v) _G.FuseAll = v if v then FuseAll() end end})
end

OrionLib:Init()
