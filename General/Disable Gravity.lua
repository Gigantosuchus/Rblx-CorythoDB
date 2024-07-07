-- Script to Toggle Gravity for the Local Player

-- Get the local player
local player = game.Players.LocalPlayer

-- Variable to track gravity state
local gravityEnabled = false

-- Function to disable gravity for the player's character
local function disableGravity()
    -- Check if the player has a character
    if player.Character then
        -- Disable gravity for the Humanoid
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
            humanoid.PlatformStand = true
        end
    end
end

-- Function to enable gravity for the player's character
local function enableGravity()
    -- Check if the player has a character
    if player.Character then
        -- Enable gravity for the Humanoid
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
            humanoid.PlatformStand = false
        end
    end
end

-- Function to toggle gravity state
local function toggleGravity()
    gravityEnabled = not gravityEnabled
    if gravityEnabled then
        enableGravity()
        print("Gravity Enabled")
    else
        disableGravity()
        print("Gravity Disabled")
    end
end

-- Bind toggleGravity function to the "G" key press
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.G then
        toggleGravity()
    end
end)

-- Initial call to disable gravity (optional, depends on desired default behavior)
disableGravity()

-- Listen for the character being added (respawn or initial spawn)
player.CharacterAdded:Connect(function(character)
    if gravityEnabled then
        enableGravity()
    else
        disableGravity()
    end
end)
