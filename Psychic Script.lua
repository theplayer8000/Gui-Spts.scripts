function reload()


end


local Target = ""
local test = false

local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

local X = Material.Load({
    Title = "Psychic_Script:\n(made by 1xToxsins#8515)",
    Style = 6,
    SizeX = 280,
    SizeY = 140,
    Theme = "Dark"
})

local Main = X.New({
    Title = "Main"
})

local playerr = Main.TextField({
    Text = "Player",
    Callback = function(Value)
         Target = Value
        print(Target)
    end
})

local B = Main.Toggle({
    Text = "Pyschic spam",
    Callback = function(Value)
        test = Value
    end,
    Enabled = false
})


while wait() do

    if test then
    
        for i,v in pairs(game.Players:GetPlayers()) do
        game.ReplicatedStorage.RemoteEvent:FireServer({"Skill_SoulAttack_Start",game.Players[Target]})
        game.ReplicatedStorage.RemoteEvent:FireServer({"Skill_SoulAttack_End"})
        end
        print("test")
        wait()
    end
end