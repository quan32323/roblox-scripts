```lua
-- Apple Hub Cat Việt Hóa by Quân - Bản Cross-Platform Chuối Xịn, phong cách Premium
if getgenv().Key ~= "CAT" then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Apple Hub Cat",
        Text = "Key sai! Nhập 'CAT' để kích hoạt.",
        Duration = 3
    })
    return
end

local Settings = {
    JoinTeam = "Pirates", -- Pirates/Marines
    Translator = true, -- Bật/tắt tiếng Việt
    AutoFarmLevel = false, -- Auto Farm Level
    AutoFarmItem = false, -- Auto Farm Item
    AntiBan = true, -- Anti-Ban
    ESP = false -- ESP NPC
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
teleportBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
teleportBtn.TextScaled = true
teleportBtn.Parent = tab1

-- Nút Tab 2
local autoFarmBtn = Instance.new("TextButton")
autoFarmBtn.Size = UDim2.new(0, sizeX - 40, 0, 40)
autoFarmBtn.Position = UDim2.new(0, 10, 0, 10)
autoFarmBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
autoFarmBtn.Text = "Auto Farm Level: " .. (Settings.AutoFarmLevel and "On" or "Off")
autoFarmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
autoFarmBtn.TextScaled = true
autoFarmBtn.Parent = tab2

local autoFarmItemBtn = Instance.new("TextButton")
autoFarmItemBtn.Size = UDim2.new(0, sizeX - 40, 0, 40)
autoFarmItemBtn.Position = UDim2.new(0, 10, 0, 60)
autoFarmItemBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
autoFarmItemBtn.Text = "Auto Farm Item: " .. (Settings.AutoFarmItem and "On" or "Off")
autoFarmItemBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
autoFarmItemBtn.TextScaled = true
autoFarmItemBtn.Parent = tab2

local antiBanBtn = Instance.new("TextButton")
antiBanBtn.Size = UDim2.new(0, sizeX - 40, 0, 40)
antiBanBtn.Position = UDim2.new(0, 10, 0, 110)
antiBanBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
antiBanBtn.Text = "Anti-Ban: " .. (Settings.AntiBan and "On" or "Off")
antiBanBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
antiBanBtn.TextScaled = true
antiBanBtn.Parent = tab2

-- Chuyển tab
tab1Btn.MouseButton1Click:Connect(function()
    tab1.Visible = true
    tab2.Visible = false
    tab1Btn.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
    tab2Btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
end)

tab2Btn.MouseButton1Click:Connect(function()
    tab1.Visible = false
    tab2.Visible = true
    tab1Btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    tab2Btn.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
end)

-- Anti-ban
local function checkAntiCheat()
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        local humanoid = player.Character.Humanoid
        if humanoid.WalkSpeed > 50 then return false, "Speed issue!" end
    end
    return true, ""
end

-- Chức năng nút
espBtn.MouseButton1Click:Connect(function()
    Settings.ESP = not Settings.ESP
    espBtn.Text = "ESP: " .. (Settings.ESP and "On" or "Off")
    if Settings.ESP then
        for _, v in pairs(game.Workspace:GetDescendants()) do
            if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v ~= player.Character then
                local highlight = Instance.new("Highlight")
                highlight.Parent = v
                highlight.FillColor = Color3.fromRGB(0, 255, 0)
                highlight.OutlineColor = Color3.fromRGB(0, 200, 0)
            end
        end
        if Settings.Translator then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Apple Hub Cat",
                Text = "ESP activated.",
                Duration = 2
            })
        end
    else
        for _, v in pairs(game.Workspace:GetDescendants()) do
            if v:FindFirstChild("Highlight") then v.Highlight:Destroy() end
        end
        if Settings.Translator then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Apple Hub Cat",
                Text = "ESP deactivated.",
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
                    Title = "Apple Hub Cat",
                    Text = "Teleport failed: " .. reason,
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
                    Title = "Apple Hub Cat",
                    Text = "Teleport successful.",
                    Duration = 2
                })
            end
        else
            if Settings.Translator then
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Apple Hub Cat",
                    Text = "No NPC found.",
                    Duration = 2
                })
            end
        end
    end
end)

autoFarmBtn.MouseButton1Click:Connect(function()
    Settings.AutoFarmLevel = not Settings.AutoFarmLevel
    autoFarmBtn.Text = "Auto Farm Level: " .. (Settings.AutoFarmLevel and "On" or "Off")
    if Settings.AutoFarmLevel then
        if Settings.Translator then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Apple Hub Cat",
                Text = "Auto Farm Level activated.",
                Duration = 2
            })
        end
        spawn(function()
            while Settings.AutoFarmLevel and player.Character do
                if Settings.AntiBan then
                    local isSafe, reason = checkAntiCheat()
                    if not isSafe then
                        Settings.AutoFarmLevel = false
                        autoFarmBtn.Text = "Auto Farm Level: Off"
                        if Settings.Translator then
                            game:GetService("StarterGui"):SetCore("SendNotification", {
                                Title = "Apple Hub Cat",
                                Text = "Auto Farm stopped: " .. reason,
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
                Title = "Apple Hub Cat",
                Text = "Auto Farm Level deactivated.",
                Duration = 2
            })
        end
    end
end)

autoFarmItemBtn.MouseButton1Click:Connect(function()
    Settings.AutoFarmItem = not Settings.AutoFarmItem
    autoFarmItemBtn.Text = "Auto Farm Item: " .. (Settings.AutoFarmItem and "On" or "Off")
    if Settings.AutoFarmItem then
        if Settings.Translator then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Apple Hub Cat",
                Text = "Auto Farm Item activated.",
                Duration = 2
            })
        end
        spawn(function()
            while Settings.AutoFarmItem and player.Character do
                if Settings.AntiBan then
                    local isSafe, reason = checkAntiCheat()
                    if not isSafe then
                        Settings.AutoFarmItem = false
                        autoFarmItemBtn.Text = "Auto Farm Item: Off"
                        if Settings.Translator then
                            game:GetService("StarterGui"):SetCore("SendNotification", {
                                Title = "Apple Hub Cat",
                                Text = "Auto Farm stopped: " .. reason,
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
                Title = "Apple Hub Cat",
                Text = "Auto Farm Item deactivated.",
                Duration = 2
            })
        end
    end
end)

antiBanBtn.MouseButton1Click:Connect(function()
    Settings.AntiBan = not Settings.AntiBan
    antiBanBtn.Text = "Anti-Ban: " .. (Settings.AntiBan and "On" or "Off")
    if Settings.Translator then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Apple Hub Cat",
            Text = "Anti-Ban " .. (Settings.AntiBan and "enabled" or "disabled") .. ".",
            Duration = 2
        })
    end
end)

closeBtn.MouseButton1Click:Connect(function()
    Settings.AutoFarmLevel = false
    Settings.AutoFarmItem = false
    tween = tweenService:Create(frame, tweenInfo, {BackgroundTransparency = 1})
    tween:Play()
    wait(0.5)
    gui:Destroy()
    if Settings.Translator then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Apple Hub Cat",
            Text = "Menu closed.",
            Duration = 2
        })
    end
end)

-- Hiệu ứng mở menu premium
if getgenv().AppleHubCat then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Apple Hub Cat",
        Text = "Premium Edition activated.",
        Duration = 3
    })
end

-- Hover effect cho nút
local function addHoverEffect(button)
    button.MouseEnter:Connect(function()
        local tween = tweenService:Create(button, TweenInfo.new(0.2), {Size = UDim2.new(0, button.Size.X.Offset + 10, 0, button.Size.Y.Offset)})
        tween:Play()
    end)
    button.MouseLeave:Connect(function()
        local tween = tweenService:Create(button, TweenInfo.new(0.2), {Size = UDim2.new(0, button.Size.X.Offset - 10, 0, button.Size.Y.Offset)})
        tween:Play()
    end)
end
addHoverEffect(tab1Btn)
addHoverEffect(tab2Btn)
addHoverEffect(espBtn)
addHoverEffect(teleportBtn)
addHoverEffect(autoFarmBtn)
addHoverEffect(autoFarmItemBtn)
addHoverEffect(antiBanBtn)
```
