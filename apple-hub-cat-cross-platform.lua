```lua
-- Apple Hub Cat Việt Hóa by Quân - Bản Cross-Platform Chuối Xịn, key từ Linkvertise/LootLabs
local Settings = {
    AutoFarmLevel = false,
    AutoQuest = false,
    AutoStackFarm = false,
    AutoSeaEvent = false,
    ESP = false,
    FruitESP = false,
    AutoAcceptQuest = false,
    AntiBan = true,
    Translator = true
}

getgenv().AppleHubCat = true

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "AppleHubCatPremium"
gui.Parent = player.PlayerGui
gui.ResetOnSpawn = false

-- Kiểm tra key từ Linkvertise
local function getKeyFromLinkvertise()
    local success, response = pcall(function()
        return game:HttpGet("https://publisher.linkvertise.com/api/v1/redirect/link/YOUR_LINK_ID/check?serial=123456") -- Thay YOUR_LINK_ID bằng ID link của bạn
    end)
    if success then
        -- Parse response để lấy key (giả lập, cần điều chỉnh theo API Linkvertise)
        local key = response:match("key=(%w+)") or "applepremium123" -- Ví dụ key trong response
        return key
    end
    return nil
end

local fetchedKey = getKeyFromLinkvertise()
if not fetchedKey or fetchedKey ~= "applepremium123" then -- Thay "applepremium123" bằng key bạn định nghĩa
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Apple Hub Cat",
        Text = "Key từ Linkvertise không hợp lệ! Hoàn thành task để lấy key.",
        Duration = 5
    })
    return
end

-- Menu chính với UI đẹp
local isMobile = game:GetService("UserInputService").TouchEnabled
local sizeX, sizeY = if isMobile then 320 else 400
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, sizeX, 0, sizeY)
frame.Position = UDim2.new(0.5, -sizeX/2, 0.5, -sizeY/2)
frame.BackgroundColor3 = Color3.fromRGB(20, 30, 50)
local uigradient = Instance.new("UIGradient")
uigradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 30, 50)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(30, 50, 80)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 30, 50))
}
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
title.TextColor3 = Color3.fromRGB(0, 191, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = frame

-- Tab Frame
local tabFrame = Instance.new("Frame")
tabFrame.Size = UDim2.new(0, sizeX - 20, 0, sizeY - 60)
tabFrame.Position = UDim2.new(0, 10, 0, 50)
tabFrame.BackgroundTransparency = 1
tabFrame.Parent = frame

local tabs = {
    Status = Instance.new("Frame"),
    LocalPlayer = Instance.new("Frame"),
    Farming = Instance.new("Frame"),
    FruitRaid = Instance.new("Frame"),
    SeaEvent = Instance.new("Frame"),
    Settings = Instance.new("Frame")
}
for _, tab in pairs(tabs) do
    tab.Size = UDim2.new(0, sizeX - 20, 0, sizeY - 60)
    tab.BackgroundTransparency = 1
    tab.Parent = tabFrame
    tab.Visible = false
end
tabs.Status.Visible = true

-- Tab Buttons với hiệu ứng
local tabButtons = {
    {name = "Status", pos = UDim2.new(0, 10, 0, 10)},
    {name = "LocalPlayer", pos = UDim2.new(0, 70, 0, 10)},
    {name = "Farming", pos = UDim2.new(0, 150, 0, 10)},
    {name = "FruitRaid", pos = UDim2.new(0, 220, 0, 10)},
    {name = "SeaEvent", pos = UDim2.new(0, 290, 0, 10)},
    {name = "Settings", pos = UDim2.new(0, 10, 0, 50)}
}
for i, btn in pairs(tabButtons) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 60, 0, 30)
    button.Position = btn.pos
    button.BackgroundColor3 = Color3.fromRGB(40, 60, 90)
    local btnGradient = Instance.new("UIGradient")
    btnGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 60, 90)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 90, 120))
    }
    btnGradient.Parent = button
    button.Text = btn.name
    button.TextColor3 = Color3.fromRGB(255, 215, 0)
    button.TextScaled = true
    button.Parent = frame
    button.MouseButton1Click:Connect(function()
        for _, tab in pairs(tabs) do tab.Visible = false end
        tabs[btn.name].Visible = true
        for j, b in pairs(tabButtons) do
            tabButtons[j].button.BackgroundColor3 = Color3.fromRGB(40, 60, 90)
        end
        button.BackgroundColor3 = Color3.fromRGB(60, 90, 120)
    end)
    btn.button = button
end

-- Nút Đóng
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(0, sizeX - 40, 0, 10)
closeBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
local closeGradient = Instance.new("UIGradient")
closeGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(150, 0, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 0, 0))
}
closeGradient.Parent = closeBtn
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextScaled = true
closeBtn.Parent = frame

-- Status Tab
local statusFrame = Instance.new("Frame")
statusFrame.Size = UDim2.new(0, sizeX - 40, 0, sizeY - 80)
statusFrame.Position = UDim2.new(0, 10, 0, 10)
statusFrame.BackgroundTransparency = 1
statusFrame.Parent = tabs.Status

local levelLabel = Instance.new("TextLabel")
levelLabel.Size = UDim2.new(0, sizeX - 40, 0, 30)
levelLabel.Position = UDim2.new(0, 10, 0, 10)
levelLabel.BackgroundTransparency = 1
levelLabel.Text = "Level: " .. (player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Level") and player.leaderstats.Level.Value or "N/A")
levelLabel.TextColor3 = Color3.fromRGB(0, 191, 255)
levelLabel.TextScaled = true
levelLabel.Font = Enum.Font.GothamBold
levelLabel.Parent = statusFrame

local bountyLabel = Instance.new("TextLabel")
bountyLabel.Size = UDim2.new(0, sizeX - 40, 0, 30)
bountyLabel.Position = UDim2.new(0, 10, 0, 50)
bountyLabel.BackgroundTransparency = 1
bountyLabel.Text = "Bounty: " .. (player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Bounty") and player.leaderstats.Bounty.Value or "N/A")
bountyLabel.TextColor3 = Color3.fromRGB(0, 191, 255)
bountyLabel.TextScaled = true
bountyLabel.Font = Enum.Font.GothamBold
bountyLabel.Parent = statusFrame

-- Farming Tab
local autoFarmBtn = Instance.new("TextButton")
autoFarmBtn.Size = UDim2.new(0, sizeX - 40, 0, 40)
autoFarmBtn.Position = UDim2.new(0, 10, 0, 10)
autoFarmBtn.BackgroundColor3 = Color3.fromRGB(40, 60, 90)
local farmGradient = Instance.new("UIGradient")
farmGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 60, 90)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 90, 120))
}
farmGradient.Parent = autoFarmBtn
autoFarmBtn.Text = "Auto Farm Level: " .. (Settings.AutoFarmLevel and "On" or "Off")
autoFarmBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
autoFarmBtn.TextScaled = true
autoFarmBtn.Parent = tabs.Farming

local autoQuestBtn = Instance.new("TextButton")
autoQuestBtn.Size = UDim2.new(0, sizeX - 40, 0, 40)
autoQuestBtn.Position = UDim2.new(0, 10, 0, 60)
autoQuestBtn.BackgroundColor3 = Color3.fromRGB(40, 60, 90)
local questGradient = Instance.new("UIGradient")
questGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 60, 90)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 90, 120))
}
questGradient.Parent = autoQuestBtn
autoQuestBtn.Text = "Auto Quest: " .. (Settings.AutoQuest and "On" or "Off")
autoQuestBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
autoQuestBtn.TextScaled = true
autoQuestBtn.Parent = tabs.Farming

local stackFarmBtn = Instance.new("TextButton")
stackFarmBtn.Size = UDim2.new(0, sizeX - 40, 0, 40)
stackFarmBtn.Position = UDim2.new(0, 10, 0, 110)
stackFarmBtn.BackgroundColor3 = Color3.fromRGB(40, 60, 90)
local stackGradient = Instance.new("UIGradient")
stackGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 60, 90)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 90, 120))
}
stackGradient.Parent = stackFarmBtn
stackFarmBtn.Text = "Stack Farming: " .. (Settings.AutoStackFarm and "On" or "Off")
stackFarmBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
stackFarmBtn.TextScaled = true
stackFarmBtn.Parent = tabs.Farming

local autoAcceptQuestBtn = Instance.new("TextButton")
autoAcceptQuestBtn.Size = UDim2.new(0, sizeX - 40, 0, 40)
autoAcceptQuestBtn.Position = UDim2.new(0, 10, 0, 160)
autoAcceptQuestBtn.BackgroundColor3 = Color3.fromRGB(40, 60, 90)
local acceptGradient = Instance.new("UIGradient")
acceptGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 60, 90)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 90, 120))
}
acceptGradient.Parent = autoAcceptQuestBtn
autoAcceptQuestBtn.Text = "Auto Accept Quest: " .. (Settings.AutoAcceptQuest and "On" or "Off")
autoAcceptQuestBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
autoAcceptQuestBtn.TextScaled = true
autoAcceptQuestBtn.Parent = tabs.Farming

-- FruitRaid Tab
local teleportOldWorldBtn = Instance.new("TextButton")
teleportOldWorldBtn.Size = UDim2.new(0, sizeX - 40, 0, 40)
teleportOldWorldBtn.Position = UDim2.new(0, 10, 0, 10)
teleportOldWorldBtn.BackgroundColor3 = Color3.fromRGB(40, 60, 90)
local oldGradient = Instance.new("UIGradient")
oldGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 60, 90)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 90, 120))
}
oldGradient.Parent = teleportOldWorldBtn
teleportOldWorldBtn.Text = "Teleport Old World"
teleportOldWorldBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
teleportOldWorldBtn.TextScaled = true
teleportOldWorldBtn.Parent = tabs.FruitRaid

local teleportNewWorldBtn = Instance.new("TextButton")
teleportNewWorldBtn.Size = UDim2.new(0, sizeX - 40, 0, 40)
teleportNewWorldBtn.Position = UDim2.new(0, 10, 0, 60)
teleportNewWorldBtn.BackgroundColor3 = Color3.fromRGB(40, 60, 90)
local newGradient = Instance.new("UIGradient")
newGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 60, 90)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 90, 120))
}
newGradient.Parent = teleportNewWorldBtn
teleportNewWorldBtn.Text = "Teleport New World"
teleportNewWorldBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
teleportNewWorldBtn.TextScaled = true
teleportNewWorldBtn.Parent = tabs.FruitRaid

local fruitESPBtn = Instance.new("TextButton")
fruitESPBtn.Size = UDim2.new(0, sizeX - 40, 0, 40)
fruitESPBtn.Position = UDim2.new(0, 10, 0, 110)
fruitESPBtn.BackgroundColor3 = Color3.fromRGB(40, 60, 90)
local fruitGradient = Instance.new("UIGradient")
fruitGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 60, 90)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 90, 120))
}
fruitGradient.Parent = fruitESPBtn
fruitESPBtn.Text = "Fruit ESP: " .. (Settings.FruitESP and "On" or "Off")
fruitESPBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
fruitESPBtn.TextScaled = true
fruitESPBtn.Parent = tabs.FruitRaid

-- SeaEvent Tab
local autoSeaEventBtn = Instance.new("TextButton")
autoSeaEventBtn.Size = UDim2.new(0, sizeX - 40, 0, 40)
autoSeaEventBtn.Position = UDim2.new(0, 10, 0, 10)
autoSeaEventBtn.BackgroundColor3 = Color3.fromRGB(40, 60, 90)
local seaGradient = Instance.new("UIGradient")
seaGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 60, 90)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 90, 120))
}
seaGradient.Parent = autoSeaEventBtn
autoSeaEventBtn.Text = "Auto Sea Event: " .. (Settings.AutoSeaEvent and "On" or "Off")
autoSeaEventBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
autoSeaEventBtn.TextScaled = true
autoSeaEventBtn.Parent = tabs.SeaEvent

-- Settings Tab
local antiBanBtn = Instance.new("TextButton")
antiBanBtn.Size = UDim2.new(0, sizeX - 40, 0, 40)
antiBanBtn.Position = UDim2.new(0, 10, 0, 10)
antiBanBtn.BackgroundColor3 = Color3.fromRGB(40, 60, 90)
local antiGradient = Instance.new("UIGradient")
antiGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 60, 90)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 90, 120))
}
antiGradient.Parent = antiBanBtn
antiBanBtn.Text = "Anti-Ban: " .. (Settings.AntiBan and "On" or "Off")
antiBanBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
antiBanBtn.TextScaled = true
antiBanBtn.Parent = tabs.Settings

local translatorBtn = Instance.new("TextButton")
translatorBtn.Size = UDim2.new(0, sizeX - 40, 0, 40)
translatorBtn.Position = UDim2.new(0, 10, 0, 60)
translatorBtn.BackgroundColor3 = Color3.fromRGB(40, 60, 90)
local transGradient = Instance.new("UIGradient")
transGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 60, 90)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(60, 90, 120))
}
transGradient.Parent = translatorBtn
translatorBtn.Text = "Translator: " .. (Settings.Translator and "On" or "Off")
translatorBtn.TextColor3 = Color3.fromRGB(255, 215, 0)
translatorBtn.TextScaled = true
translatorBtn.Parent = tabs.Settings

-- Anti-ban
local function checkAntiCheat()
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        local humanoid = player.Character.Humanoid
        if humanoid.WalkSpeed > 50 or humanoid.JumpPower > 75 then
            return false, "Speed/Jump issue!"
        end
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
        {min = 1, max = 10, pos = Vector3.new(-1100, 15, 1500)},
        {min = 11, max = 30, pos = Vector3.new(-600, 15, 2000)},
        {min = 31, max = 70, pos = Vector3.new(1000, 15, 1500)},
        {min = 71, max = 150, pos = Vector3.new(2000, 15, 1000)}
    }
    for _, data in pairs(npcData) do
        if level >= data.min and level <= data.max then
            return data.pos
        end
    end
    return Vector3.new(2000, 15, 1000)
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

fruitESPBtn.MouseButton1Click:Connect(function()
    Settings.FruitESP = not Settings.FruitESP
    fruitESPBtn.Text = "Fruit ESP: " .. (Settings.FruitESP and "On" or "Off")
    if Settings.FruitESP then
        spawn(function()
            while Settings.FruitESP do
                local fruit = findDevilFruit()
                if fruit and not fruit:FindFirstChild("FruitESP") then
                    local highlight = Instance.new("Highlight")
                    highlight.Name = "FruitESP"
                    highlight.Parent = fruit
                    highlight.FillColor = Color3.fromRGB(255, 165, 0)
                    highlight.OutlineColor = Color3.fromRGB(255, 140, 0)
                    if Settings.Translator then
                        game:GetService("StarterGui"):SetCore("SendNotification", {
                            Title = "Apple Hub Cat",
                            Text = "Fruit ESP activated on " .. fruit.Name,
                            Duration = 2
                        })
                    end
                end
                wait(1)
            end
            for _, v in pairs(game.Workspace:GetDescendants()) do
                if v:FindFirstChild("FruitESP") then v.FruitESP:Destroy() end
            end
        end)
    else
        for _, v in pairs(game.Workspace:GetDescendants()) do
            if v:FindFirstChild("FruitESP") then v.FruitESP:Destroy() end
        end
        if Settings.Translator then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Apple Hub Cat",
                Text = "Fruit ESP deactivated.",
                Duration = 2
            })
        end
    end
end)

teleportOldWorldBtn.MouseButton1Click:Connect(function()
    if player.Character then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(-1100, 15, 1500)
        if Settings.Translator then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Apple Hub Cat",
                Text = "Teleported to Old World.",
                Duration = 2
            })
        end
    end
end)

teleportNewWorldBtn.MouseButton1Click:Connect(function()
    if player.Character then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(1000, 15, 1500)
        if Settings.Translator then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Apple Hub Cat",
                Text = "Teleported to New World.",
                Duration = 2
            })
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
                local targetMob = nil
                local maxHealth = 0
                for _, v in pairs(game.Workspace:GetDescendants()) do
                    if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and v ~= player.Character then
                        local distance = (player.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).Magnitude
                        if distance <= 30 and v.Humanoid.MaxHealth > maxHealth and v.Humanoid.MaxHealth >= level * 10 then
                            maxHealth = v.Humanoid.MaxHealth
                            targetMob = v
                        end
                    end
                end
                if targetMob then
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(targetMob.HumanoidRootPart.Position + Vector3.new(0, 5, 0))
                    game:GetService("VirtualUser"):ClickButton1(Vector2.new(0, 0))
                    if math.random(1, 10) == 1 then
                        player.Character.Humanoid.Jump = true
                        wait(0.1)
                    end
                else
                    local npcPos = getQuestNPC(level)
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(npcPos + Vector3.new(0, 5, 0))
                end
                wait(Settings.AntiBan and 0.3 or 0.1)
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
                local npcPos = getQuestNPC(level)
                player.Character.HumanoidRootPart.CFrame = CFrame.new(npcPos + Vector3.new(0, 5, 0))
                wait(1)
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

stackFarmBtn.MouseButton1Click:Connect(function()
    Settings.AutoStackFarm = not Settings.AutoStackFarm
    stackFarmBtn.Text = "Stack Farming: " .. (Settings.AutoStackFarm and "On" or "Off")
    if Settings.AutoStackFarm then
        if Settings.Translator then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Apple Hub Cat",
                Text = "Stack Farming activated.",
                Duration = 2
            })
        end
        spawn(function()
            while Settings.AutoStackFarm and player.Character do
                if Settings.AntiBan then
                    local isSafe, reason = checkAntiCheat()
                    if not isSafe then
                        Settings.AutoStackFarm = false
                        stackFarmBtn.Text = "Stack Farming: Off"
                        if Settings.Translator then
                            game:GetService("StarterGui"):SetCore("SendNotification", {
                                Title = "Apple Hub Cat",
                                Text = "Stack Farming stopped: " .. reason,
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
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(closestNPC.HumanoidRootPart.Position + Vector3.new(0, 5, 0))
                    game:GetService("VirtualUser"):ClickButton1(Vector2.new(0, 0))
                end
                wait(Settings.AntiBan and 1 or 0.5)
            end
        end)
    else
        if Settings.Translator then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Apple Hub Cat",
                Text = "Stack Farming deactivated.",
                Duration = 2
            })
        end
    end
end)

autoAcceptQuestBtn.MouseButton1Click:Connect(function()
    Settings.AutoAcceptQuest = not Settings.AutoAcceptQuest
    autoAcceptQuestBtn.Text = "Auto Accept Quest: " .. (Settings.AutoAcceptQuest and "On" or "Off")
    if Settings.AutoAcceptQuest then
        if Settings.Translator then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Apple Hub Cat",
                Text = "Auto Accept Quest activated.",
                Duration = 2
            })
        end
        spawn(function()
            while Settings.AutoAcceptQuest and player.Character do
                if Settings.AntiBan then
                    local isSafe, reason = checkAntiCheat()
                    if not isSafe then
                        Settings.AutoAcceptQuest = false
                        autoAcceptQuestBtn.Text = "Auto Accept Quest: Off"
                        if Settings.Translator then
                            game:GetService("StarterGui"):SetCore("SendNotification", {
                                Title = "Apple Hub Cat",
                                Text = "Auto Accept Quest stopped: " .. reason,
                                Duration = 3
                            })
                        end
                        break
                    end
                end
                local level = getPlayerLevel()
                local npcPos = getQuestNPC(level)
                player.Character.HumanoidRootPart.CFrame = CFrame.new(npcPos + Vector3.new(0, 5, 0))
                local questButton = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("QuestFrame")
                if questButton then
                    fireclickdetector(questButton.ClickDetector)
                end
                wait(Settings.AntiBan and 2 or 1)
            end
        end)
    else
        if Settings.Translator then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Apple Hub Cat",
                Text = "Auto Accept Quest deactivated.",
                Duration = 2
            })
        end
    end
end)

autoSeaEventBtn.MouseButton1Click:Connect(function()
    Settings.AutoSeaEvent = not Settings.AutoSeaEvent
    autoSeaEventBtn.Text = "Auto Sea Event: " .. (Settings.AutoSeaEvent and "On" or "Off")
    if Settings.AutoSeaEvent then
        if Settings.Translator then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Apple Hub Cat",
                Text = "Auto Sea Event activated.",
                Duration = 2
            })
        end
        spawn(function()
            while Settings.AutoSeaEvent and player.Character do
                if Settings.AntiBan then
                    local isSafe, reason = checkAntiCheat()
                    if not isSafe then
                        Settings.AutoSeaEvent = false
                        autoSeaEventBtn.Text = "Auto Sea Event: Off"
                        if Settings.Translator then
                            game:GetService("StarterGui"):SetCore("SendNotification", {
                                Title = "Apple Hub Cat",
                                Text = "Auto Sea Event stopped: " .. reason,
                                Duration = 3
                            })
                        end
                        break
                    end
                end
                local closestEvent = nil
                local closestDistance = math.huge
                for _, v in pairs(game.Workspace:GetDescendants()) do
                    if v:IsA("Model") and v.Name:lower():match("seaevent") then
                        local distance = (player.Character.HumanoidRootPart.Position - v.PrimaryPart.Position).Magnitude
                        if distance < closestDistance and distance <= 50 then
                            closestDistance = distance
                            closestEvent = v
                        end
                    end
                end
                if closestEvent then
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(closestEvent.PrimaryPart.Position + Vector3.new(0, 5, 0))
                    game:GetService("VirtualUser"):ClickButton1(Vector2.new(0, 0))
                end
                wait(Settings.AntiBan and 2 or 1)
            end
        end)
    else
        if Settings.Translator then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Apple Hub Cat",
                Text = "Auto Sea Event deactivated.",
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
            Text = "Anti-Ban toggled to " .. (Settings.AntiBan and "On" or "Off") .. ".",
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
            Text = "Translator activated.",
            Duration = 2
        })
    end
end)

closeBtn.MouseButton1Click:Connect(function()
    Settings.AutoFarmLevel = false
    Settings.AutoQuest = false
    Settings.AutoStackFarm = false
    Settings.FruitESP = false
    Settings.AutoSeaEvent = false
    Settings.ESP = false
    Settings.AutoAcceptQuest = false
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

-- Cập nhật trạng thái
spawn(function()
    while wait(1) do
        if player:FindFirstChild("leaderstats") then
            levelLabel.Text = "Level: " .. (player.leaderstats:FindFirstChild("Level") and player.leaderstats.Level.Value or "N/A")
            bountyLabel.Text = "Bounty: " .. (player.leaderstats:FindFirstChild("Bounty") and player.leaderstats.Bounty.Value or "N/A")
        end
    end
end)

-- Hover effect với glow
local function addHoverEffect(button)
    button.MouseEnter:Connect(function()
        local glow = Instance.new("ImageLabel")
        glow.Name = "Glow"
        glow.Size = UDim2.new(0, button.Size.X.Offset + 20, 0, button.Size.Y.Offset + 20)
        glow.Position = UDim2.new(0, -10, 0, -10)
        glow.BackgroundTransparency = 1
        glow.Image = "rbxassetid://5028857472"
        glow.ImageColor3 = Color3.fromRGB(0, 191, 255)
        glow.ImageTransparency = 0.7
        glow.Parent = button
        local tween = tweenService:Create(button, TweenInfo.new(0.2), {Size = UDim2.new(0, button.Size.X.Offset + 10, 0, button.Size.Y.Offset)})
        tween:Play()
    end)
    button.MouseLeave:Connect(function()
        if button:FindFirstChild("Glow") then button.Glow:Destroy() end
        local tween = tweenService:Create(button, TweenInfo.new(0.2), {Size = UDim2.new(0, button.Size.X.Offset - 10, 0, button.Size.Y.Offset)})
        tween:Play()
    end)
end
for _, btn in pairs(tabButtons) do addHoverEffect(btn.button) end
addHoverEffect(autoFarmBtn)
addHoverEffect(autoQuestBtn)
addHoverEffect(stackFarmBtn)
addHoverEffect(autoAcceptQuestBtn)
addHoverEffect(espBtn)
addHoverEffect(teleportOldWorldBtn)
addHoverEffect(teleportNewWorldBtn)
addHoverEffect(fruitESPBtn)
addHoverEffect(autoSeaEventBtn)
addHoverEffect(antiBanBtn)
addHoverEffect(translatorBtn)
addHoverEffect(closeBtn)

if getgenv().AppleHubCat and Settings.Translator then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Apple Hub Cat",
        Text = "Premium Edition activated with key from Linkvertise.",
        Duration = 3
    })
end
```
