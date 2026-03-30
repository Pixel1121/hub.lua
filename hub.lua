-- Pixel Smart Hub

local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui
gui.Name = "PixelSmartHub"

local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0,380,0,220)
frame.Position = UDim2.new(0.35,0,0.35,0)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1,0,0,40)
title.BackgroundColor3 = Color3.fromRGB(40,40,40)
title.Text = "Pixel Smart Script Hub"
title.TextColor3 = Color3.new(1,1,1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 22

local textbox = Instance.new("TextBox")
textbox.Parent = frame
textbox.Size = UDim2.new(1,-20,0,50)
textbox.Position = UDim2.new(0,10,0,60)
textbox.BackgroundColor3 = Color3.fromRGB(50,50,50)
textbox.TextColor3 = Color3.new(1,1,1)
textbox.PlaceholderText = "Paste script, require(ID), hex require, or URL..."
textbox.Text = ""
textbox.TextSize = 18
textbox.Font = Enum.Font.SourceSans

local execute = Instance.new("TextButton")
execute.Parent = frame
execute.Size = UDim2.new(1,-20,0,40)
execute.Position = UDim2.new(0,10,0,120)
execute.BackgroundColor3 = Color3.fromRGB(70,70,70)
execute.Text = "Execute"
execute.TextColor3 = Color3.new(1,1,1)
execute.Font = Enum.Font.SourceSansBold
execute.TextSize = 20

local close = Instance.new("TextButton")
close.Parent = frame
close.Size = UDim2.new(1,-20,0,30)
close.Position = UDim2.new(0,10,0,170)
close.BackgroundColor3 = Color3.fromRGB(120,40,40)
close.Text = "Close"
close.TextColor3 = Color3.new(1,1,1)

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

execute.MouseButton1Click:Connect(function()

    local input = textbox.Text

    if input == "" then
        return
    end

    pcall(function()

        -- detect require(decimal)
        local id = input:match("require%((%d+)%)")

        if id then
            require(tonumber(id))
            return
        end

        -- detect require(hex)
        local hex = input:match("require%((0x[%x]+)%)")

        if hex then
            require(tonumber(hex))
            return
        end

        -- detect URL
        if input:find("http") then
            loadstring(game:HttpGet(input))()
            return
        end

        -- fallback run raw code
        loadstring(input)()

    end)

end)
