---- Pixel Hub With Textbox Loader

local gui = Instance.new("ScreenGui")
gui.Name = "PixelHub"
gui.Parent = game.CoreGui

local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0,350,0,240)
frame.Position = UDim2.new(0.35,0,0.35,0)
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

-- TEXTBOX
local textbox = Instance.new("TextBox")
textbox.Parent = frame
textbox.Size = UDim2.new(1,-20,0,40)
textbox.Position = UDim2.new(0,10,0,60)
textbox.BackgroundColor3 = Color3.fromRGB(50,50,50)
textbox.TextColor3 = Color3.fromRGB(255,255,255)
textbox.PlaceholderText = "Paste Script URL Here"
textbox.Text = ""
textbox.Font = Enum.Font.SourceSans
textbox.TextSize = 18

-- EXECUTE BUTTON
local execute = Instance.new("TextButton")
execute.Parent = frame
execute.Size = UDim2.new(1,-20,0,35)
execute.Position = UDim2.new(0,10,0,110)
execute.BackgroundColor3 = Color3.fromRGB(70,70,70)
execute.Text = "Execute Script"
execute.TextColor3 = Color3.fromRGB(255,255,255)
execute.Font = Enum.Font.SourceSansBold
execute.TextSize = 18

execute.MouseButton1Click:Connect(function()

    local url = textbox.Text

    if url ~= "" then
        pcall(function()
            loadstring(game:HttpGet(url))()
        end)
    end

end)

-- CLOSE BUTTON
local close = Instance.new("TextButton")
close.Parent = frame
close.Size = UDim2.new(1,-20,0,30)
close.Position = UDim2.new(0,10,0,160)
close.BackgroundColor3 = Color3.fromRGB(120,40,40)
close.Text = "Close Hub"
close.TextColor3 = Color3.fromRGB(255,255,255)

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)
