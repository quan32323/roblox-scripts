-- Apple Hub Cat Việt Hóa by Quân - Bản Cross-Platform Chuối Xịn, chạy mobile/PC, mọi executor
if getgenv().Key ~= "CAT" then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Apple Hub Cat by Quân",
        Text = "Key sai! Thử 'CAT' đi bro, miễn phí mà! 😅",
        Duration = 3
    })
    return
end

local Settings = {
    JoinTeam = "Pirates", -- Pirates/Marines
    Translator = true, -- Bật/tắt tiếng Việt
    AutoFarmLevel = false, -- Auto Farm Level nhẹ
    AutoFarmItem = false, -- Auto Farm Item cơ bản
    AntiBan = true, -- Anti-Ban đơn giản
    ESP = false -- ESP NPC cơ bản
}

getgenv().AppleHubCat = true

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "AppleHubCatViet"
gui.Parent = player.PlayerGui
gui.ResetOnSpawn = false

-- Menu chính (tự điều chỉnh cho mobile/PC)
local isMobile = game:GetService("UserInputService").TouchEnabled
local frameSizeX, frameSizeY = if isMobile then 300 else 350
local framePosX, framePosY = if isMobile then -150 else -175
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, frameSizeX, 0, if isMobile then 400 else 450)
frame.Position = UDim2.new(0.5, framePosX, 0.5, if isMobile then -200 else -225)
frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
frame.BackgroundTransparency = 0
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, if isMobile then 280 else 330, 0, 40)
title.Position = UDim2.new(0, 10, 0, 10)
title.BackgroundTransparency = 1
title.Text = "Apple Hub Cat by Quân - Cross Chuối Xịn"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = frame

-- Tab chính
local tabFrame = Instance.new("Frame")
tabFrame.Size = UDim2.new(0, if isMobile then 280 else 330, 0, if isMobile then 310 else 360)
tabFrame.Position = UDim2.new(0, 10, 0, 60)
tabFrame.BackgroundTransparency = 1
tabFrame.Parent = frame

-- Tab 1: Tùy Chỉnh
local tab1 = Instance.new("Frame")
tab1.Size = UDim2.new(0, if isMobile then 280 else 330, 0, if isMobile then 310 else 360)
tab1.BackgroundTransparency = 1
tab1.Parent = tabFrame
tab1.Visible = true

-- Tab 2: Auto Farm
local tab2 = Instance.new("Frame")
tab2.Size = UDim2.new(0, if isMobile then 280 else 330, 0, if isMobile then 310 else 360)
tab2.BackgroundTransparency = 1
tab2.Parent = tabFrame
tab2.Visible = false

-- Nút chuyển tab
local tab1Btn = Instance.new("TextButton")
tab1Btn.Size = UDim2.new(0, if isMobile then 135 else 160, 0, if isMobile then 30 else 35)
tab1Btn.Position = UDim2.new(0, 10, 0, if isMobile then 20 else 25)
tab1Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
tab1Btn.Text = "Tùy Chỉnh"
tab1Btn.TextColor3 = Color3.fromRGB(0, 0, 0)
tab1Btn.TextScaled = true
tab1Btn.Parent = frame

local tab2Btn = Instance.new("TextButton")
tab2Btn.Size = UDim2.new(0, if isMobile then 135 else 160, 0, if isMobile then 30 else 35)
tab2Btn.Position = UDim2.new(0, if isMobile then 145 else 160, 0, if isMobile then 20 else 25)
tab2Btn.BackgroundColor3 = Color3.fromRGB(139, 69, 19)
tab2Btn.Text = "Auto Farm"
tab2Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
tab2Btn.TextScaled = true
tab2Btn.Parent = frame

-- Nút Đóng
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, if isMobile then 30 else 35, 0, if isMobile then 30 else 35)
closeBtn.Position = UDim2.new(0, if isMobile then 260 else 315, 0, 10)
closeBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextScaled = true
closeBtn.Parent = frame

-- Nút Tab 1
local espBtn = Instance.new("TextButton")
espBtn.Size = UDim2.new(0, if isMobile then 260 else 310, 0, 40)
espBtn.Position = UDim2.new(0, 10, 0, 10)
espBtn.BackgroundColor3 = Color3.fromRGB(139, 69, 19)
espBtn.Text = "ESP NPC: " .. (Settings.ESP and "Bật" or "Tắt")
espBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
espBtn.TextScaled = true
espBtn.Parent = tab1

local teleportBtn = Instance.new("TextButton")
teleportBtn.Size = UDim2.new(0, if isMobile then 260 else 310, 0, 40)
teleportBtn.Position = UDim2.new(0, 10, 0, 60)
teleport
