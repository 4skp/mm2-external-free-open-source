print("Loading arshibeld mm2 Tool GUI...")

local players = game:GetService("Players")
local localplayer = players.LocalPlayer
local mouse = localplayer:GetMouse()
local camera = workspace.CurrentCamera

local config = {
    esp = {
        showMurderer = true,
        showSheriff = true,
        showInnocent = true
    },
    autoFarm = {
        enabled = false,
        speed = 20
    },
    killAll = {
        keyBind = 11
    }
}

local gui = {}
local guiPos = Vector2.new(100, 100)
local dragging = false
local dragStart = Vector2.new(0, 0)
local startPos = Vector2.new(0, 0)
local menuVisible = true
local activeTab = 1
local function createGui()
    gui.mainBg = Drawing.new("Square")
    gui.mainBg.Size = Vector2.new(320, 380)
    gui.mainBg.Color = Color3.fromRGB(15, 15, 20)
    gui.mainBg.Filled = true
    gui.mainBg.Transparency = 0.9
    gui.mainBg.Visible = true
    
    gui.mainBorder = Drawing.new("Square")
    gui.mainBorder.Size = Vector2.new(320, 380)
    gui.mainBorder.Color = Color3.fromRGB(80, 80, 100)
    gui.mainBorder.Filled = false
    gui.mainBorder.Thickness = 2
    gui.mainBorder.Visible = true
    
    gui.titleBar = Drawing.new("Square")
    gui.titleBar.Size = Vector2.new(320, 35)
    gui.titleBar.Color = Color3.fromRGB(25, 25, 35)
    gui.titleBar.Filled = true
    gui.titleBar.Visible = true
    
    gui.title = Drawing.new("Text")
    gui.title.Text = "Arshibeld"
    gui.title.Size = 16
    gui.title.Center = true
    gui.title.Color = Color3.fromRGB(150, 200, 255)
    gui.title.Outline = true
    gui.title.Font = 2
    gui.title.Visible = true
    
    gui.tabsBg = Drawing.new("Square")
    gui.tabsBg.Size = Vector2.new(320, 40)
    gui.tabsBg.Color = Color3.fromRGB(20, 20, 28)
    gui.tabsBg.Filled = true
    gui.tabsBg.Visible = true
    
    gui.tab1Bg = Drawing.new("Square")
    gui.tab1Bg.Size = Vector2.new(100, 32)
    gui.tab1Bg.Color = Color3.fromRGB(40, 40, 55)
    gui.tab1Bg.Filled = true
    gui.tab1Bg.Visible = true
    
    gui.tab1Text = Drawing.new("Text")
    gui.tab1Text.Text = "ESP"
    gui.tab1Text.Size = 14
    gui.tab1Text.Center = true
    gui.tab1Text.Color = Color3.fromRGB(200, 200, 220)
    gui.tab1Text.Outline = true
    gui.tab1Text.Font = 2
    gui.tab1Text.Visible = true
    
    gui.tab2Bg = Drawing.new("Square")
    gui.tab2Bg.Size = Vector2.new(100, 32)
    gui.tab2Bg.Color = Color3.fromRGB(30, 30, 40)
    gui.tab2Bg.Filled = true
    gui.tab2Bg.Visible = true
    
    gui.tab2Text = Drawing.new("Text")
    gui.tab2Text.Text = "AUTO FARM"
    gui.tab2Text.Size = 14
    gui.tab2Text.Center = true
    gui.tab2Text.Color = Color3.fromRGB(150, 150, 170)
    gui.tab2Text.Outline = true
    gui.tab2Text.Font = 2
    gui.tab2Text.Visible = true
    
    gui.tab3Bg = Drawing.new("Square")
    gui.tab3Bg.Size = Vector2.new(100, 32)
    gui.tab3Bg.Color = Color3.fromRGB(30, 30, 40)
    gui.tab3Bg.Filled = true
    gui.tab3Bg.Visible = true
    
    gui.tab3Text = Drawing.new("Text")
    gui.tab3Text.Text = "KILL ALL"
    gui.tab3Text.Size = 14
    gui.tab3Text.Center = true
    gui.tab3Text.Color = Color3.fromRGB(150, 150, 170)
    gui.tab3Text.Outline = true
    gui.tab3Text.Font = 2
    gui.tab3Text.Visible = true
    
    gui.espContent = {}
    gui.espContent.murdererBg = Drawing.new("Square")
    gui.espContent.murdererBg.Size = Vector2.new(280, 30)
    gui.espContent.murdererBg.Color = Color3.fromRGB(25, 25, 35)
    gui.espContent.murdererBg.Filled = true
    gui.espContent.murdererBg.Transparency = 0.5
    gui.espContent.murdererBg.Visible = true
    
    gui.espContent.murdererBox = Drawing.new("Square")
    gui.espContent.murdererBox.Size = Vector2.new(20, 20)
    gui.espContent.murdererBox.Color = Color3.fromRGB(80, 80, 90)
    gui.espContent.murdererBox.Filled = false
    gui.espContent.murdererBox.Thickness = 2
    gui.espContent.murdererBox.Visible = true
    
    gui.espContent.murdererCheck = Drawing.new("Square")
    gui.espContent.murdererCheck.Size = Vector2.new(14, 14)
    gui.espContent.murdererCheck.Color = Color3.fromRGB(255, 50, 50)
    gui.espContent.murdererCheck.Filled = true
    gui.espContent.murdererCheck.Visible = config.esp.showMurderer
    
    gui.espContent.murdererText = Drawing.new("Text")
    gui.espContent.murdererText.Text = "Show Murderer"
    gui.espContent.murdererText.Size = 14
    gui.espContent.murdererText.Color = Color3.fromRGB(255, 50, 50)
    gui.espContent.murdererText.Outline = true
    gui.espContent.murdererText.Font = 2
    gui.espContent.murdererText.Visible = true
    
    gui.espContent.sheriffBg = Drawing.new("Square")
    gui.espContent.sheriffBg.Size = Vector2.new(280, 30)
    gui.espContent.sheriffBg.Color = Color3.fromRGB(25, 25, 35)
    gui.espContent.sheriffBg.Filled = true
    gui.espContent.sheriffBg.Transparency = 0.5
    gui.espContent.sheriffBg.Visible = true
    
    gui.espContent.sheriffBox = Drawing.new("Square")
    gui.espContent.sheriffBox.Size = Vector2.new(20, 20)
    gui.espContent.sheriffBox.Color = Color3.fromRGB(80, 80, 90)
    gui.espContent.sheriffBox.Filled = false
    gui.espContent.sheriffBox.Thickness = 2
    gui.espContent.sheriffBox.Visible = true
    
    gui.espContent.sheriffCheck = Drawing.new("Square")
    gui.espContent.sheriffCheck.Size = Vector2.new(14, 14)
    gui.espContent.sheriffCheck.Color = Color3.fromRGB(50, 120, 255)
    gui.espContent.sheriffCheck.Filled = true
    gui.espContent.sheriffCheck.Visible = config.esp.showSheriff
    
    gui.espContent.sheriffText = Drawing.new("Text")
    gui.espContent.sheriffText.Text = "Show Sheriff"
    gui.espContent.sheriffText.Size = 14
    gui.espContent.sheriffText.Color = Color3.fromRGB(50, 120, 255)
    gui.espContent.sheriffText.Outline = true
    gui.espContent.sheriffText.Font = 2
    gui.espContent.sheriffText.Visible = true
    
    gui.espContent.innocentBg = Drawing.new("Square")
    gui.espContent.innocentBg.Size = Vector2.new(280, 30)
    gui.espContent.innocentBg.Color = Color3.fromRGB(25, 25, 35)
    gui.espContent.innocentBg.Filled = true
    gui.espContent.innocentBg.Transparency = 0.5
    gui.espContent.innocentBg.Visible = true
    
    gui.espContent.innocentBox = Drawing.new("Square")
    gui.espContent.innocentBox.Size = Vector2.new(20, 20)
    gui.espContent.innocentBox.Color = Color3.fromRGB(80, 80, 90)
    gui.espContent.innocentBox.Filled = false
    gui.espContent.innocentBox.Thickness = 2
    gui.espContent.innocentBox.Visible = true
    
    gui.espContent.innocentCheck = Drawing.new("Square")
    gui.espContent.innocentCheck.Size = Vector2.new(14, 14)
    gui.espContent.innocentCheck.Color = Color3.fromRGB(200, 200, 200)
    gui.espContent.innocentCheck.Filled = true
    gui.espContent.innocentCheck.Visible = config.esp.showInnocent
    
    gui.espContent.innocentText = Drawing.new("Text")
    gui.espContent.innocentText.Text = "Show Innocent"
    gui.espContent.innocentText.Size = 14
    gui.espContent.innocentText.Color = Color3.fromRGB(200, 200, 200)
    gui.espContent.innocentText.Outline = true
    gui.espContent.innocentText.Font = 2
    gui.espContent.innocentText.Visible = true
    
    gui.farmContent = {}
    
    gui.farmContent.enableBg = Drawing.new("Square")
    gui.farmContent.enableBg.Size = Vector2.new(280, 30)
    gui.farmContent.enableBg.Color = Color3.fromRGB(25, 25, 35)
    gui.farmContent.enableBg.Filled = true
    gui.farmContent.enableBg.Transparency = 0.5
    gui.farmContent.enableBg.Visible = false
    
    gui.farmContent.enableBox = Drawing.new("Square")
    gui.farmContent.enableBox.Size = Vector2.new(20, 20)
    gui.farmContent.enableBox.Color = Color3.fromRGB(80, 80, 90)
    gui.farmContent.enableBox.Filled = false
    gui.farmContent.enableBox.Thickness = 2
    gui.farmContent.enableBox.Visible = false
    
    gui.farmContent.enableCheck = Drawing.new("Square")
    gui.farmContent.enableCheck.Size = Vector2.new(14, 14)
    gui.farmContent.enableCheck.Color = Color3.fromRGB(50, 255, 100)
    gui.farmContent.enableCheck.Filled = true
    gui.farmContent.enableCheck.Visible = false
    
    gui.farmContent.enableText = Drawing.new("Text")
    gui.farmContent.enableText.Text = "Enable Auto Farm"
    gui.farmContent.enableText.Size = 14
    gui.farmContent.enableText.Color = Color3.fromRGB(50, 255, 100)
    gui.farmContent.enableText.Outline = true
    gui.farmContent.enableText.Font = 2
    gui.farmContent.enableText.Visible = false
    
    gui.farmContent.speedLabel = Drawing.new("Text")
    gui.farmContent.speedLabel.Text = "Speed: 20"
    gui.farmContent.speedLabel.Size = 14
    gui.farmContent.speedLabel.Color = Color3.fromRGB(200, 200, 220)
    gui.farmContent.speedLabel.Outline = true
    gui.farmContent.speedLabel.Font = 2
    gui.farmContent.speedLabel.Visible = false
    
    gui.farmContent.sliderBg = Drawing.new("Square")
    gui.farmContent.sliderBg.Size = Vector2.new(260, 8)
    gui.farmContent.sliderBg.Color = Color3.fromRGB(30, 30, 40)
    gui.farmContent.sliderBg.Filled = true
    gui.farmContent.sliderBg.Visible = false
    
    gui.farmContent.sliderFill = Drawing.new("Square")
    gui.farmContent.sliderFill.Size = Vector2.new(170, 8)
    gui.farmContent.sliderFill.Color = Color3.fromRGB(50, 150, 255)
    gui.farmContent.sliderFill.Filled = true
    gui.farmContent.sliderFill.Visible = false
    
    gui.farmContent.sliderHandle = Drawing.new("Square")
    gui.farmContent.sliderHandle.Size = Vector2.new(16, 20)
    gui.farmContent.sliderHandle.Color = Color3.fromRGB(255, 255, 255)
    gui.farmContent.sliderHandle.Filled = true
    gui.farmContent.sliderHandle.Visible = false
    
    gui.killContent = {}
    
    gui.killContent.titleText = Drawing.new("Text")
    gui.killContent.titleText.Text = "Kill All Keybind"
    gui.killContent.titleText.Size = 15
    gui.killContent.titleText.Color = Color3.fromRGB(255, 100, 100)
    gui.killContent.titleText.Outline = true
    gui.killContent.titleText.Font = 2
    gui.killContent.titleText.Visible = false
    
    gui.killContent.keyBg = Drawing.new("Square")
    gui.killContent.keyBg.Size = Vector2.new(200, 40)
    gui.killContent.keyBg.Color = Color3.fromRGB(30, 30, 40)
    gui.killContent.keyBg.Filled = true
    gui.killContent.keyBg.Visible = false
    
    gui.killContent.keyText = Drawing.new("Text")
    gui.killContent.keyText.Text = "Key 0x" .. string.format("%X", config.killAll.keyBind)
    gui.killContent.keyText.Size = 18
    gui.killContent.keyText.Center = true
    gui.killContent.keyText.Color = Color3.fromRGB(255, 200, 100)
    gui.killContent.keyText.Outline = true
    gui.killContent.keyText.Font = 2
    gui.killContent.keyText.Visible = false
    
    gui.killContent.infoText = Drawing.new("Text")
    gui.killContent.infoText.Text = "Click the box to rebind"
    gui.killContent.infoText.Size = 12
    gui.killContent.infoText.Color = Color3.fromRGB(150, 150, 170)
    gui.killContent.infoText.Outline = true
    gui.killContent.infoText.Font = 2
    gui.killContent.infoText.Visible = false
    
    gui.killContent.statusText = Drawing.new("Text")
    gui.killContent.statusText.Text = ""
    gui.killContent.statusText.Size = 12
    gui.killContent.statusText.Color = Color3.fromRGB(100, 255, 100)
    gui.killContent.statusText.Outline = true
    gui.killContent.statusText.Font = 2
    gui.killContent.statusText.Visible = false
    
    gui.instructions = Drawing.new("Text")
    gui.instructions.Text = "[DEL] Toggle Menu"
    gui.instructions.Size = 12
    gui.instructions.Color = Color3.fromRGB(150, 150, 150)
    gui.instructions.Outline = true
    gui.instructions.Font = 2
    gui.instructions.Visible = true
end

local function updateGuiPositions()
    gui.mainBg.Position = guiPos
    gui.mainBorder.Position = guiPos
    gui.titleBar.Position = guiPos
    gui.title.Position = guiPos + Vector2.new(160, 10)
    
    gui.tabsBg.Position = guiPos + Vector2.new(0, 35)
    gui.tab1Bg.Position = guiPos + Vector2.new(10, 39)
    gui.tab1Text.Position = guiPos + Vector2.new(60, 51)
    gui.tab2Bg.Position = guiPos + Vector2.new(110, 39)
    gui.tab2Text.Position = guiPos + Vector2.new(160, 51)
    gui.tab3Bg.Position = guiPos + Vector2.new(210, 39)
    gui.tab3Text.Position = guiPos + Vector2.new(260, 51)
    
    local espY = guiPos.Y + 95
    gui.espContent.murdererBg.Position = guiPos + Vector2.new(20, espY - guiPos.Y)
    gui.espContent.murdererBox.Position = guiPos + Vector2.new(30, espY - guiPos.Y + 5)
    gui.espContent.murdererCheck.Position = guiPos + Vector2.new(33, espY - guiPos.Y + 8)
    gui.espContent.murdererText.Position = guiPos + Vector2.new(60, espY - guiPos.Y + 8)
    
    gui.espContent.sheriffBg.Position = guiPos + Vector2.new(20, espY - guiPos.Y + 40)
    gui.espContent.sheriffBox.Position = guiPos + Vector2.new(30, espY - guiPos.Y + 45)
    gui.espContent.sheriffCheck.Position = guiPos + Vector2.new(33, espY - guiPos.Y + 48)
    gui.espContent.sheriffText.Position = guiPos + Vector2.new(60, espY - guiPos.Y + 48)
    
    gui.espContent.innocentBg.Position = guiPos + Vector2.new(20, espY - guiPos.Y + 80)
    gui.espContent.innocentBox.Position = guiPos + Vector2.new(30, espY - guiPos.Y + 85)
    gui.espContent.innocentCheck.Position = guiPos + Vector2.new(33, espY - guiPos.Y + 88)
    gui.espContent.innocentText.Position = guiPos + Vector2.new(60, espY - guiPos.Y + 88)
    
    gui.farmContent.enableBg.Position = guiPos + Vector2.new(20, espY - guiPos.Y)
    gui.farmContent.enableBox.Position = guiPos + Vector2.new(30, espY - guiPos.Y + 5)
    gui.farmContent.enableCheck.Position = guiPos + Vector2.new(33, espY - guiPos.Y + 8)
    gui.farmContent.enableText.Position = guiPos + Vector2.new(60, espY - guiPos.Y + 8)
    
    gui.farmContent.speedLabel.Position = guiPos + Vector2.new(30, espY - guiPos.Y + 60)
    gui.farmContent.sliderBg.Position = guiPos + Vector2.new(30, espY - guiPos.Y + 85)
    
    local sliderPercent = (config.autoFarm.speed - 1) / 29
    local fillWidth = 260 * sliderPercent
    gui.farmContent.sliderFill.Size = Vector2.new(fillWidth, 8)
    gui.farmContent.sliderFill.Position = guiPos + Vector2.new(30, espY - guiPos.Y + 85)
    gui.farmContent.sliderHandle.Position = guiPos + Vector2.new(22 + fillWidth, espY - guiPos.Y + 79)
    
    gui.killContent.titleText.Position = guiPos + Vector2.new(30, espY - guiPos.Y + 10)
    gui.killContent.keyBg.Position = guiPos + Vector2.new(60, espY - guiPos.Y + 50)
    gui.killContent.keyText.Position = guiPos + Vector2.new(160, espY - guiPos.Y + 60)
    gui.killContent.infoText.Position = guiPos + Vector2.new(30, espY - guiPos.Y + 110)
    gui.killContent.statusText.Position = guiPos + Vector2.new(30, espY - guiPos.Y + 135)
    
    gui.instructions.Position = Vector2.new(10, camera.ViewportSize.Y - 25)
end

local function switchTab(tabIndex)
    activeTab = tabIndex
    
    if tabIndex == 1 then
        gui.tab1Bg.Color = Color3.fromRGB(40, 40, 55)
        gui.tab1Text.Color = Color3.fromRGB(200, 200, 220)
        gui.tab2Bg.Color = Color3.fromRGB(30, 30, 40)
        gui.tab2Text.Color = Color3.fromRGB(150, 150, 170)
        gui.tab3Bg.Color = Color3.fromRGB(30, 30, 40)
        gui.tab3Text.Color = Color3.fromRGB(150, 150, 170)
    elseif tabIndex == 2 then
        gui.tab1Bg.Color = Color3.fromRGB(30, 30, 40)
        gui.tab1Text.Color = Color3.fromRGB(150, 150, 170)
        gui.tab2Bg.Color = Color3.fromRGB(40, 40, 55)
        gui.tab2Text.Color = Color3.fromRGB(200, 200, 220)
        gui.tab3Bg.Color = Color3.fromRGB(30, 30, 40)
        gui.tab3Text.Color = Color3.fromRGB(150, 150, 170)
    else
        gui.tab1Bg.Color = Color3.fromRGB(30, 30, 40)
        gui.tab1Text.Color = Color3.fromRGB(150, 150, 170)
        gui.tab2Bg.Color = Color3.fromRGB(30, 30, 40)
        gui.tab2Text.Color = Color3.fromRGB(150, 150, 170)
        gui.tab3Bg.Color = Color3.fromRGB(40, 40, 55)
        gui.tab3Text.Color = Color3.fromRGB(200, 200, 220)
    end
    
    for _, element in pairs(gui.espContent) do
        element.Visible = (tabIndex == 1) and menuVisible
    end
    for _, element in pairs(gui.farmContent) do
        element.Visible = (tabIndex == 2) and menuVisible
    end
    for _, element in pairs(gui.killContent) do
        element.Visible = (tabIndex == 3) and menuVisible
    end
    
    if tabIndex == 2 and config.autoFarm.enabled then
        gui.farmContent.enableCheck.Visible = true
    end
end

local function toggleMenu()
    menuVisible = not menuVisible
    
    for name, element in pairs(gui) do
        if name ~= "instructions" and name ~= "espContent" and name ~= "farmContent" and name ~= "killContent" then
            element.Visible = menuVisible
        end
    end
    
    switchTab(activeTab)
end

local waitingForKey = false

local function startKeybindCapture()
    waitingForKey = true
    gui.killContent.statusText.Text = "Press any key..."
    gui.killContent.statusText.Color = Color3.fromRGB(255, 200, 100)
    gui.killContent.keyBg.Color = Color3.fromRGB(50, 50, 70)
    print("[Keybind] Waiting for key press...")
end

local function setKeybind(keyCode)
    config.killAll.keyBind = keyCode
    gui.killContent.keyText.Text = "Key 0x" .. string.format("%X", keyCode)
    gui.killContent.statusText.Text = "Keybind saved!"
    gui.killContent.statusText.Color = Color3.fromRGB(100, 255, 100)
    gui.killContent.keyBg.Color = Color3.fromRGB(30, 30, 40)
    waitingForKey = false
    print("[Keybind] New keybind: 0x" .. string.format("%X", keyCode))
    
    spawn(function()
        wait(2)
        if gui.killContent.statusText.Text == "Keybind saved!" then
            gui.killContent.statusText.Text = ""
        end
    end)
end

local sliderDragging = false

local function updateSliderValue(mouseX)
    local sliderX = guiPos.X + 30
    local sliderWidth = 260
    local relativeX = mouseX - sliderX
    relativeX = math.clamp(relativeX, 0, sliderWidth)
    
    local percent = relativeX / sliderWidth
    config.autoFarm.speed = math.floor(1 + (percent * 29))
    
    gui.farmContent.speedLabel.Text = "Speed: " .. config.autoFarm.speed
    updateGuiPositions()
end

local boxes = {}

local function add_esp(plr)
    local box = {
        outline = Drawing.new("Square"),
        main = Drawing.new("Square"),
        name = Drawing.new("Text"),
        isActive = false
    }
    
    box.outline.Thickness = 3
    box.outline.Filled = false
    box.outline.Color = Color3.fromRGB(0, 0, 0)
    box.outline.Visible = false
    box.outline.Position = Vector2.new(0, 0)
    box.outline.Size = Vector2.new(1, 1)
    
    box.main.Thickness = 1
    box.main.Filled = false
    box.main.Color = Color3.fromRGB(255, 255, 255)
    box.main.Visible = false
    box.main.Position = Vector2.new(0, 0)
    box.main.Size = Vector2.new(1, 1)
    
    box.name.Text = plr.Name
    box.name.Color = Color3.fromRGB(255, 255, 255)
    box.name.Center = true
    box.name.Outline = true
    box.name.Size = 13
    box.name.Font = 2
    box.name.Visible = false
    box.name.Position = Vector2.new(0, 0)
    
    boxes[plr] = box
end

local function remove_esp(plr)
    if boxes[plr] then
        boxes[plr].outline:Remove()
        boxes[plr].main:Remove()
        boxes[plr].name:Remove()
        boxes[plr] = nil
    end
end

local function getbbox(char)
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then 
        return false, 0, 0, 0, 0 
    end
    
    local head = char:FindFirstChild("Head")
    local leftFoot = char:FindFirstChild("LeftFoot") or char:FindFirstChild("Left Leg")
    
    if not head or not leftFoot then
        return false, 0, 0, 0, 0
    end
    
    local headPos, headVisible = WorldToScreen(head.Position)
    local footPos, footVisible = WorldToScreen(leftFoot.Position)
    
    if headVisible and footVisible then
        local height = math.abs(footPos.Y - headPos.Y)
        local width = height * 0.5
        local centerPos = WorldToScreen(hrp.Position)
        local x = centerPos.X - width / 2
        local y = math.min(headPos.Y, footPos.Y)
        
        return true, x, y, width, height
    end
    
    return false, 0, 0, 0, 0
end

local function hasTool(player, toolName)
    if not player or not player.Character then return false end
    
    for _, item in pairs(player.Character:GetChildren()) do
        if item:IsA("Tool") then
            local name = item.Name:lower()
            local handle = item:FindFirstChild("Handle")
            if handle and name:find(toolName) then
                return true
            end
        end
    end
    
    local backpack = player:FindFirstChild("Backpack")
    if backpack then
        for _, item in pairs(backpack:GetChildren()) do
            if item:IsA("Tool") then
                local name = item.Name:lower()
                local handle = item:FindFirstChild("Handle")
                if handle and name:find(toolName) then
                    return true
                end
            end
        end
    end
    
    return false
end

local roleCache = {}
local roleCacheTime = {}
local ROLE_CACHE_DURATION = 8

local function isMurderer(player)
    local currentTime = os.clock()
    if roleCache[player] and roleCacheTime[player] and (currentTime - roleCacheTime[player]) < ROLE_CACHE_DURATION then
        return roleCache[player] == "murderer"
    end
    
    local result = hasTool(player, "knife") or hasTool(player, "blade")
    if result then
        roleCache[player] = "murderer"
    elseif not result and roleCache[player] ~= "sheriff" then
        roleCache[player] = "innocent"
    end
    roleCacheTime[player] = currentTime
    return result
end

local function isSheriff(player)
    local currentTime = os.clock()
    if roleCache[player] and roleCacheTime[player] and (currentTime - roleCacheTime[player]) < ROLE_CACHE_DURATION then
        return roleCache[player] == "sheriff"
    end
    
    local result = hasTool(player, "gun") or hasTool(player, "revolver")
    if result then
        roleCache[player] = "sheriff"
    elseif not result and roleCache[player] ~= "murderer" then
        roleCache[player] = "innocent"
    end
    roleCacheTime[player] = currentTime
    return result
end

players.PlayerRemoving:Connect(function(plr)
    roleCache[plr] = nil
    roleCacheTime[plr] = nil
end)

for _, plr in pairs(players:GetPlayers()) do
    if plr ~= localplayer then
        add_esp(plr)
    end
end

players.PlayerAdded:Connect(function(plr)
    if plr ~= localplayer then
        add_esp(plr)
    end
end)

players.PlayerRemoving:Connect(function(plr)
    remove_esp(plr)
    roleCache[plr] = nil
    roleCacheTime[plr] = nil
end)

local map = nil
local can_tween = true

local function is_valid(obj)
    return obj and obj.Parent ~= nil
end

local function magnitude(point1, point2)
    local dx = point2.X - point1.X
    local dy = point2.Y - point1.Y
    local dz = point2.Z - point1.Z
    return math.sqrt(dx*dx + dy*dy + dz*dz)
end

local function get_closest_coin()
    local closest_coin = nil
    local closest_distance = math.huge
    local max_coin_distance = 200

    local character = localplayer.Character
    if not character then return nil, closest_distance end

    local humanoidrootpart = character:FindFirstChild("HumanoidRootPart")
    if not humanoidrootpart then return nil, closest_distance end

    local coin_container = map:FindFirstChild("CoinContainer")
    if not coin_container then return nil, closest_distance end

    for _, coin in pairs(coin_container:GetChildren()) do
        if is_valid(coin) and coin:FindFirstChild("TouchInterest") and coin:FindFirstChild("CoinVisual") then
            local coin_distance = magnitude(coin.Position, humanoidrootpart.Position)
            if coin_distance < closest_distance and coin_distance <= max_coin_distance then
                closest_coin = coin
                closest_distance = coin_distance
            end
        end
    end

    return closest_coin, closest_distance
end

local function tween_position(object, target, duration)
    local start_time = os.clock()
    local start_pos = object.Position
    local end_time = start_time + duration
    can_tween = false

    while os.clock() < end_time do
        if (not is_valid(object)) or (not is_valid(target) or (not is_valid(map))) then
            break
        end

        local alpha = (os.clock() - start_time) / duration
        if alpha > 1 then alpha = 1 end

        local tx, ty, tz = target.Position.X, target.Position.Y, target.Position.Z
        local sx, sy, sz = start_pos.X, start_pos.Y, start_pos.Z

        object.Position = Vector3.new(
            sx + (tx - sx) * alpha,
            sy + (ty - sy) * alpha,
            sz + (tz - sz) * alpha
        )
        object.Velocity = Vector3.new(0, 0, 0)
        wait(0.01)
    end

    can_tween = true
    if is_valid(object) and is_valid(target) then
        object.Position = target.Position
    end
end

local function set_noclip()
    local character = localplayer.Character
    if character then
        for _, v in pairs(character:GetChildren()) do
            if v:IsA("Part") or v:IsA("MeshPart") or v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end
end

local UserInputService = game:GetService("UserInputService")
local EXTENDED_HITBOX = Vector3.new(1500, 1500, 1500)
local NORMAL_HITBOX = Vector3.new(2, 2, 1)
local TP_HEIGHT = 850
local TEAM_CHECK = true
local isExecuting = false
local savedPosition = nil

local function IsLocalPlayer(player)
    if not player then return false end
    return player.Name == localplayer.Name
end

local function IsTeammate(player)
    if not TEAM_CHECK then return false end
    if not localplayer.Team or not player.Team then return false end
    return player.Team == localplayer.Team
end

local function SetAllHitboxes(size)
    for _, player in pairs(players:GetPlayers()) do
        if player and not IsLocalPlayer(player) and not IsTeammate(player) then
            local character = player.Character
            if character then
                local hrp = character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.Size = size
                    hrp.CanCollide = false
                end
            end
        end
    end
end

local function ExecuteKillAll()
    if isExecuting then
        print("[Kill All] Déjà en cours...")
        return
    end
    
    isExecuting = true
    print("[Kill All] === DÉBUT ===")
    
    local character = localplayer.Character
    if not character then 
        print("[Kill All] Pas de character!")
        isExecuting = false
        return
    end
    
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp then 
        print("[Kill All] Pas de HRP!")
        isExecuting = false
        return
    end
    
    savedPosition = hrp.Position
    print("[Kill All] Position sauvegardée: " .. tostring(savedPosition))
    
    print("[Kill All] 1. Touche 1...")
    keypress(0x31)
    wait(0.05)
    keyrelease(0x31)
    wait(0.1)
    
    print("[Kill All] 2. Extension hitbox 1500x1500x1500...")
    SetAllHitboxes(EXTENDED_HITBOX)
    wait(0.1)
    
    print("[Kill All] 3. TP en hauteur (+" .. TP_HEIGHT .. " studs)...")
    local newPos = Vector3.new(savedPosition.X, savedPosition.Y + TP_HEIGHT, savedPosition.Z)
    hrp.Position = newPos
    wait(0.85)
    
    print("[Kill All] 4. Clic d'attaque...")
    mouse1click()
    wait(1.85)
    
    print("[Kill All] 5. Retour position initiale...")
    hrp.Position = savedPosition
    wait(0.2)
    
    print("[Kill All] 6. Restauration hitbox 2x2x1...")
    SetAllHitboxes(NORMAL_HITBOX)
    
    print("[Kill All] === TERMINÉ ===")
    isExecuting = false
end

-- Maintien des hitbox normales
spawn(function()
    while true do
        if not isExecuting then
            SetAllHitboxes(NORMAL_HITBOX)
        end
        wait(0.2)
    end
end)

createGui()
updateGuiPositions()
switchTab(1)

print("Matcha Multi-Tool GUI Loaded!")
print("Current keybinds:")
print("  - DEL: Toggle menu")
print("  - Key 0x" .. string.format("%X", config.killAll.keyBind) .. ": Kill All")

local lastDelState = false
local lastMouseState = false
local lastKillKeyState = false
local checkedKeys = {}

while true do
    local delPressed = iskeypressed(0x2E)
    if delPressed and not lastDelState then
        toggleMenu()
    end
    lastDelState = delPressed
    
    if waitingForKey then
        for keyCode = 0x01, 0xFE do
            if keyCode ~= 0x2E and keyCode ~= 0x01 and keyCode ~= 0x02 and keyCode ~= 0x04 then
                if iskeypressed(keyCode) then
                    if not checkedKeys[keyCode] then
                        print("[Keybind] Key detected: 0x" .. string.format("%X", keyCode))
                        setKeybind(keyCode)
                        checkedKeys = {}
                        break
                    end
                else
                    checkedKeys[keyCode] = nil
                end
            end
        end
    end
    
    local mousePressed = ismouse1pressed()
    local mousePos = Vector2.new(mouse.X, mouse.Y)
    
    if mousePressed and not lastMouseState and menuVisible then
        if mousePos.X >= guiPos.X and mousePos.X <= guiPos.X + 320 and
           mousePos.Y >= guiPos.Y and mousePos.Y <= guiPos.Y + 35 then
            dragging = true
            dragStart = mousePos
            startPos = guiPos
        end
        
        if mousePos.Y >= guiPos.Y + 39 and mousePos.Y <= guiPos.Y + 71 then
            if mousePos.X >= guiPos.X + 10 and mousePos.X <= guiPos.X + 110 then
                switchTab(1)
            elseif mousePos.X >= guiPos.X + 110 and mousePos.X <= guiPos.X + 210 then
                switchTab(2)
            elseif mousePos.X >= guiPos.X + 210 and mousePos.X <= guiPos.X + 310 then
                switchTab(3)
            end
        end
        
        if activeTab == 1 then
            local espY = guiPos.Y + 95
            
            if mousePos.X >= guiPos.X + 20 and mousePos.X <= guiPos.X + 300 then
                if mousePos.Y >= espY and mousePos.Y <= espY + 30 then
                    config.esp.showMurderer = not config.esp.showMurderer
                    gui.espContent.murdererCheck.Visible = config.esp.showMurderer
                    print("[ESP] Murderer: " .. tostring(config.esp.showMurderer))
                elseif mousePos.Y >= espY + 40 and mousePos.Y <= espY + 70 then
                    config.esp.showSheriff = not config.esp.showSheriff
                    gui.espContent.sheriffCheck.Visible = config.esp.showSheriff
                    print("[ESP] Sheriff: " .. tostring(config.esp.showSheriff))
                elseif mousePos.Y >= espY + 80 and mousePos.Y <= espY + 110 then
                    config.esp.showInnocent = not config.esp.showInnocent
                    gui.espContent.innocentCheck.Visible = config.esp.showInnocent
                    print("[ESP] Innocent: " .. tostring(config.esp.showInnocent))
                end
            end
        end
        
        if activeTab == 2 then
            local espY = guiPos.Y + 95
            
            if mousePos.X >= guiPos.X + 20 and mousePos.X <= guiPos.X + 300 and
               mousePos.Y >= espY and mousePos.Y <= espY + 30 then
                config.autoFarm.enabled = not config.autoFarm.enabled
                gui.farmContent.enableCheck.Visible = config.autoFarm.enabled
                print("[AutoFarm] Enabled: " .. tostring(config.autoFarm.enabled))
            end
            
            if mousePos.X >= guiPos.X + 30 and mousePos.X <= guiPos.X + 290 and
               mousePos.Y >= espY + 79 and mousePos.Y <= espY + 99 then
                sliderDragging = true
                updateSliderValue(mousePos.X)
            end
        end
        
        if activeTab == 3 then
            local espY = guiPos.Y + 95
            
            if not waitingForKey and mousePos.X >= guiPos.X + 60 and mousePos.X <= guiPos.X + 260 and
               mousePos.Y >= espY + 50 and mousePos.Y <= espY + 90 then
                startKeybindCapture()
            end
        end
    end
    
    if not mousePressed then
        dragging = false
        sliderDragging = false
    end
    
    if dragging then
        local delta = mousePos - dragStart
        guiPos = startPos + delta
        updateGuiPositions()
    end
    
    if sliderDragging then
        updateSliderValue(mousePos.X)
    end
    
    lastMouseState = mousePressed
    
    for plr, box in pairs(boxes) do
        if plr and plr.Parent and plr.Character then
            local hum = plr.Character:FindFirstChild("Humanoid")
            
            if hum and hum.Health > 0 then
                local success, ok, x, y, w, h = pcall(getbbox, plr.Character)
                
                if success and ok and w and w > 0 and h and h > 0 then
                    local color = Color3.fromRGB(200, 200, 200)
                    local role = ""
                    local shouldShow = false
                    
                    if isMurderer(plr) then
                        color = Color3.fromRGB(255, 50, 50)
                        role = " [MURDERER]"
                        shouldShow = config.esp.showMurderer
                    elseif isSheriff(plr) then
                        color = Color3.fromRGB(50, 120, 255)
                        role = " [SHERIFF]"
                        shouldShow = config.esp.showSheriff
                    else
                        shouldShow = config.esp.showInnocent
                    end
                    
                    if shouldShow then
                        box.main.Color = color
                        box.name.Color = color
                        box.name.Text = plr.Name .. role
                        
                        box.outline.Position = Vector2.new(x - 1, y - 1)
                        box.outline.Size = Vector2.new(w + 2, h + 2)
                        box.main.Position = Vector2.new(x, y)
                        box.main.Size = Vector2.new(w, h)
                        box.name.Position = Vector2.new(x + w * 0.5, y - 16)
                        
                        if not box.isActive then
                            box.outline.Visible = true
                            box.main.Visible = true
                            box.name.Visible = true
                            box.isActive = true
                        end
                    else
                        if box.isActive then
                            box.outline.Visible = false
                            box.main.Visible = false
                            box.name.Visible = false
                            box.isActive = false
                        end
                    end
                else
                    if box.isActive then
                        box.outline.Visible = false
                        box.main.Visible = false
                        box.name.Visible = false
                        box.isActive = false
                    end
                end
            else
                if box.isActive then
                    box.outline.Visible = false
                    box.main.Visible = false
                    box.name.Visible = false
                    box.isActive = false
                end
            end
        else
            if box.isActive then
                box.outline.Visible = false
                box.main.Visible = false
                box.name.Visible = false
                box.isActive = false
            end
        end
    end
    
    if config.autoFarm.enabled then
        for _, v in pairs(workspace:GetChildren()) do
            if v:FindFirstChild("Spawns") and v.Name ~= "Lobby" then
                map = v
            end
        end
        
        set_noclip()
        
        local coins = nil
        pcall(function() 
            coins = localplayer.PlayerGui.MainGUI.Game.CoinBags.Container.Candy.CurrencyFrame.Icon.Coins
        end)
        
        local character = localplayer.Character
        if character then
            local humanoidrootpart = character:FindFirstChild("HumanoidRootPart")
            if humanoidrootpart then
                if (is_valid(map)) and coins and coins.Text ~= "40" then
                    local closest_coin, coin_distance = get_closest_coin()
                    
                    if is_valid(closest_coin) then
                        humanoidrootpart.Velocity = Vector3.new(0, 0, 0)
                        
                        if can_tween then
                            spawn(function() 
                                tween_position(humanoidrootpart, closest_coin, coin_distance / config.autoFarm.speed)
                            end)
                        end
                    end
                end
            end
        end
    end
    
    local killKeyPressed = iskeypressed(config.killAll.keyBind)
    if killKeyPressed and not lastKillKeyState then
        ExecuteKillAll()
    end
    lastKillKeyState = killKeyPressed
    
    wait(0.002)
end