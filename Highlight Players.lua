-- Toggle Key: H

local Players = game:GetService("Players")
local HighlightColor = Color3.fromRGB(255, 0, 0) -- Red color for highlight
local HighlightTransparency = 0.5 -- Transparency of the highlight

local function togglePlayerHighlighting()
    local players = Players:GetPlayers()
    
    for _, player in ipairs(players) do
        local character = player.Character
        if character then
            local highlight = character:FindFirstChild("PlayerHighlight")
            if not highlight then
                -- Create highlight if it doesn't exist
                highlight = Instance.new("Highlight")
                highlight.Name = "PlayerHighlight"
                highlight.Parent = character
                highlight.FillColor = HighlightColor
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.FillTransparency = HighlightTransparency
                highlight.OutlineTransparency = 0
            else
                highlight:Destroy()
            end
        end
    end
end

game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.H then
        togglePlayerHighlighting()
    end
end)
