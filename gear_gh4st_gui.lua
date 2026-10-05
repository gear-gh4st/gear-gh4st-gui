-- Simple Mobile + PC Hub (работает на Delta)

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SimpleHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Name = "Main"
Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.05, 0, 0.15, 0)
Frame.Size = UDim2.new(0, 340, 0, 310)
Frame.Active = true
Frame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = Frame

-- Заголовок
local Title = Instance.new("TextLabel")
Title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Title.Size = UDim2.new(1, 0, 0, 38)
Title.Font = Enum.Font.GothamBold
Title.Text = "by @gear_gh4st"
Title.TextColor3 = Color3.fromRGB(220, 220, 220)
Title.TextSize = 16
Title.Parent = Frame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = Title

-- Кнопка закрытия
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 38, 0, 38)
CloseBtn.Position = UDim2.new(1, -38, 0, 0)
CloseBtn.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 18
CloseBtn.Parent = Frame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 10)
CloseCorner.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Функция создания кнопок
local function createButton(text, pos, size, callback)
    local btn = Instance.new("TextButton")
    btn.Size = size
    btn.Position = pos
    btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    btn.BorderSizePixel = 0
    btn.Font = Enum.Font.Gotham
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 15
    btn.TextWrapped = true
    btn.Parent = Frame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- Кнопки
createButton("ScriptHub New UI", UDim2.new(0.04, 0, 0.16, 0), UDim2.new(0, 150, 0, 48), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/ScriptHubNA.lua"))()
end)

createButton("ScriptHub Old UI", UDim2.new(0.52, 0, 0.16, 0), UDim2.new(0, 150, 0, 48), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/FE/main/ScriptHub"))()
end)

createButton("Comet", UDim2.new(0.04, 0, 0.35, 0), UDim2.new(0, 150, 0, 48), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/comet"))()
end)

createButton("Infinite Yield", UDim2.new(0.52, 0, 0.35, 0), UDim2.new(0, 150, 0, 48), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

createButton("Fates Admin", UDim2.new(0.04, 0, 0.54, 0), UDim2.new(0, 150, 0, 48), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))()
end)

createButton("Dex++", UDim2.new(0.52, 0, 0.54, 0), UDim2.new(0, 150, 0, 48), function()
    loadstring(game:HttpGet("https://github.com/AZYsGithub/DexPlusPlus/releases/download/stable-3.0/out.lua"))()
end)

createButton("CMD Admin", UDim2.new(0.04, 0, 0.73, 0), UDim2.new(0, 310, 0, 48), function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/lxte/cmd/main/main.lua"))()
end)

-- Перетаскивание (работает и на ПК, и на телефоне)
local dragging = false
local dragStart = nil
local startPos = nil

Frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        if dragging then
            local delta = input.Position - dragStart
            Frame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end
end)

print("Simple Hub загружен (Mobile + PC)")
