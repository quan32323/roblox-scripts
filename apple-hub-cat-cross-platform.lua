```lua
-- Apple Hub Cat Việt Hóa by Quân - Bản Cross-Platform Chuối Xịn, phong cách Banna Premium
if getgenv().Key ~= "applepremium" then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Apple Hub Cat",
        Text = "Key sai! Nhập 'applepremium' để kích hoạt.",
        Duration = 3
    })
    return
end

local Settings = {
    JoinTeam = "Pirates",
    Translator = true,
    AutoFarmLevel = false,
    AutoFarmItem = false,
    AutoQuest = false,
    AntiBan = true,
    ESP = false
}

getgenv().AppleHubCat = true

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "AppleHubCatPremium"
gui.Parent = player.PlayerGui
gui.ResetOnSpawn = false

-- Menu chính (phong cách Banna Premium)
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

local tweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tween = tweenService:Create(frame, tweenInfo, {BackgroundTransparency = 0})
tween:Play()

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, sizeX - 20, 0, 40)
title.Position = UDim2.new(0, 10, 0, 10)
title.BackgroundTransparency = 1
title.Text = "Apple Hub Cat - Premium"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.Gotham
title.Parent = frame

-- Tab Frame
local tabFrame = Instance.new("Frame")
tabFrame.Size = UDim2.new(0, sizeX - 20, 0, sizeY - 60)
tabFrame.Position = UDim2.new(0, 10, 0, 50)
tabFrame.BackgroundTransparency = 1
tabFrame.Parent = frame

local tabs = {
    Home = Instance.new("Frame"),
    Farm = Instance.new("Frame"),
    Teleport = Instance.new("Frame"),
    Visuals = Instance.new("Frame"),
    Settings = Instance.new("Frame")
}
for _, tab in pairs(tabs) do
    tab.Size = UDim2.new(0, sizeX - 20, 0, sizeY - 60)
    tab.BackgroundTransparency = 1
    tab.Parent = tabFrame
    tab.Visible = false
end
tabs.Home.Visible = true

-- Tab Buttons
local tabButtons = {
    {name = "Home", pos = UDim2.new(0, 10, 0, 10)},
    {name = "Farm", pos = UDim2.new(0, 60, 0, 10)},
    {name = "Teleport", pos = UDim2.new(0, 110, 0, 10)},
    {name = "Visuals", pos = UDim2.new(0, 190, 0, 10)},
    {name = "Settings", pos = UDim2.new(0, 260, 0, 10)}
}
for i, btn in pairs(tabButtons) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 50, 0, 30)
    button.Position = btn.pos
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.Text = btn.name
    button.TextColor3 = Color3.fromRGB(200, 200, 200)
    button.TextScaled = true
    button.Parent = frame
    button.MouseButton1Click:Connect(function()
        for _, tab in pairs(tabs) do tab.Visible = false end
        tabs[btn.name].Visible = true
        for j, b in pairs(tabButtons) do
            tabButtons[j].button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        end
        button.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
    end)
    btn.button = button
end
tabButtons[1].button.BackgroundColor3 = Color3.fromRGB(75, 75, 75)

-- Nút Đóng
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(0, sizeX - 40, 0, 10)
closeBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextScaled = true
closeBtn.Parent = frame

-- Home Tab
local homeLabel = Instance.new("TextLabel")
homeLabel.Size = UDim2.new(0, sizeX - 40, 0, 100)
homeLabel.Position = UDim2.new(0, 10, 0, 10)
homeLabel.BackgroundTransparency = 1
homeLabel.Text = "Apple Hub Cat - Premium\nKey: applepremium\nStatus: Activated"
homeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
homeLabel.TextWrapped = true
homeLabel.TextScaled = true
homeLabel.Font = Enum.Font.Gotham
homeLabel.Parent = tabs.Home

-- Farm Tab
local autoFarmBtn = Instance.new("TextButton")
autoFarmBtn.Size = UDim2.new(0, sizeX - 40, 0, 40)
autoFarmBtn.Position = UDim2.new(0, 10, 0, 10)
autoFarmBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
autoFarmBtn.Text = "Auto Farm Level: " .. (Settings.AutoFarmLevel and "On" or "Off")
autoFarmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
autoFarmBtn.TextScaled = true
autoFarmBtn.Parent = tabs.Farm

local autoFarmItemBtn = Instance.new("TextButton")
autoFarmItemBtn.Size = UDim2.new(0, sizeX - 40, 0, 40)
autoFarmItemBtn.Position = UDim2.new(0, 10, 0, 60)
autoFarmItemBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
autoFarmItemBtn.Text = "Auto Farm Item: " .. (Settings.AutoFarmItem and "On" or "Off")
autoFarmItemBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
autoFarmItemBtn.TextScaled = true
autoFarmItemBtn.Parent = tabs.Farm

local autoQuestBtn = Instance.new("TextButton")
autoQuestBtn.Size = UDim2.new(0, sizeX - 40, 0, 40)
autoQuestBtn.Position = UDim2.new(0, 10, 0, 110)
autoQuestBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
autoQuestBtn.Text = "Auto Quest: " .. (Settings.AutoQuest and "On" or "Off")
autoQuestBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
autoQuestBtn.TextScaled = true
autoQuestBtn.Parent = tabs.Farm

-- Teleport Tab
local teleportBtn = Instance.new("TextButton")
teleportBtn.Size = UDim2.new(0, sizeX - 40, 0, 40)
teleportBtn.Position = UDim2.new(0, 10, 0, 10)
teleportBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
teleportBtn.Text = "Teleport to Quest/Fruit"
teleportBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
teleportBtn.TextScaled = true
teleportBtn.Parent = tabs.Teleport

-- Visuals Tab
local espBtn = Instance.new("TextButton")
espBtn.Size = UDim2.new(0, sizeX - 40, 0, 40)
espBtn.Position = UDim2.new(0, 10, 0, 10)
espBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
espBtn.Text = "ESP: " .. (Settings.ESP and "On" or "Off")
espBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
espBtn.TextScaled = true
espBtn.Parent = tabs.Visuals

-- Settings Tab
local antiBanBtn = Instance.new("TextButton")
antiBanBtn.Size = UDim2.new(0, sizeX - 40, 0, 40)
antiBanBtn.Position = UDim2.new(0, 10, 0, 10)
antiBanBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
antiBanBtn.Text = "Anti-Ban: " .. (Settings.AntiBan and "On" or "Off")
antiBanBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
antiBanBtn.TextScaled = true
antiBanBtn.Parent = tabs.Settings

local translatorBtn = Instance.new("TextButton")
translatorBtn.Size = UDim2.new(0, sizeX - 40, 0, 40)
translatorBtn.Position = UDim2.new(0, 10, 0, 60)
translatorBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
translatorBtn.Text = "Translator: " .. (Settings.Translator and "On" or "Off")
translatorBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
translatorBtn.TextScaled = true
translatorBtn.Parent = tabs.Settings

-- Anti-ban
local function checkAntiCheat()
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        local humanoid = player.Character.Humanoid
        if humanoid.WalkSpeed > 50 then return false, "Speed issue!" end
    end
    return true, ""
end

-- Hàm lấy cấp độ
local function getPlayerLevel()
    local leaderstats = player:FindFirstChild("leaderstats")
    if leaderstats and leaderstats:FindFirstChild("Level") then
        return tonumber(leaderstats.Level.Value) or 1
    end
    return 1
end

-- Hàm tìm NPC theo cấp
local function getQuestNPC(level)
    local npcData = {
        {min = 1, max = 10, npc = "Bandit", pos = Vector3.new(-1100, 15, 1500)},
        {min = 11, max = 30, npc = "Pirate", pos = Vector3.new(-600, 15, 2000)},
        {min = 31, max = 70, npc = "Marine", pos = Vector3.new(1000, 15, 1500)},
        {min = 71, max = 150, npc = "Boss1", pos = Vector3.new(2000, 15, 1000)}
    }
    for _, data in pairs(npcData) do
        if level >= data.min and level <= data.max then
            return data.npc, data.pos
        end
    end
    return "Boss1", Vector3.new(2000, 15, 1000)
end

-- Hàm tìm trái ác quỷ
local function findDevilFruit()
    for _, v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("BasePart") and v.Name:lower():match("devilfruit") then
            return v
        end
    end
    return nil
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
    local fruit = findDevilFruit()
    if fruit and player.Character then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(fruit.Position + Vector3.new(0, 5, 0))
        if Settings.Translator then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Apple Hub Cat",
                Text = "Teleported to Devil Fruit!",
                Duration = 2
            })
        end
    else
        local _, pos = getQuestNPC(getPlayerLevel())
        if player.Character then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(pos + Vector3.new(0, 5, 0))
            if Settings.Translator then
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Apple Hub Cat",
                    Text = "Teleported to Quest NPC.",
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
                local level = getPlayerLevel()
                local _, npcPos = getQuestNPC(level)
                player.Character.HumanoidRootPart.CFrame = CFrame.new(npcPos + Vector3.new(0, 5, 0))
                game:GetService("VirtualUser"):ClickButton1(Vector2.new(0, 0))
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
                if closestItem and player.Character then
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

autoQuestBtn.MouseButton1Click:Connect(function()
    Settings.AutoQuest = not Settings.AutoQuest
    autoQuestBtn.Text = "Auto Quest: " .. (Settings.AutoQuest and "On" or "Off")
    if Settings.AutoQuest then
        if Settings.Translator then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Apple Hub Cat",
                Text = "Auto Quest activated.",
                Duration = 2
            })
        end
        spawn(function()
            while Settings.AutoQuest and player.Character do
                if Settings.AntiBan then
                    local isSafe, reason = checkAntiCheat()
                    if not isSafe then
                        Settings.AutoQuest = false
                        autoQuestBtn.Text = "Auto Quest: Off"
                        if Settings.Translator then
                            game:GetService("StarterGui"):SetCore("SendNotification", {
                                Title = "Apple Hub Cat",
                                Text = "Auto Quest stopped: " .. reason,
                                Duration = 3
                            })
                        end
                        break
                    end
                end
                local level = getPlayerLevel()
                local _, npcPos = getQuestNPC(level)
                if player.Character then
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(npcPos + Vector3.new(0, 5, 0))
                    wait(1) -- Chờ nhận nhiệm vụ
                end
                wait(Settings.AntiBan and 1 or 0.5)
            end
        end)
    else
        if Settings.Translator then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Apple Hub Cat",
                Text = "Auto Quest deactivated.",
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

translatorBtn.MouseButton1Click:Connect(function()
    Settings.Translator = not Settings.Translator
    translatorBtn.Text = "Translator: " .. (Settings.Translator and "On" or "Off")
    if Settings.Translator then
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Apple Hub Cat",
            Text = "Translator enabled.",
            Duration = 2
        })
    else
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Apple Hub Cat",
            Text = "Translator disabled.",
            Duration = 2
        })
    end
end)

closeBtn.MouseButton1Click:Connect(function()
    Settings.AutoFarmLevel = false
    Settings.AutoFarmItem = false
    Settings.AutoQuest = false
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

-- Hiệu ứng mở menu và định vị trái ác quỷ
if getgenv().AppleHubCat then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Apple Hub Cat",
        Text = "Premium Edition activated with key 'applepremium'.",
        Duration = 3
    })
end

spawn(function()
    while wait(5) do
        local fruit = findDevilFruit()
        if fruit and player.Character then
            if Settings.Translator then
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "Apple Hub Cat",
                    Text = "Devil Fruit detected! Teleporting...",
                    Duration = 3
                })
            end
            player.Character.HumanoidRootPart.CFrame = CFrame.new(fruit.Position + Vector3.new(0, 5, 0))
            wait(1)
        end
    end
end)

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
for _, btn in pairs(tabButtons) do addHoverEffect(btn.button) end
addHoverEffect(espBtn)
addHoverEffect(teleportBtn)
addHoverEffect(autoFarmBtn)
addHoverEffect(autoFarmItemBtn)
addHoverEffect(autoQuestBtn)
addHoverEffect(antiBanBtn)
addHoverEffect(translatorBtn)
```
