local function createHighlight(player, color)
    if player.Character then
        local character = player.Character
        local highlight = Instance.new("Highlight")
        highlight.Parent = character
        highlight.FillColor = color
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        highlight.FillTransparency = 0.5
        highlight.OutlineTransparency = 0
    end
end

local function highlightPlayers()
    local players = game:GetService("Players")
    for _, player in ipairs(players:GetPlayers()) do
        local color = Color3.fromRGB(0, 255, 0) -- Green for innocent
        if player.Backpack:FindFirstChild("Knife") then
            color = Color3.fromRGB(255, 0, 0) -- Red for murderer
        elseif player.Backpack:FindFirstChild("Gun") then
            color = Color3.fromRGB(0, 0, 255) -- Blue for sheriff
        end
        createHighlight(player, color)
    end
end

highlightPlayers()

game:GetService("Players").PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        highlightPlayers()
    end)
end)
