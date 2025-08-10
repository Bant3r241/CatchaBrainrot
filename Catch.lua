if game.PlaceId == 75418531859354 then
    local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonhirst/Orion/main/source'))()
    local Window = OrionLib:MakeWindow({Name="Xlur │ Catch A Brainrot",HidePremium=false,IntroEnabled=false,IntroText="Xlur",SaveConfig=true,ConfigFolder="XlurConfig"})

    _G.autoClaim,_G.FuseAll,_G.SellAll=false,false,false
    _G.AutoBuyRelic=""
    _G.AutoBuyBait=""
    _G.InfiniteJump,_G.ESP=false,false
    _G.WalkSpeed=16

    function autoClaimTrap()
        while _G.autoClaim do
            for i=1,12 do
                local trap="Trap"..i
                local TrapService=game:GetService("ReplicatedStorage").Packages.Knit.Services.TrapService.RF
                TrapService.Reveal:InvokeServer(trap)
                TrapService.Claim:InvokeServer(trap)
                wait(1)
            end
        end
    end

    function FuseAll() game:GetService("ReplicatedStorage").Packages.Knit.Services.RelicService.RF.SubmitAll:InvokeServer() end
    function SellAll() game:GetService("ReplicatedStorage").Packages.Knit.Services.SellService.RF.SellAll:InvokeServer() end

    function AutoBuyRelicFunc()
        while _G.AutoBuyRelic~="" do
            game:GetService("ReplicatedStorage").Packages.Knit.Services.RelicShopService.RF.Purchase:InvokeServer(_G.AutoBuyRelic)
            wait(5)
        end
    end

    function AutoBuyBaitFunc()
        while _G.AutoBuyBait~="" do
            game:GetService("ReplicatedStorage").Packages.Knit.Services.BaitShopService.RF.Purchase:InvokeServer(_G.AutoBuyBait)
            wait(5)
        end
    end

    local MainTab = Window:MakeTab({Name="Main",Icon="rbxassetid://4299432428",PremiumOnly=false})
    MainTab:AddToggle({Name="Auto Claim",Default=false,Callback=function(v) _G.autoClaim=v if v then autoClaimTrap() end end})
    MainTab:AddToggle({Name="Fuse All With Relic",Default=false,Callback=function(v) _G.FuseAll=v if v then FuseAll() end end})
    MainTab:AddToggle({Name="Sell All",Default=false,Callback=function(v) _G.SellAll=v if v then SellAll() end end})

    local RelicsTab=Window:MakeTab({Name="Relics",Icon="rbxassetid://4299432428",PremiumOnly=false})
    RelicsTab:AddDropdown({
        Name="Auto Buy Relic",
        Default="None",
        Options={"None","Sprout","Sun","Space"},
        Callback=function(v)
            _G.AutoBuyRelic = (v=="None") and "" or v
            if _G.AutoBuyRelic ~= "" then coroutine.wrap(AutoBuyRelicFunc)() end
        end
    })

    local BaitTab=Window:MakeTab({Name="Bait",Icon="rbxassetid://4299432428",PremiumOnly=false})
    BaitTab:AddDropdown({
        Name="Auto Buy Bait",
        Default="None",
        Options={"None","Fries","Banana","Cheese","Watermelon","Pineapple","Cupcake","Gold","Diamond"},
        Callback=function(v)
            _G.AutoBuyBait = (v=="None") and "" or v
            if _G.AutoBuyBait ~= "" then coroutine.wrap(AutoBuyBaitFunc)() end
        end
    })

    local MiscTab=Window:MakeTab({Name="Misc",Icon="rbxassetid://4299432428",PremiumOnly=false})
    MiscTab:AddToggle({Name="Infinite Jump",Default=false,Callback=function(v) 
        _G.InfiniteJump=v
        if v then
            game:GetService("UserInputService").InputBegan:Connect(function(inp,gp)
                if not gp and inp.UserInputType==Enum.UserInputType.Keyboard and inp.KeyCode==Enum.KeyCode.Space then
                    local plr=game.Players.LocalPlayer
                    local hum=plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
                    if hum and (hum:GetState()==Enum.HumanoidStateType.Jumping or hum:GetState()==Enum.HumanoidStateType.Freefall) then
                        hum:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                end
            end)
        end
    end})

    MiscTab:AddSlider({
        Name="Walk Speed",
        Min=16,
        Max=100,
        Default=16,
        Increment=1,
        Color=Color3.new(1,1,1),
        ValueName="Speed",
        Callback=function(val)
            _G.WalkSpeed=val
            local plr=game.Players.LocalPlayer
            local char=plr.Character or plr.CharacterAdded:Wait()
            local hum=char:WaitForChild("Humanoid")
            hum.WalkSpeed=val
        end
    })

    MiscTab:AddToggle({Name="ESP",Default=false,Callback=function(v)
        _G.ESP=v
        if v then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Bant3r241/CornerESP/refs/heads/main/ESP.lua"))()
        end
    end})

end

OrionLib:Init()

local UIS = game:GetService("UserInputService")

UIS.InputBegan:Connect(function(input, gp)
    if not gp and input.KeyCode == Enum.KeyCode.G then
        OrionLib:Toggle()
    end
end)
