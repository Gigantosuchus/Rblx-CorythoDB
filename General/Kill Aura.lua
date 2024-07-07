-- This script does not have a specific button to be pressed.

-- Function to handle when the ability is activated
local function activateAbility()
    -- Put your kill aura logic here
    -- Example: Loop through nearby enemies and "kill" them
    local character = script.Parent.Parent  -- Assuming this script is a child of the ability object
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local radius = 10  -- Adjust this radius as needed

    -- Get all characters in the radius
    local parts = workspace:FindPartsInRegion3(workspace:Region3.new(humanoidRootPart.Position - Vector3.new(radius, radius, radius), humanoidRootPart.Position + Vector3.new(radius, radius, radius)), nil, math.huge)
    for _, part in ipairs(parts) do
        local humanoid = part.Parent:FindFirstChildOfClass("Humanoid")
        if humanoid and humanoid.Health > 0 then
            humanoid:TakeDamage(100)  -- Example: Deal damage to nearby humanoids
        end
    end
end

-- Connect the ability activation to a button press event
local abilityButton = script.Parent  -- Replace with the actual button object
abilityButton.MouseButton1Click:Connect(activateAbility)
