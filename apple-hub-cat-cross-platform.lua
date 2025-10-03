```lua
-- Apple Hub Cat Việt Hóa by Quân - Bản Cross-Platform Chuối Xịn, phong cách Premium
if getgenv().Key ~= "applepremium" then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Apple Hub Cat",
        Text = "Key sai! Nhập 'applepremium' để kích hoạt.",
        Duration = 3
    })
    return
end

local Settings = {
    JoinTeam = "Pirates", -- Pirates/Marines
    Translator = true, -- Bật/tắt tiếng Việt
    AutoFarmLevel = false, -- Auto Farm Level cải tiến
    AutoFarmItem = false, -- Auto Farm Item
    AntiBan = true, -- Anti-Ban
    ESP = false, -- ESP NPC
    AutoQuest = false -- Tự động nhận nhiệm vụ
}

getgenv().AppleHubCat = true

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "AppleHubCatPremium"
gui.Parent = player.PlayerGui
gui.ResetOnSpawn = false

-- Menu chính (phong cách premium, tối giản)
local isMobile = game:GetService("UserInputService").TouchEnabled
local sizeX, sizeY = if isMobile then 320 else 400
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, sizeX, 0, sizeY)
frame.Position = UDim2.new(0.5, -sizeX/2, 0.5, -sizeY/2)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
local uigradient = Instance.new("UIGradient")
uigradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 25)), ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 50, 50))}
uigradient.Parent = frame
frame.BorderSizePixel = 0
frame.Parent = gui

-- Animation fade-in
local tweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tween = tweenService:Create(frame, tweenInfo, {BackgroundTransparency = 0})
tween:Play()

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, sizeX - 20, 0, 40)
title.Position = UDim2.new(0, 10, 0, 10)
title.BackgroundTransparency = 1
title.Text = "Apple Hub Cat - Premium Edition"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.Gotham
title.Parent = frame

-- Tab chính
local tabFrame = Instance.new("Frame")
tabFrame.Size = UDim2.new(0, sizeX - 20, 0, sizeY - 60)
tabFrame.Position = UDim2.new(0, 10, 0, 50)
tabFrame.BackgroundTransparency = 1
tabFrame.Parent = frame

local tab1 = Instance.new("Frame")
tab1.Size = UDim2.new(0, sizeX - 20, 0, sizeY - 60)
tab1.BackgroundTransparency = 1
tab1.Parent = tabFrame
tab1.Visible = true

local tab2 = Instance.new("Frame")
tab2.Size = UDim2.new(0, sizeX - 20, 0, sizeY - 60)
tab2.BackgroundTransparency = 1
tab2.Parent = tabFrame
tab2.Visible = false

-- Nút chuyển tab
local tab1Btn = Instance.new("TextButton")
tab1Btn.Size = UDim2.new(0, sizeX/2 - 15, 0, 30)
tab1Btn.Position = UDim2.new(0, 10, 0, 10)
tab1Btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
tab1Btn.Text = "Settings"
tab1Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
tab1Btn.TextScaled = true
tab1Btn.Parent = frame

local tab2Btn = Instance.new("TextButton")
tab2Btn.Size = UDim2.new(0, sizeX/2 - 15, 0, 30)
tab2Btn.Position = UDim2.new(0, sizeX/2 + 5, 0, 10)
tab2Btn.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
tab2Btn.Text = "Auto Farm"
tab2Btn.TextColor3 = Color3.fromRGB(200, 200, 200)
tab2Btn.TextScaled = true
tab2Btn.Parent = frame

-- Nút Đóng
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(0, sizeX - 40, 0, 10)
closeBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextScaled = true
closeBtn.Parent = frame

-- Nút Tab 1
local espBtn = Instance.new("TextButton")
espBtn.Size = UDim2.new(0, sizeX - 40, 0, 40)
espBtn.Position = UDim2.new(0, 10, 0, 10)
espBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
espBtn.Text = "ESP: " .. (Settings.ESP and "On" or "Off")
espBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
espBtn.TextScaled = true
espBtn.Parent = tab1

local teleportBtn = Instance.new("TextButton")
teleportBtn.Size = UDim2.new(0, sizeX - 40, 0, 40)
teleportBtn.Position = UDim2.new(0, 10, 0, 60)
teleportBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
teleportBtn.Text = "Teleport"
teleportBtn.TextColor3 = Color3.fromRGB(255
