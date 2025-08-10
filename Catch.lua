if game.PlaceId == 75418531859354 then
    local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
    local Window = OrionLib:MakeWindow({Name = "Xlur │ Catch A Brainrot", HidePremium = false, IntroEnabled = false, IntroText = "Xlur", SaveConfig = true, ConfigFolder = "XlurConfig"})

  --Values
    
    _G.autoClaim = true
    _G.FuseAll = false
    _G.SellAll = false

    --Functions
    
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

    local function SellAll()
        game:GetService("ReplicatedStorage").Packages.Knit.Services.SellService.RF.SellAll:InvokeServer()
    end

    --Tabs
    
    local MainTab = Window:MakeTab({Name = "Main", Icon = "rbxassetid://4299432428", PremiumOnly = false})
    local RelicsTab = Window:MakeTab({Name = "Relics", Icon = "rbxassetid://4299432428", PremiumOnly = false})
    local BaitTab = Window:MakeTab({Name = "Bait", Icon = "rbxassetid://4299432428", PremiumOnly = false})
    local MiscTab = Window:MakeTab({Name = "Misc", Icon = "rbxassetid://4299432428", PremiumOnly = false})

    --Toggles
    
    MainTab:AddToggle({Name = "Auto Claim", Default = false, Callback = function(v) _G.autoClaim = v if v then autoClaimTrap() end end})
    MainTab:AddToggle({Name = "Fuse All With Relic", Default = false, Callback = function(v) _G.FuseAll = v if v then FuseAll() end end})
    MainTab:AddToggle({Name = "Sell All", Default = false, Callback = function(v) _G.SellAll = v if v then SellAll() end end})
end

OrionLib:Init()
