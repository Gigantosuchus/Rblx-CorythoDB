-- Toggle Key: N
local player = game.Players.LocalPlayer
local noclip = false
local mouse = player:GetMouse()

mouse.KeyDown:Connect(function(key)
    if key == "n" then
        noclip = not noclip
        player.Character.Humanoid:ChangeState(11)
    end
end)

game:GetService("RunService").Stepped:Connect(function()
    if noclip then
        player.Character.Humanoid:ChangeState(11)
    end
end)
