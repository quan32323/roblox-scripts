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
    AutoFarmLevel = false,
    AutoQuest = false,
    AutoStackFarm = false,
    AutoSeaEvent = false,
    ESP = false,
    FruitFinder = false,
    AntiBan = true,
    Translator = true
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

-- Tab Buttons (như Banna)
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

-- Nút Đóng
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(0, sizeX - 40, 0, 10)
closeBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
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
levelLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
levelLabel.TextScaled = true
levelLabel.Font = Enum.Font.Gotham
levelLabel.Parent = statusFrame

local bountyLabel = Instance.new("TextLabel")
bountyLabel.Size = UDim2.new(0, sizeX - 40, 0, 30)
bountyLabel.Position = UDim2.new(0, 10, 0, 50)
bountyLabel.BackgroundTransparency = 1
bountyLabel.Text = "Bounty: " .. (player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Bounty") and player.leaderstats.Bounty.Value or "N/A")
bountyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
bountyLabel.TextScaled = true
bountyLabel.Font = Enum.Font.Gotham
bountyLabel.Parent = statusFrame

-- Farm Tab
local autoFarmBtn = Instance.new("TextButton")
autoFarmBtn.Size = UDim2.new(0, sizeX - 40, 0, 40)
autoFarmBtn.Position = UDim2.new(0, 10, 0, 10)
autoFarmBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
autoFarmBtn.Text = "Auto Farm Level: " .. (Settings.AutoFarmLevel and "On" or "Off")
autoFarmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
autoFarmBtn.TextScaled = true
autoFarmBtn.Parent = tabs.Farm

local autoQuestBtn = Instance.new("TextButton")
autoQuestBtn.Size = UDim2.new(0, sizeX - 40, 0, 40)
autoQuestBtn.Position = UDim2.new(0, 10, 0, 60)
autoQuestBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
autoQuestBtn.Text = "Auto Quest: " .. (Settings.AutoQuest and "On" or "Off")
autoQuestBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
autoQuestBtn.TextScaled = true
autoQuestBtn.Parent = tabs.Farm

local stackFarmBtn = Instance.new("TextButton")
stackFarmBtn.Size = UDim2.new(0, sizeX - 40, 0, 40)
stackFarmBtn.Position = UDim2.new(0, 10, 0, 110)
stackFarmBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
stackFarmBtn.Text = "Stack Farming: Off"
stackFarmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
stackFarmBtn.TextScaled = true
stackFarmBtn.Parent = tabs.Farm

-- Teleport Tab
local teleportOldWorldBtn = Instance.new("TextButton")
teleportOldWorldBtn.Size = UDim2.new(0, sizeX - 40, 0, 40)
teleportOldWorldBtn.Position = UDim2.new(0, 10, 0, 10)
teleportOldWorldBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
teleportOldWorldBtn.Text = "Teleport Old World"
teleportOldWorldBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
teleportOldWorldBtn.TextScaled = true
teleportOldWorldBtn.Parent = tabs.Teleport

local teleportNewWorldBtn = Instance.new("TextButton")
teleportNewWorldBtn.Size = UDim2.new(0, sizeX - 40, 0, 40)
teleportNewWorldBtn.Position = UDim2.new(0, 10, 0, 60)
teleportNewWorldBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
teleportNewWorldBtn.Text = "Teleport New World"
teleportNewWorldBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
teleportNewWorldBtn.TextScaled = true
teleportNewWorldBtn.Parent = tabs.Teleport

-- Visuals Tab
local espBtn = Instance.new("TextButton")
espBtn.Size = UDim2.new(0, sizeX - 40, 0, 40)
espBtn.Position = UDim2.new(0, 10, 0, 10)
espBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
espBtn.Text = "ESP: " .. (Settings.ESP and "On" or "Off")
espBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
espBtn.TextScaled = true
espBtn.Parent = tabs.Visuals

local fruitFinderBtn = Instance.new("TextButton")
fruitFinderBtn.Size = UDim2.new(0, sizeX - 40, 0, 40)
fruitFinderBtn.Position = UDim2.new(0, 10, 0, 60)
fruitFinderBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
fruitFinderBtn.Text = "Fruit Finder: Off"
fruitFinderBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
fruitFinderBtn.TextScaled = true
fruitFinderBtn.Parent = tabs.Visuals

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

teleportOldWorldBtn.MouseButton1Click:Connect(function()
    if player.Character then
        player.Character.HumanoidRootPart.CFrame = CFrame.new(-1100, 15, 1500) -- Old World
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
        player.Character.HumanoidRootPart.CFrame = CFrame.new(1000, 15, 1500) -- New World
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
                local npcPos = getQuestNPC(level)
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
                -- Logic stack farm (tự động farm mob)
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

fruitFinderBtn.MouseButton1Click:Connect(function()
    Settings.FruitFinder = not Settings.FruitFinder
    fruitFinderBtn.Text = "Fruit Finder: " .. (Settings.FruitFinder and "On" or "Off")
    if Settings.FruitFinder then
        if Settings.Translator then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Apple Hub Cat",
                Text = "Fruit Finder activated.",
                Duration = 2
            })
        end
        spawn(function()
            while Settings.FruitFinder and player.Character do
                local fruit = findDevilFruit()
                if fruit then
                    player.Character.HumanoidRootPart.CFrame = CFrame.new(fruit.Position + Vector3.new(0, 5, 0))
                    if Settings.Translator then
                        game:GetService("StarterGui"):SetCore("SendNotification", {
                            Title = "Apple Hub Cat",
                            Text = "Devil Fruit found and teleported!",
                            Duration = 2
                        })
                    end
                    wait(1)
                end
                wait(5)
            end
        end)
    else
        if Settings.Translator then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Apple Hub Cat",
                Text = "Fruit Finder deactivated.",
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
                -- Logic Sea Event (tìm event, teleport)
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

closeBtn.MouseButton1Click:Connect(function()
    Settings.AutoFarmLevel = false
    Settings.AutoQuest = false
    Settings.AutoStackFarm = false
    Settings.FruitFinder = false
    Settings.AutoSeaEvent = false
    Settings.ESP = false
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

-- Hiệu ứng mở menu
if getgenv().AppleHubCat then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Apple Hub Cat",
        Text = "Premium Edition activated with key 'applepremium'.",
        Duration = 3
    })
end

-- Hover effect
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
addHoverEffect(autoFarmBtn)
addHoverEffect(autoQuestBtn)
addHoverEffect(stackFarmBtn)
addHoverEffect(espBtn)
addHoverEffect(teleportOldWorldBtn)
addHoverEffect(teleportNewWorldBtn)
addHoverEffect(fruitFinderBtn)
addHoverEffect(antiBanBtn)
addHoverEffect(translatorBtn)
addHoverEffect(closeBtn)
```
