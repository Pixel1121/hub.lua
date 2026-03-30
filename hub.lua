local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui

local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0,300,0,180)
frame.Position = UDim2.new(0.35,0,0.35,0)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)

local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1,0,0,40)
title.Text = "Require Loader Hub"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundColor3 = Color3.fromRGB(40,40,40)

local textbox = Instance.new("TextBox")
textbox.Parent = frame
textbox.Size = UDim2.new(1,-20,0,40)
textbox.Position = UDim2.new(0,10,0,60)
textbox.PlaceholderText = "Enter Module ID"

local load = Instance.new("TextButton")
load.Parent = frame
load.Size = UDim2.new(1,-20,0,35)
load.Position = UDim2.new(0,10,0,110)
load.Text = "Require Script"

load.MouseButton1Click:Connect(function()

    local id = tonumber(textbox.Text)

    if id then
        pcall(function()
            require(id)
        end)
    end

end)
