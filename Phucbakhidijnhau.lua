
-- CHILI HUB VIETNAM 🇻🇳
-- Giao diện LuaU dành cho Roblox Studio

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "ChiliHubVN"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(300, 270)
main.Position = UDim2.new(0.5, -150, 0.5, -135)
main.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
main.Active = true
main.Draggable = true
main.Parent = gui

Instance.new("UICorner", main).CornerRadius =
    UDim.new(0, 12)

local header = Instance.new("TextLabel")
header.Size = UDim2.new(1, 0, 0, 45)
header.BackgroundColor3 = Color3.fromRGB(180, 45, 55)
header.Text = "🌶 CHILI HUB | VIỆT NAM"
header.TextColor3 = Color3.new(1, 1, 1)
header.Font = Enum.Font.GothamBold
header.TextSize = 16
header.Parent = main

Instance.new("UICorner", header).CornerRadius =
    UDim.new(0, 12)

local function taoNut(text, y)
    local nut = Instance.new("TextButton")
    nut.Size = UDim2.new(1, -24, 0, 38)
    nut.Position = UDim2.fromOffset(12, y)
    nut.BackgroundColor3 = Color3.fromRGB(45, 47, 60)
    nut.TextColor3 = Color3.new(1, 1, 1)
    nut.Text = text
    nut.Font = Enum.Font.Gotham
    nut.TextSize = 14
    nut.Parent = main

    Instance.new("UICorner", nut).CornerRadius =
        UDim.new(0, 8)

    return nut
end

local farm = taoNut("🥚 Tự động farm: TẮT", 58)
local afk = taoNut("💤 Chế độ treo máy: TẮT", 104)
local thuNho = taoNut("➖ Thu nhỏ giao diện", 150)
local dong = taoNut("❌ Đóng giao diện", 196)

local dangFarm = false
local dangAFK = false
local nho = false

farm.Activated:Connect(function()
    dangFarm = not dangFarm
    farm.Text = "🥚 Tự động farm: " ..
        (dangFarm and "BẬT" or "TẮT")
end)

afk.Activated:Connect(function()
    dangAFK = not dangAFK
    afk.Text = "💤 Chế độ treo máy: " ..
        (dangAFK and "BẬT" or "TẮT")
end)

thuNho.Activated:Connect(function()
    nho = not nho
    farm.Visible = not nho
    afk.Visible = not nho
    dong.Visible = not nho

    main.Size = nho
        and UDim2.fromOffset(300, 45)
        or UDim2.fromOffset(300, 270)

    thuNho.Position = nho
        and UDim2.fromOffset(210, 4)
        or UDim2.fromOffset(12, 150)

    thuNho.Size = nho
        and UDim2.fromOffset(78, 36)
        or UDim2.new(1, -24, 0, 38)

    thuNho.Text = nho and "MỞ MENU" or "➖ Thu nhỏ giao diện"
end)

dong.Activated:Connect(function()
    gui:Destroy()
end)
