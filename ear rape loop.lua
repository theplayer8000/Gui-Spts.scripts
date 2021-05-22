while wait(0.2) do
for _,plr in pairs(game.Players:GetPlayers()) do
pcall(function()
for _,obj in pairs(plr.Character.Head:GetChildren()) do
if obj:IsA("Sound") then
obj:Play()
end
end
end)
end
end