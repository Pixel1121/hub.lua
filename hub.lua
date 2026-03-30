-- Simple Roblox Script Hub
-- Upload this file to GitHub as hub.lua

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "PixelHub"
gui.Parent = game.CoreGui

local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0,320,0,300)
frame.Position = UDim2.new(0.35,0,0.3,0)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1,0,0,40)
title.BackgroundColor3 = Color3.fromRGB(40,40,40)
title.Text = "Pixel Script Hub"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.TextSize = 22
title.Font = Enum.Font.SourceSansBold

local layout = Instance.new("UIListLayout")
layout.Parent = frame
layout.Padding = UDim.new(0,6)
layout.SortOrder = Enum.SortOrder.LayoutOrder

local function Button(name,callback)

    local btn = Instance.new("TextButton")
    btn.Parent = frame
    btn.Size = UDim2.new(1,-10,0,35)
    btn.BackgroundColor3 = Color3.fromRGB(50,50,50)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 18
    btn.Text = name

    btn.MouseButton1Click:Connect(function()
        pcall(callback)
    end)

end

-- Example script loader
Button("Load Test Script", function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/YOURNAME/YOURREPO/main/test.lua"))()

end)

-- Example module loader
Button("Load Require Script", function()

require(1234567890)

end)

-- Another example button
Button("Print Hello", function()

print("Hub is working!")

end)

-- Close button
Button("Close Hub", function()

gui:Destroy()

end)
