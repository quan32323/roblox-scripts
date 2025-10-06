-- Apple Hub Cat Việt Hóa by Quân - Bản Cross-Platform Chuối Xịn
local Settings = {
    AutoFarmLevel = false,
    AutoQuest = false,
    ESP = false,
    AntiBan = true,
    Translator = true
}

local validKeys = { -- Danh sách key hợp lệ, bạn tự thêm
    "key1-xin123",
    "key2-chuoi456",
    "key3-premium789"
}
getgenv().ActivatedKey = nil -- Lưu key đã kích hoạt

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "AppleHubCatPremium"
gui.Parent = player.PlayerGui
gui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 300)
frame.Position = UDim2.new(0.5, -200, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.Parent = gui

local uigradient = Instance.new("UIGradient")
uigradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 25)), ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 50, 50))}
uigradient.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0, 380, 0, 40)
title.Position = UDim2.new(0, 10, 0, 10)
title.BackgroundTransparency = 1
title.Text = "Apple Hub Cat - Premium"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.Gotham
title.Parent = frame

local tweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tween = tweenService:Create(frame, tweenInfo, {BackgroundTransparency = 0})
tween:Play()

local tabFrame = Instance.new("Frame")
tabFrame.Size = UDim2.new(0, 380, 0, 250)
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
    tab.Size = UDim2.new(0, 380, 0, 250)
    tab.BackgroundTransparency = 1
    tab.Parent = tabFrame
    tab.Visible = false
end
tabs.Home.Visible = true

local tabButtons = {
    {name = "Home", pos = UDim2.new(0, 10, 0, 10)},
    {name = "Farm", pos = UDim2.new(0, 60, 0, 10)},
    {name = "Teleport", pos = UDim2.new(0, 110, 0, 10)},
    {name = "Visuals", pos = UDim2.new(0, 180, 0, 10)},
    {name = "Settings", pos = UDim2.new(0, 250, 0, 10)}
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

local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0, 360, 0, 40)
keyBox.Position = UDim2.new(0, 10, 0, 10)
keyBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
keyBox.Text = ""
keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyBox.TextScaled = true
keyBox.Font = Enum.Font.Gotham
keyBox.PlaceholderText = "Nhập key của bạn..."
keyBox.Parent = tabs.Home

local activateBtn = Instance.new("TextButton")
activateBtn.Size = UDim2.new(0, 360, 0, 40)
activateBtn.Position = UDim2.new(0, 10, 0, 60)
activateBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
activateBtn.Text = "Activate Key"
activateBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
activateBtn.TextScaled = true
activateBtn.Parent = tabs.Home

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(0, 360, 0, 40)
statusLabel.Position = UDim2.new(0, 10, 0, 110)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "Status: Chưa kích hoạt"
statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
statusLabel.TextScaled = true
statusLabel.Font = Enum.Font.Gotham
statusLabel.Parent = tabs.Home

activateBtn.MouseButton1Click:Connect(function()
    local enteredKey = keyBox.Text
    if table.find(validKeys, enteredKey) then
        getgenv().ActivatedKey = enteredKey
        statusLabel.Text = "Status: Kích hoạt thành công với key " .. enteredKey
        statusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        if Settings.Translator then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Apple Hub Cat",
                Text = "Key " .. enteredKey .. " đã được kích hoạt!",
                Duration = 3
            })
        end
    else
        statusLabel.Text = "Status: Key sai hoặc không hợp lệ"
        statusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        if Settings.Translator then
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Apple Hub Cat",
                Text = "Key sai! Vui lòng thử lại.",
                Duration = 3
            })
        end
    end
end)

local autoFarmBtn = Instance.new("TextButton")
autoFarmBtn.Size = UDim2.new(0, 360, 0, 40)
autoFarmBtn.Position = UDim2.new(0, 10, 0, 10)
autoFarmBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
autoFarmBtn.Text = "Auto Farm Level: Off"
autoFarmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
autoFarmBtn.TextScaled = true
autoFarmBtn.Parent = tabs.Farm

local autoQuestBtn = Instance.new("TextButton")
autoQuestBtn.Size = UDim2.new(0, 360, 0, 40)
autoQuestBtn.Position = UDim2.new(0, 10, 0, 60)
autoQuestBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
autoQuestBtn.Text = "Auto Quest: Off"
autoQuestBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
autoQuestBtn.TextScaled = true
autoQuestBtn.Parent = tabs.Farm

local teleportBtn = Instance.new("TextButton")
teleportBtn.Size = UDim2.new(0, 360, 0, 40)
teleportBtn.Position = UDim2.new(0, 10, 0, 10)
teleportBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
teleportBtn.Text = "Teleport to Quest/Fruit"
teleportBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
teleportBtn.TextScaled = true
teleportBtn.Parent = tabs.Teleport

local espBtn = Instance.new("TextButton")
espBtn.Size = UDim2.new(0, 360, 0, 40)
espBtn.Position = UDim2.new(0, 10, 0, 10)
espBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
espBtn.Text = "ESP: Off"
espBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
espBtn.TextScaled = true
espBtn.Parent = tabs.Visuals

local antiBanBtn = Instance.new("TextButton")
antiBanBtn.Size = UDim2.new(0, 360, 0, 40)
antiBanBtn.Position = UDim2.new(0, 10, 0, 10)
antiBanBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
antiBanBtn.Text = "Anti-Ban: On"
antiBanBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
antiBanBtn.TextScaled = true
antiBanBtn.Parent = tabs.Settings

local translatorBtn = Instance.new("TextButton")
translatorBtn.Size = UDim2.new(0, 360, 0, 40)
translatorBtn.Position = UDim2.new(0, 10, 0, 60)
translatorBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
translatorBtn.Text = "Translator: On"
translatorBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
translatorBtn.TextScaled = true
translatorBtn.Parent = tabs.Settings

autoFarmBtn.MouseButton1Click:Connect(function()
    Settings.AutoFarmLevel = not Settings.AutoFarmLevel
    autoFarmBtn.Text = "Auto Farm Level: " .. (Settings.AutoFarmLevel and "On" or "Off")
end)

autoQuestBtn.MouseButton1Click:Connect(function()
    Settings.AutoQuest = not Settings.AutoQuest
    autoQuestBtn.Text = "Auto Quest: " .. (Settings.AutoQuest and "On" or "Off")
end)

espBtn.MouseButton1Click:Connect(function()
    Settings.ESP = not Settings.ESP
    espBtn.Text = "ESP: " .. (Settings.ESP and "On" or "Off")
end)

antiBanBtn.MouseButton1Click:Connect(function()
    Settings.AntiBan = not Settings.AntiBan
    antiBanBtn.Text = "Anti-Ban: " .. (Settings.AntiBan and "On" or "Off")
end)

translatorBtn.MouseButton1Click:Connect(function()
    Settings.Translator = not Settings.Translator
    translatorBtn.Text = "Translator: " .. (Settings.Translator and "On" or "Off")
end)

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

local function findDevilFruit()
    for _, v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("BasePart") and v.Name:lower():match("devilfruit") then
            return v
        end
    end
    return nil
end

local function getPlayerLevel()
    local leaderstats = player:FindFirstChild("leaderstats")
    if leaderstats and leaderstats:FindFirstChild("Level") then
        return tonumber(leaderstats.Level.Value) or 1
    end
    return 1
end

teleportBtn.MouseButton1Click:Connect(function()
    if Settings.AntiBan then
        local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
        if humanoid and humanoid.WalkSpeed > 50 then return end
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
        local level = getPlayerLevel()
        local npcPos = getQuestNPC(level)
        if player.Character then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(npcPos + Vector3.new(0, 5, 0))
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

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(0, 360, 0, 10)
closeBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.TextScaled = true
closeBtn.Parent = frame
closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

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
addHoverEffect(espBtn)
addHoverEffect(teleportBtn)
addHoverEffect(antiBanBtn)
addHoverEffect(translatorBtn)
addHoverEffect(closeBtn)
addHoverEffect(activateBtn)

if Settings.Translator and not getgenv().ActivatedKey then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Apple Hub Cat",
        Text = "Vui lòng nhập và kích hoạt key trong tab Home!",
        Duration = 3
    })
end
