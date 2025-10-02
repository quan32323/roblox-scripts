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
teleportBtn.BackgroundColor3 = Color3.fromRGB(139, 69, 19)
teleportBtn.Text = "Teleport Gần Nhất"
teleportBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
teleportBtn.TextScaled = true
teleportBtn.Parent = tab1

-- Nút Tab 2
local autoFarmBtn = Instance.new("TextButton")
autoFarmBtn.Size = UDim2.new(0, if isMobile then 260 else 310, 0, 40)
autoFarmBtn.Position = UDim2.new(0, 10, 0, 10)
autoFarmBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
autoFarmBtn.Text = "Auto Farm Level: " .. (Settings.AutoFarmLevel and "Bật" or "Tắt")
autoFarmBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
autoFarmBtn.TextScaled = true
autoFarmBtn.Parent = tab2

local autoFarmItemBtn = Instance.new("TextButton")
autoFarmItemBtn.Size = UDim2.new(0, if isMobile then 260 else 310, 0, 40)
autoFarmItemBtn.Position = UDim2.new(0, 10, 0, 60)
autoFarmItemBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
autoFarmItemBtn.Text = "Auto Farm Item: " .. (Settings.AutoFarmItem and "Bật" or "Tắt")
autoFarmItemBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
autoFarmItemBtn.TextScaled = true
autoFarmItemBtn.Parent = tab2

local antiBanBtn = Instance.new("TextButton")
antiBanBtn.Size = UDim2.new(0, if isMobile then 260 else 310, 0, 40)
antiBanBtn.Position = UDim2.new(0, 10, 0, 110)
antiBanBtn.BackgroundColor3 = Color3.fromRGB(139, 69, 19)
antiBanBtn.Text = "Anti-Ban: " .. (Settings.AntiBan and "Bật" or "Tắt")
antiBanBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
antiBanBtn.TextScaled = true
antiBanBtn.Parent = tab2

-- Chuyển tab
tab1Btn.MouseButton1Click:Connect(function()
    tab1.Visible = true
    tab2.Visible = false
    tab1Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    tab2Btn.BackgroundColor3 = Color3.fromRGB(139, 69, 19)
end)

tab2Btn.MouseButton1Click:Connect(function()
    tab1.Visible = false
    tab2.Visible = true
    tab1Btn.BackgroundColor3 = Color3.fromRGB(139, 69, 19)
    tab2Btn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
end)

-- Anti-ban đơn giản
local function checkAntiCheat()
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        local humanoid = player.Character.Humanoid
        if humanoid.WalkSpeed > 50 then return false, "Tốc độ bất thường!" end
    end
    return true, ""
end

-- Chức năng nút
espBtn.MouseButton1Click:Connect(function()
    Settings.ESP = not Settings.ESP
    espBtn.Text = "ESP NPC: " .. (Settings.ESP and "Bật" or "Tắt")
    if Settings.ESP then
        for _, v in pairs(game.Workspace:GetDescendants()) do
            if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v ~= player.Character then
                local highlight = Instance.new("Highlight")
                highlight.Parent = v
                highlight.FillColor = Color3.fromRGB(255, 0, 0)
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            end
        end
        if Settings.Translator then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Apple Hub Cat by Quân",
                Text = "ESP NPC bật! Thấy hết! 👀",
                Duration = 2
            })
        end
    else
        for _, v in pairs(game.Workspace:GetDescendants()) do
            if v:FindFirstChild("Highlight") then v.Highlight:Destroy() end
        end
        if Settings.Translator then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Apple Hub Cat by Quân",
                Text = "ESP NPC tắt! Ẩn đi bro! 🕶️",
                Duration = 2
            })
        end
    end
end)

teleportBtn.MouseButton1Click:Connect(function()
    if Settings.AntiBan then
        local isSafe, reason = checkAntiCheat()
        if not isSafe then
            if Settings.Translator then
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Apple Hub Cat by Quân",
                    Text = "Teleport lỗi: " .. reason .. " 🚨",
                    Duration = 3
                })
            end
            return
        end
    end
    if player.Character then
        local closestNPC = nil
        local closestDistance = math.huge
        for _, v in pairs(game.Workspace:GetDescendants()) do
            if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v ~= player.Character then
                local distance = (player.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
                if distance < closestDistance and distance <= 20 then
                    closestDistance = distance
                    closestNPC = v
                end
            end
        end
        if closestNPC then
            player.Character.HumanoidRootPart.CFrame = closestNPC.HumanoidRootPart.CFrame + Vector3.new(0, 0, 5)
            if Settings.Translator then
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Apple Hub Cat by Quân",
                    Text = "Teleport thành công! ⚡",
                    Duration = 2
                })
            end
        else
            if Settings.Translator then
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Apple Hub Cat by Quân",
                    Text = "Không tìm thấy NPC! 😅",
                    Duration = 2
                })
            end
        end
    end
end)

autoFarmBtn.MouseButton1Click:Connect(function()
    Settings.AutoFarmLevel = not Settings.AutoFarmLevel
    autoFarmBtn.Text = "Auto Farm Level: " .. (Settings.AutoFarmLevel and "Bật" or "Tắt")
    if Settings.AutoFarmLevel then
        if Settings.Translator then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Apple Hub Cat by Quân",
                Text = "Auto Farm Level bật! Farm thôi! 🐱",
                Duration = 2
            })
        end
        spawn(function()
            while Settings.AutoFarmLevel and player.Character do
                if Settings.AntiBan then
                    local isSafe, reason = checkAntiCheat()
                    if not isSafe then
                        Settings.AutoFarmLevel = false
                        autoFarmBtn.Text = "Auto Farm Level: Tắt"
                        if Settings.Translator then
                            game:GetService("StarterGui"):SetCore("SendNotification", {
                                Title = "Apple Hub Cat by Quân",
                                Text = "Auto Farm tắt: " .. reason .. " 🚨",
                                Duration = 3
                            })
                        end
                        break
                    end
                end
                local closestNPC = nil
                local closestDistance = math.huge
                for _, v in pairs(game.Workspace:GetDescendants()) do
                    if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v ~= player.Character then
                        local distance = (player.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
                        if distance < closestDistance and distance <= 20 then
                            closestDistance = distance
                            closestNPC = v
                        end
                    end
                end
                if closestNPC then
                    player.Character.HumanoidRootPart.CFrame = closestNPC.HumanoidRootPart.CFrame + Vector3.new(0, 0, 5)
                    game:GetService("VirtualUser"):ClickButton1(Vector2.new(0, 0))
                end
                wait(Settings.AntiBan and 1 or 0.5)
            end
        end)
    else
        if Settings.Translator then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Apple Hub Cat by Quân",
                Text = "Auto Farm Level tắt! Nghỉ đi bro! 😴",
                Duration = 2
            })
        end
    end
end)

autoFarmItemBtn.MouseButton1Click:Connect(function()
    Settings.AutoFarmItem = not Settings.AutoFarmItem
    autoFarmItemBtn.Text = "Auto Farm Item: " .. (Settings.AutoFarmItem and "Bật" or "Tắt")
    if Settings.AutoFarmItem then
        if Settings.Translator then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Apple Hub Cat by Quân",
                Text = "Auto Farm Item bật! Nhặt thôi! 🍌",
                Duration = 2
            })
        end
        spawn(function()
            while Settings.AutoFarmItem and player.Character do
                if Settings.AntiBan then
                    local isSafe, reason = checkAntiCheat()
                    if not isSafe then
                        Settings.AutoFarmItem = false
                        autoFarmItemBtn.Text = "Auto Farm Item: Tắt"
                        if Settings.Translator then
                            game:GetService("StarterGui"):SetCore("SendNotification", {
                                Title = "Apple Hub Cat by Quân",
                                Text = "Auto Farm Item tắt: " .. reason .. " 🚨",
                                Duration = 3
                            })
                        end
                        break
                    end
                end
                local closestItem = nil
                local closestDistance = math.huge
                for _, v in pairs(game.Workspace:GetDescendants()) do
                    if v:IsA("BasePart") and (v.Name:lower():match("coin") or v.Name:lower():match("gem") or v.Name:lower():match("collect")) then
                        local distance = (player.Character.HumanoidRootPart.Position - v.Position).Magnitude
                        if distance < closestDistance and distance <= 20 then
                            closestDistance = distance
                            closestItem = v
                        end
                    end
                end
                if closestItem then
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(closestItem.Position + Vector3.new(0, 3, 0))
                end
                wait(Settings.AntiBan and 1.5 or 0.7)
            end
        end)
    else
        if Settings.Translator then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Apple Hub Cat by Quân",
                Text = "Auto Farm Item tắt! Nghỉ nhặt nha! 😴",
                Duration = 2
            })
        end
    end
end)

antiBanBtn.MouseButton1Click:Connect(function()
    Settings.AntiBan = not Settings.AntiBan
    antiBanBtn.Text = "Anti-Ban: " .. (Settings.AntiBan and "Bật" or "Tắt")
    if Settings.Translator then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Apple Hub Cat by Quân",
            Text = "Anti-Ban " .. (Settings.AntiBan and "bật!" or "tắt!") .. " - An toàn bro! 🛡️",
            Duration = 2
        })
    end
end)

closeBtn.MouseButton1Click:Connect(function()
    Settings.AutoFarmLevel = false
    Settings.AutoFarmItem = false
    gui:Destroy()
    if Settings.Translator then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Apple Hub Cat by Quân",
            Text = "Menu đóng! Hẹn gặp lại! 😺",
            Duration = 2
        })
    end
end)

if getgenv().AppleHubCat then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Apple Hub Cat by Quân",
        Text = "Apple Hub Cat Cross Chuối Xịn - Chạy mobile/PC! 😺🍌",
        Duration = 3
    })
end
