local Config = {
    WindowName = "V.G Hub",
	Color = Color3.fromRGB(255,128,64),
	Keybind = Enum.KeyCode.RightControl
}
repeat wait() until game:IsLoaded() wait()
game:GetService("Players").LocalPlayer.Idled:connect(function()
game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)
game:GetService("RunService").Stepped:connect(
    function()
        sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", 1000)
    end
)

if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Main") then
repeat wait() until game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main") 
end
if game.Players.LocalPlayer.Character then
repeat wait() until game.Players.LocalPlayer.Character
end

local Name = "Shindo.json"

Des = {}
if makefolder then
    makefolder("V.G Hub")
end

local Settings

if
    not pcall(
        function()
            readfile("V.G Hub//" .. Name)
        end
    )
 then
    writefile("V.G Hub//" .. Name, game:GetService("HttpService"):JSONEncode(Des))
end
if readfile("V.G Hub//" .. Name) then
Settings = game:GetService("HttpService"):JSONDecode(readfile("V.G Hub//" .. Name))
end
local function Save()
    writefile("V.G Hub//" .. Name, game:GetService("HttpService"):JSONEncode(Settings))
end

pcall(function()
Dungon = {}
for i=1,15 do 
table.insert(Dungon,"dungeon"..i)
end 
end)
local player = game.Players.LocalPlayer


local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/test"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))
local Tab1 = Window:CreateTab("")
local Tab2 = Window:CreateTab("UI Settings")

local Section1 = Tab1:CreateSection("")
local Section2 = Tab1:CreateSection("")
local SectionA = Tab1:CreateSection("")
local Section3 = Tab2:CreateSection("Menu")
local Section4 = Tab2:CreateSection("Background")


local Toggle1 = Section1:CreateToggle("Anti Grip/Godmode", Settings.AntiGrip, function(State)
Settings.AntiGrip = State
if Settings.AntiGrip then
game.StarterGui:SetCore("SendNotification", {
Title = "lol";
Text = "you need to die once then it will work";
})
end
spawn(function()
while wait() and Settings.AntiGrip do
    pcall(
        function()
            if game.Players.LocalPlayer.Character.fakehealth.Value == 0 then
                game.Players.LocalPlayer.Character.fakehealth:Destroy()
            end
        end
    )
end
end)
end)
if game.PlaceId == 7524809704 then
local Toggle1 = Section1:CreateToggle("AutoStart Dungeon", Settings.Dungeon1, function(State)
Settings.Dungeon1 = State
spawn(
    function()
        while wait() and Settings.Dungeon1 do
            game:GetService("Players").LocalPlayer.pressplay:FireServer(Dungon)
        end
    end
)
end)

local Dropdown1 = Section1:CreateDropdown("Dungeons", Dungon, function(String)
	Settings.Dungeon = String
	Dungon = Settings.Dungeon
end)

end

local Toggle1 = Section1:CreateToggle("AutoFarm Logs", Settings.Logs, function(State)
Settings.Logs = State
game:GetService("RunService").Stepped:connect(
    function()
        if Settings.Logs then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(11)
        end
    end
)

spawn(function()
while Settings.Logs do
    wait()
    pcall(
        function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            game:GetService("Workspace").npc.logtraining.HumanoidRootPart.CFrame * CFrame.new(0, -5, 0)
            game:GetService("Players").LocalPlayer.Character.combat.update:FireServer("mouse1", true)
            game:GetService("Players").LocalPlayer.Character.combat.update:FireServer("mouse1", false)
        end
    )
end
end)
end)



--[[
local Toggle1 = Section1:CreateToggle("AutoFarm Candy", nil, function(State)
getgenv().AutoCandy = State
game:GetService("RunService").Stepped:connect(
    function()
        if getgenv().AutoCandy then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(11)
        end
    end
)
while getgenv().AutoCandy do
    wait()
    pcall(
        function()
            repeat
                wait(0.5)
                for i, v in pairs(game:GetService("Workspace").game.Players.LocalPlayer.PlayerGui:WaitForChild("Main"):WaitForChild("ingame"):WaitForChild("Missionstory")givers:GetDescendants()) do
                    if
                        v:FindFirstChild("Head") and v.Head:FindFirstChild("givemission") and v.Head.givemission.Enabled and
                            v.Head.givemission:FindFirstChild("color").Image == "rbxassetid://7852180920"
                     then
                        pcall(
                            function()
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                    v.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                                v:FindFirstChild("CLIENTTALK"):FireServer()
                                v:FindFirstChild("CLIENTTALK"):FireServer("accept")
                            end
                        )
                    end
                end
            until getgenv().AutoCandy == false
        end
    )
end
end)]]--


if game.PlaceId ~= 7524809704 then
local Toggle1 = Section1:CreateToggle("Event Bosses", Settings.EventBosses, function(State)
Settings.EventBosses = State

game:GetService("RunService").Stepped:connect(
    function()
        if Settings.EventBosses then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(11)
        end
    end
)
spawn(function()
while wait() and Settings.EventBosses do
    for i, v in pairs(game:GetService("Workspace").npc:GetChildren()) do
        if v.Name ~= "logtraining" and v:FindFirstChild("Head") and
                                v.Head.CFrame.Y > -1000 then
            repeat
                wait()
                pcall(
                    function()
                        game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0, -5, 3))
                        game.Players.LocalPlayer.Character.combat.update:FireServer("mouse1", true)
                        game.Players.LocalPlayer.Character.combat.update:FireServer("mouse1", false)
                    end)
            until v.Humanoid.Health == 0 or not v or not Settings.EventBosses
        end
    end
end
end)
end)

local Toggle1 = Section1:CreateToggle("AutoFarm Mobs", Settings.AutoMobs, function(State)
Settings.AutoMobs = State
game:GetService("RunService").Stepped:connect(
    function()
        if Settings.AutoMobs then pcall(function()
            j = string.split(game.Players.LocalPlayer.PlayerGui:WaitForChild("Main"):WaitForChild("ingame"):WaitForChild("Missionstory").bg.name.Text, "(s)")[1]

            game.Players.LocalPlayer.PlayerGui:WaitForChild("Main"):WaitForChild("ingame"):WaitForChild("Missionstory").bg.name.Text =
                string.gsub(j, tostring((s)), "")

            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(11)
            end)
        end
    end
)
spawn(function()
while Settings.AutoMobs do
    wait()
    pcall(
        function()
            repeat
                wait()
                for i, v in pairs(game:GetService("Workspace").missiongivers:GetChildren()) do
                    if
                        v:FindFirstChild("Head") and v.Head:FindFirstChild("givemission") and v.Head.givemission.Enabled and
                            v.Head.givemission:FindFirstChild("color").Image ==
                                "http://www.roblox.com/asset/?id=5459241648"
                     then
                        if game.Players.LocalPlayer.PlayerGui:WaitForChild("Main"):WaitForChild("ingame"):WaitForChild("Missionstory").Visible == false then 
                            pcall(
                                function()
                                    game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0, -5, 3))
                                        wait(0.3)
                                    v:FindFirstChild("CLIENTTALK"):FireServer()
                                    v:FindFirstChild("CLIENTTALK"):FireServer("accept") wait(0.5)
                                end
                            )
                        end
                    end
                end
            until Settings.AutoMobs == false or game.Players.LocalPlayer.PlayerGui:WaitForChild("Main"):WaitForChild("ingame"):WaitForChild("Missionstory").Visible == true
            repeat
                wait()
                if game.Players.LocalPlayer.PlayerGui:WaitForChild("Main"):WaitForChild("ingame"):WaitForChild("Missionstory").Visible == true then
                    for i, v in pairs(game:GetService("Workspace").npc:GetChildren()) do
                        if v:FindFirstChild("npctype") then
                          print("Hi")
                        end
                        if 
                            v.ClassName == "Model" and v:FindFirstChild("npctype") and
                                string.find(game.Players.LocalPlayer.PlayerGui:WaitForChild("Main"):WaitForChild("ingame"):WaitForChild("Missionstory").bg.name.Text, v.Head.mob.fram.name.info.Text) and
                                v:FindFirstChild("HumanoidRootPart") and
                                v:FindFirstChild("Humanoid") and
                                v.Head.CFrame.Y > -1000
                         then
                            pcall(
                                function() wait(0.2)
                                       game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0, -5, 3))
                                    if v:FindFirstChild("antiexploit") then
                                        v.antiexploit:remove()
                                    end
                                    game:GetService("Players").LocalPlayer.Character.combat.update:FireServer("mouse1", true)
                                    game:GetService("Players").LocalPlayer.Character.combat.update:FireServer("mouse1", false)
                                    if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health < v.Humanoid.MaxHealth then
                                    v.Humanoid.Health = 0
                                    end 
                                end
                            )
                        end
                    end
                end
               
            until Settings.AutoMobs == false or game.Players.LocalPlayer.PlayerGui:WaitForChild("Main"):WaitForChild("ingame"):WaitForChild("Missionstory").Visible == false and v.Humanoid.Health == 0 and v
        end
    )
end
end)
end)




local Toggle1 = Section1:CreateToggle("AutoFarm Dungeon", Settings.Hope, function(State)
Settings.Hope = State
game:GetService("RunService").Stepped:connect(
    function()
        if Settings.Hope then pcall(function()
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(11)
            end)
        end
    end
)
spawn(function()
while Settings.Hope do
    wait()
    pcall(
        function()

            repeat
                wait()
                    for i, v in pairs(game:GetService("Workspace").npc:GetChildren()) do
                        if v:FindFirstChild("npctype") then
                          print("Hi")
                        end
                        if 
                            v.ClassName == "Model" and v:FindFirstChild("npctype")  and
                                v:FindFirstChild("HumanoidRootPart") and
                                v:FindFirstChild("Humanoid") and
                                v.Head.CFrame.Y > -1000
                         then
                            pcall(
                                function() 
                                    game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0, -5, 3))
                                    if v:FindFirstChild("antiexploit") then
                                        v.antiexploit:remove()
                                    end
                                    game:GetService("Players").LocalPlayer.Character.combat.update:FireServer("mouse1", true)
                                    game:GetService("Players").LocalPlayer.Character.combat.update:FireServer("mouse1", false)
                                    if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health < v.Humanoid.MaxHealth then
                                    v.Humanoid.Health = 0
                                    end 
                                end
                            )

                    end
                end
               
            until Settings.Hope == false or v.Humanoid.Health == 0 and v
        end
    )
end
end)
end)


if game.PlaceId == 5451401540 then
local Toggle1 = Section1:CreateToggle("AutoFarm Maru", Settings.Bosses2, function(State)
Settings.Bosses2 = State
game:GetService("RunService").Stepped:connect(
    function()
        if Settings.Bosses2 then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(11)
        end
    end
)
spawn(function()
while Settings.Bosses2 do
    pcall(
        function()
            wait()
            repeat
                wait()
                for i, v in pairs(game:GetService("Workspace").MARUmission.missions:GetChildren()) do
                    for i, v in pairs(v:GetChildren()) do
                        if v:IsA("Model") and v:FindFirstChild("Head") then
                            if game.Players.LocalPlayer.PlayerGui:WaitForChild("Main"):WaitForChild("ingame"):WaitForChild("Missionstory").Visible == false then
                                game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0, -5, 3))
                                wait(0.3)
                                v:FindFirstChild("CLIENTTALK"):FireServer()
                                v:FindFirstChild("CLIENTTALK"):FireServer("accept")
                                wait(0.5)
                            end
                        end
                    end
                end
            until Settings.Bosses2 == false or game.Players.LocalPlayer.PlayerGui:WaitForChild("Main"):WaitForChild("ingame"):WaitForChild("Missionstory").Visible == true
            repeat
                wait()
                for i, v in pairs(game:GetService("Workspace").npc:GetChildren()) do
                    if
                        v.ClassName == "Model" and v:FindFirstChild("npctype") then
                        if game.Players.LocalPlayer.PlayerGui:WaitForChild("Main"):WaitForChild("ingame"):WaitForChild("Missionstory").Visible == true then 
                            game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0, -5, 3))
                            if v:FindFirstChild("antiexploit") then
                            v.antiexploit:remove()
                            end
                            game:GetService("Players").LocalPlayer.Character.combat.update:FireServer("mouse1", true)
                            game:GetService("Players").LocalPlayer.Character.combat.update:FireServer("mouse1", false)
                            if isnetworkowner(v.HumanoidRootPart) and v.Humanoid.Health < v.Humanoid.MaxHealth and v:FindFirstChild("HumanoidRootPart") then
                                v.Humanoid.Health = 0
                            end
                        end
                    end
                end
            until Settings.Bosses2 == false or game.Players.LocalPlayer.PlayerGui:WaitForChild("Main"):WaitForChild("ingame"):WaitForChild("Missionstory").Visible == false and v.Humanoid.Health == 0 and v
        end
    )
end
end)

end)

local Toggle1 = Section1:CreateToggle("AutoFarm tailbeastboss", Settings.Bosses3, function(State)
Settings.Bosses3 = State
game:GetService("RunService").Stepped:connect(
    function()
        if Settings.Bosses3 then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(11)
        end
    end
)
spawn(function()
while Settings.Bosses3 do
    pcall(
        function()
            wait()
            repeat
                wait()
                for i, v in pairs(game:GetService("Workspace").tailbeastbossmission.missions:GetChildren()) do
                    for i, v in pairs(v:GetChildren()) do
                        if v:IsA("Model") and v:FindFirstChild("Head") then
                            if game.Players.LocalPlayer.PlayerGui:WaitForChild("Main"):WaitForChild("ingame"):WaitForChild("Missionstory").Visible == false then
                               game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0, -5, 3))
                                wait(0.3)
                                v:FindFirstChild("CLIENTTALK"):FireServer()
                                v:FindFirstChild("CLIENTTALK"):FireServer("accept")
                                wait(0.5)
                            end
                        end
                    end
                end
            until Settings.Bosses3 == false or game.Players.LocalPlayer.PlayerGui:WaitForChild("Main"):WaitForChild("ingame"):WaitForChild("Missionstory").Visible == true
            repeat
                wait()
                for i, v in pairs(game:GetService("Workspace").npc:GetChildren()) do
                    if
                        v.ClassName == "Model" and v:FindFirstChild("npctype") then
                        if game.Players.LocalPlayer.PlayerGui:WaitForChild("Main"):WaitForChild("ingame"):WaitForChild("Missionstory").Visible == true then 
                            game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0, -5, 3))
                            if v:FindFirstChild("antiexploit") then
                            v.antiexploit:remove()
                            end
                            game:GetService("Players").LocalPlayer.Character.combat.update:FireServer("mouse1", true)
                            game:GetService("Players").LocalPlayer.Character.combat.update:FireServer("mouse1", false)
                            if isnetworkowner(v.HumanoidRootPart) and v.Humanoid.Health < v.Humanoid.MaxHealth and v:FindFirstChild("HumanoidRootPart") then
                                v.Humanoid.Health = 0
                            end
                        end
                    end
                end
            until Settings.Bosses3 == false or game.Players.LocalPlayer.PlayerGui:WaitForChild("Main"):WaitForChild("ingame"):WaitForChild("Missionstory").Visible == false and v.Humanoid.Health == 0 and v
        end
    )
end
end)

end)
end 
local Toggle1 = Section1:CreateToggle("AutoFarm Boss", Settings.Bosses, function(State)
Settings.Bosses = State
game:GetService("RunService").Stepped:connect(
    function()
        if Settings.Bosses then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(11)
        end
    end
)
spawn(function()
while Settings.Bosses do
    pcall(
        function()
            wait()
            repeat
                wait()
                for i, v in pairs(game:GetService("Workspace").bossdropmission.missions:GetChildren()) do
                    for i, v in pairs(v:GetChildren()) do
                        if v:IsA("Model") and v:FindFirstChild("Head") then
                            if game.Players.LocalPlayer.PlayerGui:WaitForChild("Main"):WaitForChild("ingame"):WaitForChild("Missionstory").Visible == false then
                                game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0, -5, 3))
                                wait(0.3)
                                v:FindFirstChild("CLIENTTALK"):FireServer()
                                v:FindFirstChild("CLIENTTALK"):FireServer("accept")
                                wait(0.5)
                            end
                        end
                    end
                end
            until Settings.Bosses == false or game.Players.LocalPlayer.PlayerGui:WaitForChild("Main"):WaitForChild("ingame"):WaitForChild("Missionstory").Visible == true
            repeat
                wait()
                for i, v in pairs(game:GetService("Workspace").npc:GetChildren()) do
                    if
                        v.ClassName == "Model" and v:FindFirstChild("npctype") and
                            string.find(game.Players.LocalPlayer.PlayerGui:WaitForChild("Main"):WaitForChild("ingame"):WaitForChild("Missionstory").bg.name.Text, v.Head.mob.fram.name.info.Text)
                     then
                        if game.Players.LocalPlayer.PlayerGui:WaitForChild("Main"):WaitForChild("ingame"):WaitForChild("Missionstory").Visible == true then 
                            game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0, -5, 3))
                            if v:FindFirstChild("antiexploit") then
                            v.antiexploit:remove()
                            end
                            game:GetService("Players").LocalPlayer.Character.combat.update:FireServer("mouse1", true)
                            game:GetService("Players").LocalPlayer.Character.combat.update:FireServer("mouse1", false)
                            if v.Humanoid.Health < v.Humanoid.MaxHealth and v:FindFirstChild("HumanoidRootPart") then
                                v.Humanoid.Health = 0
                            end
                        end
                    end
                end
            until Settings.Bosses == false or game.Players.LocalPlayer.PlayerGui:WaitForChild("Main"):WaitForChild("ingame"):WaitForChild("Missionstory").Visible == false and v.Humanoid.Health == 0 and v
        end
    )
end
end)

end)
if setclipboard then
local Button1 = Section1:CreateButton("Copy Vip Server Codes", function()
setclipboard("-E0BJK 0Skr9C 1Isuub 2tgOb8 2vy3Dn 7rTU-A 7v09lz 8CGAZH BcBuAN CI98Au Do2o8A JFDOST KFXSrq QeR2eN Qratoy RRu4E7 Rjb0rQ SbFkZm TVDDoU WY4chE _5_oXy cJ7LIe cdv9R4 dBNARC dG5Y-3 fLe-Az hnI8qv nWv2xH puv68h sCCXqk tkqyBR v5-9u3 w1wF1v zfU90r")
end)
end
local Toggle1 = Section1:CreateToggle("AutoRank", Settings.Rebirth, function(State)
Settings.Rebirth = State
spawn(function()
while wait() and Settings.Rebirth do
    if game.Players.LocalPlayer.statz.lvl:FindFirstChild("lvl").Value >= 500 then
        if
            game.Players.LocalPlayer.statz.prestige.maxlvlpres.Value >= 1 or
                game.Players.LocalPlayer.statz.prestige.maxlvlpres.Value == 0 and
                    game.Players.LocalPlayer.statz.prestige.rank.Value == "Z" and
                    game.Players.LocalPlayer.statz.prestige.number.Value == "3"
         then
            repeat
                wait(0.5)
                game.Players.LocalPlayer.startevent:FireServer("maxlvlpres")
            until game.Players.LocalPlayer.statz.lvl:FindFirstChild("lvl").Value == 1 or not Settings.Rebirth
        else
            repeat
                wait(0.5)
                game.Players.LocalPlayer.startevent:FireServer("rankup")
            until game.Players.LocalPlayer.statz.lvl:FindFirstChild("lvl").Value == 1 or not Settings.Rebirth
        end
    end
end
end)
end)
local Toggle1 = Section1:CreateToggle("jinfarm", Settings.Jin, function(State)
Settings.Jin = State

game:GetService("RunService").Stepped:connect(
    function()
        if Settings.Jin then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(11)
        end
    end
)
spawn(function()
while wait() and Settings.Jin do
    for i, v in pairs(game:GetService("Workspace").npc:GetChildren()) do
        if v.Name == "npc1" then
            repeat
                wait()
                pcall(
                    function()
                        game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0, -5, 3))
                            game.Players.LocalPlayer.Character.combat.update:FireServer("mouse1", true)
                            game.Players.LocalPlayer.Character.combat.update:FireServer("mouse1", false)
                         if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health < v.Humanoid.MaxHealth then
                            v.Humanoid.Health = 0
                        end 
                    end
                )
            until v.Humanoid.Health == 0 or not v or not Settings.Jin
        end
    end
end
end)
end)
local Toggle1 = Section1:CreateToggle("AutoWar", Settings.War, function(State)
Settings.War = State

game:GetService("RunService").Stepped:connect(
    function()
        if Settings.War then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(11)
        end
    end
)

spawn(function()
while Settings.War do
    wait()
    pcall(
        function()
            for i, v in pairs(workspace.npc:GetChildren()) do
                if
                    v.ClassName == "Model" and v:FindFirstChild("npc") and string.find(v.Name, "npc") and
                        v:FindFirstChild("HumanoidRootPart") and
                        v:FindFirstChild("Humanoid") and
                        v.Head.CFrame.Y > -1000 and
                        not v:FindFirstChild("megaboss")
                 then
                    game:GetService("Players").LocalPlayer.Character.combat.update:FireServer("mouse1", true)
                    game:GetService("Players").LocalPlayer.Character.combat.update:FireServer("mouse1", false)
                    game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0, -5, 3))
                    if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health < v.Humanoid.MaxHealth then
                        v.Humanoid.Health = 0
                    end
                elseif
                    v.ClassName == "Model" and v:FindFirstChild("npc") and string.find(v.Name, "npc") and
                        v:FindFirstChild("HumanoidRootPart") and
                        v:FindFirstChild("Humanoid") and
                        v.Head.CFrame.Y > -1000 and
                        v:FindFirstChild("megaboss")
                 then
                    wait(6)
                    game:GetService("Players").LocalPlayer.Character.combat.update:FireServer("mouse1", true)
                    game:GetService("Players").LocalPlayer.Character.combat.update:FireServer("mouse1", false)
                    game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(v.HumanoidRootPart.Position + Vector3.new(0, -5, 3))
                    if v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health < v.Humanoid.MaxHealth then
                        v.Humanoid.Health = 0
                    end
                end
            end
        end
    )
end

end)
end)

local Toggle1 = Section1:CreateToggle("ScrollFarm", Settings.Scroll, function(State)
Settings.Scroll = State
spawn(function()
while Settings.Scroll do
    wait()
    pcall(
        function()
            for i, v in pairs(game.workspace.GLOBALTIME:GetChildren()) do
                if
                    v.ClassName == "Model" and v:FindFirstChild("sh") and v.sh.Position.Y > -1000 and
                        v.sh.Position.Y < 2000
                 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.sh.CFrame
                    fireclickdetector(v.sh:FindFirstChildWhichIsA("ClickDetector"))
                end
            end
            for i, v in pairs(game.workspace:GetChildren()) do
                if
                    v.ClassName == "Model" and v:FindFirstChild("sh") and v.sh.Position.Y > -1000 and
                        v.sh.Position.Y < 2000
                 then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.sh.CFrame
                    fireclickdetector(v.sh:FindFirstChildWhichIsA("ClickDetector"))
                end
            end
        end
    )
end
end)
end)

local Toggle1 = Section1:CreateToggle("Auto Upgrade Health", Settings.Health, function(State)
Settings.Health = State
spawn(function()
while Settings.Health do
    wait()
    game:GetService("Players").LocalPlayer.startevent:FireServer("addstat", "health", 5)
end
end)
end)
local Toggle1 = Section1:CreateToggle("Auto Upgrade Ninjutsu", Settings.Ninjutsu, function(State)
Settings.Ninjutsu = State
spawn(function()
while Settings.Ninjutsu do
    wait()
    game:GetService("Players").LocalPlayer.startevent:FireServer("addstat", "ninjutsu", 5)
end
end)
end)


local Toggle1 = Section1:CreateToggle("Auto Upgrade Taijutsu", Settings.Taijutsu, function(State)
Settings.Taijutsu = State
spawn(function()
while Settings.Taijutsu do
    wait()
    game:GetService("Players").LocalPlayer.startevent:FireServer("addstat", "taijutsu", 5)
end
end)
end)
local Toggle1 = Section1:CreateToggle("Auto Upgrade Chakra", Settings.Chakra, function(State)
Settings.Chakra = State
spawn(function()
while Settings.Chakra do
    wait()
    game:GetService("Players").LocalPlayer.startevent:FireServer("addstat", "chakra", 5)
end
end)
end)

end -- where it stops

if game.PlaceId == 4616652839 then
local Bloods = {}
for i,v in pairs(game:GetService("ReplicatedStorage").alljutsu:GetChildren()) do
    if v:IsA("Folder") and v:FindFirstChild("KG") then
        table.insert(Bloods,v.Name)
    end
end 
local ELEMENT = {}
for i,v in pairs(game:GetService("ReplicatedStorage").alljutsu:GetChildren()) do
    if v:IsA("Folder") and v:FindFirstChild("ELEMENT") then
        table.insert(ELEMENT,v.Name)
    end
end 

local Er = {}
for i,v in pairs(game:GetService("Players").LocalPlayer.statz.main:GetChildren()) do
    if v.Name:find("element") then
        table.insert(Er,v.Name)
    end
end
local Er1 = {}
for i,v in pairs(game:GetService("Players").LocalPlayer.statz.main:GetChildren()) do
    if v.Name:find("kg") then
        table.insert(Er1,v.Name)
    end
end
if Settings.elementslot == nil then
    Settings.elementslot = "element1"
end
if Settings.bloodslots == nil then
    Settings.bloodslots = "kg1"
end
local Toggle1 = Section1:CreateToggle("Auto Element", Settings.Element1, function(State)
Settings.Element1 = State
spawn(function()
while Settings.Element1 do
    wait()
    if not string.find(Settings.Element,
        game:GetService("Players").LocalPlayer.statz.main[Settings.elementslot].Value) and not game:GetService("Players").LocalPlayer.statz.main[Settings.elementslot]:FindFirstChild("dontspin") then
    game:GetService("Players").LocalPlayer.startevent:FireServer("spin", Settings.elementslot)
    wait(1)
    game.StarterGui:SetCore(
        "SendNotification",
        {
            Title = "sex",
            Text = "Current sex is " .. game:GetService("Players").LocalPlayer.statz.main[Settings.elementslot].Value
        }
    )
    
end
if not Settings.Element1 or game:GetService("Players").LocalPlayer.statz.spins.Value == 0 then
        game.Players.keypressE.startevent:FireServer(unpack({
        [1] = 'rpgteleport',
        [2] = game.PlaceId
}))
end
end
end)
end)
local Dropdown1 = Section1:CreateDropdown("Elementslot", Er, function(String)
	Settings.elementslot = String
end)


local Dropdown1 = Section1:CreateDropdown("Elements", ELEMENT, function(String)
	Settings.Element = String
end)



local Toggle1 = Section1:CreateToggle("Auto BloodLine", Settings.Element2, function(State)
Settings.Element2 = State
spawn(function()
while Settings.Element2 do
    wait()
    if not string.find(Settings.BloodLine,game:GetService("Players").LocalPlayer.statz.main[Settings.bloodslots].Value) and not game:GetService("Players").LocalPlayer.statz.main[Settings.bloodslots]:FindFirstChild("dontspin") then 
    game:GetService("Players").LocalPlayer.startevent:FireServer("spin", Settings.bloodslots)
    wait(1)
    game.StarterGui:SetCore(
        "SendNotification",
        {
            Title = "sex",
            Text = "Current sex is " .. game:GetService("Players").LocalPlayer.statz.main[Settings.bloodslots].Value
        }
    )
    
end 
if not Settings.Element2 or game:GetService("Players").LocalPlayer.statz.spins.Value == 0 then
            game.Players.keypressE.startevent:FireServer(unpack({
        [1] = 'rpgteleport',
        [2] = game.PlaceId
}))
end
end
end)
end)
local Dropdown1 = Section1:CreateDropdown("BloodLines Slots", Er1, function(String)
	Settings.bloodslots = String
end)



local Dropdown1 = Section1:CreateDropdown("BloodLines", Bloods, function(String)
	Settings.BloodLine = String
end)

end -- where it stops

local Toggle1 = SectionA:CreateToggle("AutoKeyPress R", Settings.R, function(State)
Settings.R = State
spawn(function()
while Settings.R do
    wait()
game:GetService('VirtualInputManager'):SendKeyEvent(true,"R",false,uwu)
end 
end)
end)

local Toggle1 = SectionA:CreateToggle("AutoKeyPress T", Settings.T, function(State)
Settings.T = State
spawn(function()
while Settings.T do
    wait()
game:GetService('VirtualInputManager'):SendKeyEvent(true,"T",false,uwu)
end
end)
end)

local Toggle1 = SectionA:CreateToggle("AutoKeyPress Y", Settings.Y, function(State)
Settings.Y = State
spawn(function()
while Settings.Y do
    wait()
game:GetService('VirtualInputManager'):SendKeyEvent(true,"Y",false,uwu)
end 
end)
end)

local Toggle1 = SectionA:CreateToggle("AutoKeyPress F", Settings.F, function(State)
Settings.F = State
spawn(function()
while Settings.F do 
    wait()
game:GetService('VirtualInputManager'):SendKeyEvent(true,"F",false,uwu)
end
end)
end)

local Toggle1 = SectionA:CreateToggle("AutoKeyPress G", Settings.G, function(State)
Settings.G = State
spawn(function()
while Settings.G do 
    wait()
game:GetService('VirtualInputManager'):SendKeyEvent(true,"G",false,uwu)
end
end)
end)

local Toggle1 = SectionA:CreateToggle("AutoKeyPress H", Settings.H, function(State)
Settings.H = State
spawn(function()
while Settings.H do 
    wait()
game:GetService('VirtualInputManager'):SendKeyEvent(true,"H",false,uwu)
end
end)
end)

local Toggle1 = SectionA:CreateToggle("AutoKeyPress Q", Settings.Q, function(State)
Settings.Q = State
spawn(function()
while Settings.Q do 
    wait()
game:GetService('VirtualInputManager'):SendKeyEvent(true,"Q",false,uwu)
end 
end)
end)

local Toggle1 = SectionA:CreateToggle("AutoKeyPress E", Settings.E, function(State)
Settings.E = State
spawn(function()
while Settings.E do 
    wait()
game:GetService('VirtualInputManager'):SendKeyEvent(true,"E",false,uwu)
end 
end)
end)

local Toggle1 = SectionA:CreateToggle("AutoKeyPress V", Settings.V, function(State)
Settings.V = State
spawn(function()
while Settings.V do 
    wait()
game:GetService('VirtualInputManager'):SendKeyEvent(true,"V",false,uwu)
end 
end)
end)

local Toggle1 = SectionA:CreateToggle("AutoKeyPress B", Settings.B, function(State)
Settings.B = State
spawn(function()
while Settings.B do 
    wait()
game:GetService('VirtualInputManager'):SendKeyEvent(true,"B",false,uwu)
end 
end)
end)

local Toggle1 = SectionA:CreateToggle("AutoKeyPress N", Settings.N, function(State)
Settings.N = State
spawn(function()
while Settings.N do 
    wait()
game:GetService('VirtualInputManager'):SendKeyEvent(true,"N",false,uwu)
end 
end)
end)
local Toggle1 = Section2:CreateToggle("Enable WalkSpeed/JumpPower", Settings.Go, function(State)
Settings.Go = State
game:GetService("RunService").Stepped:connect(
    function()
        if Settings.Go then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = Settings.WalkSpeed
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").JumpPower = Settings.JumpPower
            if not game:GetService("UserInputService").WindowFocusReleased then
                setfpscap(Settings.Fps)
            end
        end
    end
)

end)

local TextBox1 = Section2:CreateTextBox("Fps Cap", "Only numbers", true, function(Value)
    Settings.Fps = Value
end)

local TextBox1 = Section2:CreateTextBox("WalkSpeed", "Only numbers", true, function(Value)
    Settings.WalkSpeed = Value
end)
local TextBox1 = Section2:CreateTextBox("JumpPower", "Only numbers", true, function(Value)
    Settings.JumpPower = Value
end)

local TextBox1 = Section2:CreateTextBox("Seconds Until ServerHop", "Only numbers", true, function(Value)
    Settings.Seconds = Value
end)



local Toggle1 = Section2:CreateToggle("Infinite Jump", Settings.InfiniteJump, function(State)
Settings.InfiniteJump = State
game:GetService("UserInputService").JumpRequest:connect(
    function()
        if Settings.InfiniteJump then
            game:GetService "Players".LocalPlayer.Character:FindFirstChildOfClass "Humanoid":ChangeState("Jumping")
        end
    end
)
end)

local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G-Hub/main/Karrot-Esp"))()
local Toggle1 = Section1:CreateToggle("Enable Esp", Settings.Esp, function(State)
    Settings.Esp = State
    ESP:Toggle(Settings.Esp)
end)
local Toggle1 = Section1:CreateToggle("PLayer Esp", Settings.PlayerEsp, function(State)
    Settings.PlayerEsp = State
    ESP.Players = Settings.PlayerEsp
end)
local Toggle1 = Section1:CreateToggle("Tracers Esp", Settings.Tracers, function(State)
    Settings.Tracers = State
    ESP.Tracers = Settings.Tracers
end)
local Toggle1 = Section1:CreateToggle("Name Esp", Settings.EspNames, function(State)
    ESP.Names = Settings.EspNames
    Settings.EspNames = State
end)
local Toggle1 = Section1:CreateToggle("Boxes Esp", Settings.Boxes, function(State)
    Settings.Boxes = State
    ESP.Boxes = Settings.Boxes
end)

local Toggle1 = Section2:CreateToggle("Invisicam", Settings.Sorry, function(State)
Settings.Sorry = State
if Settings.Sorry then
    game:GetService("Players").LocalPlayer.DevCameraOcclusionMode = "Invisicam"
else
    game:GetService("Players").LocalPlayer.DevCameraOcclusionMode = "Zoom"
end
end)
local Toggle1 = Section2:CreateToggle("Be Wired", Settings.Weird, function(State)
Settings.Weird = State
spawn(
    function()
        while Settings.Weird do
            wait()
            pcall(
                function()
                    game.Players.LocalPlayer.Character["Left Leg"]:remove()
                    game.Players.LocalPlayer.Character["Left Arm"]:remove()
                    game.Players.LocalPlayer.Character["Right Arm"]:remove()
                    game.Players.LocalPlayer.Character["Right Leg"]:remove()
                end
            )
        end
    end
)
end)

local Toggle1 = Section2:CreateToggle("U Noclip ", Settings.Sex1, function(State)
noclips = false
Settings.Sex1 = State
game.Players.LocalPlayer:GetMouse().KeyDown:connect(
    function(v)
        if v == "u" then
            if Settings.Sex1 then
                noclips = not noclips
                for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            end
        end
    end
)
game:GetService("RunService").Stepped:connect(
    function()
        if noclips then
            for i, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
        end
    end
)

end)

local Toggle1 = Section2:CreateToggle("G Noclip", Settings.Sex, function(State)
Settings.Sex = State
noclip = false
game:GetService("RunService").Stepped:connect(
    function()
        if noclip then
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
        end
    end
)
mouse = game.Players.LocalPlayer:GetMouse()
game.Players.LocalPlayer:GetMouse().KeyDown:connect(
    function(v)
        if v == "g" then
            if Settings.Sex then
                noclip = not noclip
                game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
            end
        end
    end
)
end)
local Toggle1 = Section2:CreateToggle("J Fly", Settings.Sex2, function(State)
Settings.Sex2 = State
local Max = 0
local Players = game.Players
local LP = Players.LocalPlayer
local Mouse = LP:GetMouse()
Mouse.KeyDown:connect(
    function(k)
        if k:lower() == "j" then
            Max = Max + 1
            getgenv().Fly = false
            if Settings.Sex2 then
                local T = LP.Character.Torso
                local S = {
                    F = 0,
                    B = 0,
                    L = 0,
                    R = 0
                }
                local S2 = {
                    F = 0,
                    B = 0,
                    L = 0,
                    R = 0
                }
                local SPEED = 5
                local function FLY()
                    getgenv().Fly = true
                    local BodyGyro = Instance.new("BodyGyro", T)
                    local BodyVelocity = Instance.new("BodyVelocity", T)
                    BodyGyro.P = 9e4
                    BodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
                    BodyGyro.cframe = T.CFrame
                    BodyVelocity.velocity = Vector3.new(0, 0.1, 0)
                    BodyVelocity.maxForce = Vector3.new(9e9, 9e9, 9e9)
                    spawn(
                        function()
                            repeat
                                wait()
                                LP.Character.Humanoid.PlatformStand = false
                                if S.L + S.R ~= 0 or S.F + S.B ~= 0 then
                                    SPEED = 200
                                elseif not (S.L + S.R ~= 0 or S.F + S.B ~= 0) and SPEED ~= 0 then
                                    SPEED = 0
                                end
                                if (S.L + S.R) ~= 0 or (S.F + S.B) ~= 0 then
                                    BodyVelocity.velocity =
                                        ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (S.F + S.B)) +
                                        ((game.Workspace.CurrentCamera.CoordinateFrame *
                                            CFrame.new(S.L + S.R, (S.F + S.B) * 0.2, 0).p) -
                                            game.Workspace.CurrentCamera.CoordinateFrame.p)) *
                                        SPEED
                                    S2 = {
                                        F = S.F,
                                        B = S.B,
                                        L = S.L,
                                        R = S.R
                                    }
                                elseif (S.L + S.R) == 0 and (S.F + S.B) == 0 and SPEED ~= 0 then
                                    BodyVelocity.velocity =
                                        ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (S2.F + S2.B)) +
                                        ((game.Workspace.CurrentCamera.CoordinateFrame *
                                            CFrame.new(S2.L + S2.R, (S2.F + S2.B) * 0.2, 0).p) -
                                            game.Workspace.CurrentCamera.CoordinateFrame.p)) *
                                        SPEED
                                else
                                    BodyVelocity.velocity = Vector3.new(0, 0.1, 0)
                                end
                                BodyGyro.cframe = game.Workspace.CurrentCamera.CoordinateFrame
                            until not getgenv().Fly
                            S = {
                                F = 0,
                                B = 0,
                                L = 0,
                                R = 0
                            }
                            S2 = {
                                F = 0,
                                B = 0,
                                L = 0,
                                R = 0
                            }
                            SPEED = 0
                            BodyGyro:destroy()
                            BodyVelocity:destroy()
                            LP.Character.Humanoid.PlatformStand = false
                        end
                    )
                end
                Mouse.KeyDown:connect(
                    function(k)
                        if k:lower() == "w" then
                            S.F = 1
                        elseif k:lower() == "s" then
                            S.B = -1
                        elseif k:lower() == "a" then
                            S.L = -1
                        elseif k:lower() == "d" then
                            S.R = 1
                        end
                    end
                )
                Mouse.KeyUp:connect(
                    function(k)
                        if k:lower() == "w" then
                            S.F = 0
                        elseif k:lower() == "s" then
                            S.B = 0
                        elseif k:lower() == "a" then
                            S.L = 0
                        elseif k:lower() == "d" then
                            S.R = 0
                        end
                    end
                )
                FLY()
                if Max == 2 then
                    getgenv().Fly = false
                    Max = 0
                end
            end
        end
    end
)
end)
local Toggle1 = Section2:CreateToggle("AutoServerHop", Settings.ServerHop, function(State)
Settings.ServerHop = State
spawn(function()
while Settings.ServerHop do wait(Settings.Seconds)
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end

-- If you'd like to use a script before server hopping (Like a Automatic Chest collector you can put the Teleport() after it collected everything.
Teleport() 
end 
end)
end)
local Button1 = Section2:CreateButton("Anti Lag", function()
for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
    if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then
        v.Material = Enum.Material.SmoothPlastic
        if v:IsA("Texture") then
            v:Destroy()
        end
    end
end
end)

local Button1 = Section2:CreateButton("Teleport to RandomPlayer", function()
local randomPlayer = game.Players:GetPlayers()[math.random(1, #game.Players:GetPlayers())]

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
    CFrame.new(
    Vector3.new(
        randomPlayer.Character.Head.Position.X,
        randomPlayer.Character.Head.Position.Y,
        randomPlayer.Character.Head.Position.Z
    )
)
end)
local Button1 = Section2:CreateButton("Lag Switch F3", function()
local ass = false
local bitch = settings()

game:service "UserInputService".InputEnded:connect(
    function(i)
        if i.KeyCode == Enum.KeyCode.F3 then
            ass = not ass
            bitch.Network.IncomingReplicationLag = ass and 10 or 0
        end
    end
)
end) 

local Button1 = Section2:CreateButton("ServerHop", function()
local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end

-- If you'd like to use a script before server hopping (Like a Automatic Chest collector you can put the Teleport() after it collected everything.
Teleport() 
end)
local Button1 = Section2:CreateButton("Rejoin", function()
game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer) end)


local Button1 = Section2:CreateButton("Save Settings", function()
Save()
end)
local Toggle3 = Section3:CreateToggle("UI Toggle", nil, function(State)
	Window:Toggle(State)
end)
Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)
	Config.Keybind = Enum.KeyCode[Key]
end)
Toggle3:SetState(true)
Section3:CreateLabel("Credits DekuDimz#7960")
Section3:CreateLabel("Credits AlexR32#3232 Ui")
Section3:CreateLabel("Credits The3Bakers")
local Colorpicker3 = Section3:CreateColorpicker("UI Color", function(Color)
	Window:ChangeColor(Color)
end)
Colorpicker3:UpdateColor(Config.Color)

-- credits to jan for patterns
local Dropdown3 = Section4:CreateDropdown("Image", {"Default","Hearts","Abstract","Hexagon","Circles","Lace With Flowers","Floral"}, function(Name)
	if Name == "Default" then
		Window:SetBackground("2151741365")
	elseif Name == "Hearts" then
		Window:SetBackground("6073763717")
	elseif Name == "Abstract" then
		Window:SetBackground("6073743871")
	elseif Name == "Hexagon" then
		Window:SetBackground("6073628839")
	elseif Name == "Circles" then
		Window:SetBackground("6071579801")
	elseif Name == "Lace With Flowers" then
		Window:SetBackground("6071575925")
	elseif Name == "Floral" then
		Window:SetBackground("5553946656")
	end
end)
Dropdown3:SetOption("Default")

local Colorpicker4 = Section4:CreateColorpicker("Color", function(Color)
	Window:SetBackgroundColor(Color)
end)
Colorpicker4:UpdateColor(Color3.new(1,1,1))

local Slider3 = Section4:CreateSlider("Transparency",0,1,nil,false, function(Value)
	Window:SetBackgroundTransparency(Value)
end)
Slider3:SetValue(0)

local Slider4 = Section4:CreateSlider("Tile Scale",0,1,nil,false, function(Value)
	Window:SetTileScale(Value)
end)
Slider4:SetValue(0.5)