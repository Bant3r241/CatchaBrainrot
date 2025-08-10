if game.PlaceId == 75418531859354 then
    local OrionLib=loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonhirst/Orion/main/source'))()
    local Window=OrionLib:MakeWindow({Name="Xlur │ Catch A Brainrot",HidePremium=false,IntroEnabled=false,IntroText="Xlur",SaveConfig=true,ConfigFolder="XlurConfig"})

    _G.autoClaim=true;_G.FuseAll=false;_G.SellAll=false
    _G.AutoBuySprout=false;_G.AutoBuySun=false;_G.AutoBuySpace=false
    _G.AutoBuyFries=false;_G.AutoBuyBanana=false;_G.AutoBuyCheese=false;_G.AutoBuyWatermelon=false
    _G.AutoBuyPineapple=false;_G.AutoBuyCupcake=false;_G.AutoBuyGold=false;_G.AutoBuyDiamond=false
    _G.InfiniteJump=false;_G.JumpHeight=50

    local UserInputService=game:GetService("UserInputService")
    local Player=game.Players.LocalPlayer

    local function autoClaimTrap()
        while _G.autoClaim do
            for i=1,12 do
                local trap="Trap"..i
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

    local function AutoBuyRelic(name)
        while _G["AutoBuy"..name] do
            game:GetService("ReplicatedStorage").Packages.Knit.Services.RelicShopService.RF.Purchase:InvokeServer(name)
            wait(5)
        end
    end

    local function AutoBuyBait(name)
        while _G["AutoBuy"..name] do
            game:GetService("ReplicatedStorage").Packages.Knit.Services.BaitShopService.RF.Purchase:InvokeServer(name)
            wait(5)
        end
    end

    local MainTab=Window:MakeTab({Name="Main",Icon="rbxassetid://4299432428",PremiumOnly=false})
    MainTab:AddToggle({Name="Auto Claim",Default=false,Callback=function(v) _G.autoClaim=v if v then autoClaimTrap() end end})
    MainTab:AddToggle({Name="Fuse All With Relic",Default=false,Callback=function(v) _G.FuseAll=v if v then FuseAll() end end})
    MainTab:AddToggle({Name="Sell All",Default=false,Callback=function(v) _G.SellAll=v if v then SellAll() end end})

    local RelicsTab=Window:MakeTab({Name="Relics",Icon="rbxassetid://4299432428",PremiumOnly=false})
    RelicsTab:AddToggle({Name="Auto Buy Sprout",Default=false,Callback=function(v) _G.AutoBuySprout=v if v then AutoBuyRelic("Sprout") end end})
    RelicsTab:AddToggle({Name="Auto Buy Sun",Default=false,Callback=function(v) _G.AutoBuySun=v if v then AutoBuyRelic("Sun") end end})
    RelicsTab:AddToggle({Name="Auto Buy Space",Default=false,Callback=function(v) _G.AutoBuySpace=v if v then AutoBuyRelic("Space") end end})

    local BaitTab=Window:MakeTab({Name="Bait",Icon="rbxassetid://4299432428",PremiumOnly=false})
    BaitTab:AddToggle({Name="Auto Buy Fries",Default=false,Callback=function(v) _G.AutoBuyFries=v if v then AutoBuyBait("Fries") end end})
    BaitTab:AddToggle({Name="Auto Buy Banana",Default=false,Callback=function(v) _G.AutoBuyBanana=v if v then AutoBuyBait("Banana") end end})
    BaitTab:AddToggle({Name="Auto Buy Cheese",Default=false,Callback=function(v) _G.AutoBuyCheese=v if v then AutoBuyBait("Cheese") end end})
    BaitTab:AddToggle({Name="Auto Buy Watermelon",Default=false,Callback=function(v) _G.AutoBuyWatermelon=v if v then AutoBuyBait("Watermelon") end end})
    BaitTab:AddToggle({Name="Auto Buy Pineapple",Default=false,Callback=function(v) _G.AutoBuyPineapple=v if v then AutoBuyBait("Pineapple") end end})
    BaitTab:AddToggle({Name="Auto Buy Cupcake",Default=false,Callback=function(v) _G.AutoBuyCupcake=v if v then AutoBuyBait("Cupcake") end end})
    BaitTab:AddToggle({Name="Auto Buy Gold",Default=false,Callback=function(v) _G.AutoBuyGold=v if v then AutoBuyBait("Gold") end end})
    BaitTab:AddToggle({Name="Auto Buy Diamond",Default=false,Callback=function(v) _G.AutoBuyDiamond=v if v then AutoBuyBait("Diamond") end end})

    local MiscTab=Window:MakeTab({Name="Misc",Icon="rbxassetid://4299432428",PremiumOnly=false})
    MiscTab:AddToggle({Name="Infinite Jump",Default=false,Callback=function(v) _G.InfiniteJump=v end})

    UserInputService.InputBegan:Connect(function(input,gameProcessed)
        if not gameProcessed and _G.InfiniteJump then
            if input.UserInputType==Enum.UserInputType.Keyboard and input.KeyCode==Enum.KeyCode.Space then
                local humanoid=Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")
                if humanoid and (humanoid:GetState()==Enum.HumanoidStateType.Jumping or humanoid:GetState()==Enum.HumanoidStateType.Freefall) then
                    local root=Player.Character:FindFirstChild("HumanoidRootPart")
                    if root then root.Velocity=Vector3.new(0,_G.JumpHeight,0) end
                end
            end
        end
    end)
end
OrionLib:Init()
