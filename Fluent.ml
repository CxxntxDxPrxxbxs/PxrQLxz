local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/4479cantcode/Library/refs/heads/main/Fluent/Distribution/Fluent.luau"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/4479cantcode/Library/refs/heads/main/Fluent/Addons/InterfaceManager.luau"))()

getgenv().MysteryHub = getgenv().MysteryHub or {}
local MH = getgenv().MysteryHub

MH.Gen = (MH.Gen or 0) + 1
local myGen = MH.Gen

MH.S = {
    RS = game:GetService("ReplicatedStorage"),
    TP = game:GetService("TeleportService"),
    HTTP = game:GetService("HttpService"),
    Run = game:GetService("RunService"),
    UIS = game:GetService("UserInputService"),
    Players = game:GetService("Players"),
    Lighting = game:GetService("Lighting"),
    VirtualUser = game:GetService("VirtualUser"),
    Stats = game:GetService("Stats"),
    VIM = game:GetService("VirtualInputManager"),
}

MH.S.LP = MH.S.Players.LocalPlayer
MH.S.Camera  = workspace.CurrentCamera
MH.S.JobId = game.JobId
MH.S.PlaceId = game.PlaceId

MH.V = MH.V or {
    -- Tab Farm
    AutoJoinBrawl = false,
    AutoWinBrawl  = false,
}

MH.T  = MH.T  or {}
MH.C  = MH.C  or {}
MH.St = MH.St or {
    -- Tab Home
    Ping = 0,
    FPS = 0,
    FrameCount = 0,
    LastFPSCheck = tick(),
    JoinTick = tick(),
}

MH.D = MH.D or {}
MH.H = MH.H or {}

local S  = MH.S
local V  = MH.V
local D  = MH.D
local T  = MH.T
local C  = MH.C
local H  = MH.H
local St = MH.St

local U = {
    pcall_ = pcall,
    string_format = string.format,
    table_insert = table.insert,
    table_concat = table.concat,
    table_sort = table.sort,
    math_min = math.min,
    math_max = math.max,
}

local R = {}

----------------------
-- DATA (D)
----------------------

-- Tab Home
D.PlayerInfo = D.PlayerInfo or {
    Name = S.LP.Name,
    DisplayName = S.LP.DisplayName,
    UserId = S.LP.UserId,
    AccountAge  = S.LP.AccountAge,
}

D.ExecutorInfo = D.ExecutorInfo or (function()
    local name, version = "Desconocido", "N/A"

    if identifyexecutor then
        local result1, result2 = identifyexecutor()

        if typeof(result1) == "string" then
            name = result1
        end

        if typeof(result2) == "string" then
            version = result2
        else
            local ver = string.match(name, "%d+%.%d+%.?%d*")
            if ver then
                version = ver
                name = string.gsub(name, "%s*" .. ver, "")
            end
        end
    end

    return {
        Name    = name,
        Version = version
    }
end)()

D.GameInfo = D.GameInfo or {
    PlaceId = S.PlaceId,
    JobId = S.JobId,
    Name = "Cargando...",
}

D.ScriptInfo = D.ScriptInfo or {
    Nombre  = "Mystery Hub Rework",
    Version = "1.0.0",
    Autor = "Mystery",
    Discord = "discord.gg/mysteryhub",
}

-- Auto Rocks

D.rockList = D.rockList or {
    { name = "Tiny Island Rock", durability = 0 },
    { name = "Starter Island Rock", durability = 100 },
    { name = "Legend Beach Rock", durability = 5000 },
    { name = "Frost Gym Rock", durability = 150000 },
    { name = "Mythical Gym Rock", durability = 400000 },
    { name = "Eternal Gym Rock", durability = 750000 },
    { name = "Legend Gym Rock", durability = 1000000 },
    { name = "Muscle King Gym Rock", durability = 5000000 },
    { name = "Ancient Jungle Rock", durability = 10000000 },
    { name = "Industrial Rock", durability = 25000000 },
}

D.rockNames = {}
for _, rock in pairs(D.rockList) do
    table.insert(D.rockNames, rock.name)
end

V.SelectedRock = V.SelectedRock or ""
V.AutoRock = V.AutoRock or false
V.RockTime = V.RockTime or 0

----------------------
-- HELPERS (H)
----------------------

-- Tab Home

function H.GetPing()
    local ok, val = U.pcall_(function()
        return S.Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
    end)
    return ok and U.math_min(999, val) or 0
end

function H.FormatTime(seconds)
    local h = U.math_max(0, U.math_min(23, seconds // 3600))
    local m = (seconds % 3600) // 60
    local s = seconds % 60
    return U.string_format("%02d:%02d:%02d", h, m, s)
end

function H.UpdateHomeStats()
    St.Ping = H.GetPing()
    local playTime = math.floor(tick() - St.JoinTick)

    if R.StatsParagraph then
        R.StatsParagraph:SetValue(U.string_format(
            "Ping: %d ms\nFPS: %d\nTiempo jugado: %s",
            St.Ping, St.FPS, H.FormatTime(playTime)
        ))
    end
end

-- Tab Sistema Brawls

function H.IsLocalPlayerReady()
    local character = S.LP.Character
    return character
        and character:FindFirstChild("Humanoid")
        and character:FindFirstChild("HumanoidRootPart")
        and character.Humanoid.Health > 0
end

function H.IsValidBrawlTarget(player)
    if not player or player == S.LP then return false end
    local character = player.Character
    return character
        and character:FindFirstChild("HumanoidRootPart")
        and character:FindFirstChild("Humanoid")
        and character.Humanoid.Health > 0
end

function H.EquipPunch()
    pcall(function()
        local character = S.LP.Character
        if not character or not character:FindFirstChild("Humanoid") then return end

        local punchTool = S.LP.Backpack:FindFirstChild("Punch") or character:FindFirstChild("Punch")
        if punchTool and punchTool.Parent ~= character then
            character.Humanoid:EquipTool(punchTool)
        end

        if punchTool then
            pcall(function() punchTool:Activate() end)
        end

        pcall(function() S.LP.muscleEvent:FireServer("punch", "leftHand") end)
        pcall(function() S.LP.muscleEvent:FireServer("punch", "rightHand") end)
    end)
end

function H.TPToPlayer(player)
    pcall(function()
        local character = S.LP.Character
        local hrp = character and character:FindFirstChild("HumanoidRootPart")
        local targetRoot = player.Character and player.Character:FindFirstChild("HumanoidRootPart")

        if hrp and targetRoot then
            hrp.CFrame = targetRoot.CFrame * CFrame.new(0, 0, 2.5)
        end
    end)
end

-- Auto Rocks

function H.SafeTouchInterest(part, limb)
    if not part or not limb then return end
    pcall(function()
        firetouchinterest(limb, part, 0)
        task.wait()
        firetouchinterest(limb, part, 1)
    end)
end

function H.GetTool()
    local character = S.LP.Character
    if not character then return end

    local humanoid = character:FindFirstChild("Humanoid")
    local backpack = S.LP:FindFirstChild("Backpack")

    if humanoid and backpack then
        for _, v in pairs(backpack:GetChildren()) do
            if v.Name == "Punch" then
                humanoid:EquipTool(v)
            end
        end
    end

    pcall(function() S.LP.muscleEvent:FireServer("punch", "leftHand") end)
    pcall(function() S.LP.muscleEvent:FireServer("punch", "rightHand") end)
end

function H.FarmRock(character)
    if not character or not character.Parent then return end

    local leftHand = character:FindFirstChild("LeftHand")
    local rightHand = character:FindFirstChild("RightHand")
    if not leftHand or not rightHand then return end

    local durability = 0
    for _, rock in pairs(D.rockList) do
        if rock.name == V.SelectedRock then
            durability = rock.durability
            break
        end
    end

    local okDur, durValue = pcall(function() return S.LP.Durability.Value end)
    if not okDur or durValue < durability then return end

    local machinesFolder = workspace:FindFirstChild("machinesFolder")
    if not machinesFolder then return end

    for _, v in pairs(machinesFolder:GetDescendants()) do
        if v.Name == "neededDurability" and v.Value == durability then
            local rockPart = v.Parent and v.Parent:FindFirstChild("Rock")
            if rockPart then
                H.SafeTouchInterest(rockPart, rightHand)
                H.SafeTouchInterest(rockPart, leftHand)
                H.GetTool()
            end
        end
    end
end

if C.Idled then
    C.Idled:Disconnect()
end
C.Idled = S.LP.Idled:Connect(function()
    S.VirtualUser:CaptureController()
    S.VirtualUser:ClickButton2(Vector2.new())
end)

R.Window = Library:CreateWindow{
    Title = "Mystery Hub Rework",
    SubTitle = "Muscle Legends Version",
    Icon = "sparkles",
    TabWidth = 150,
    Size = UDim2.fromOffset(480, 300),
    Resize = false,
    MinSize = Vector2.new(380, 300),
    Acrylic = true,
    Theme = "Dark Purple",
    MinimizeKey = Enum.KeyCode.RightControl,

    AutoSave = true,
    ConfigFolder = "FluentRenewed",

    AI = {
        Enabled = true,
        Name = "Assistant",
        Key = "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",
        Model = "llama-3.3-70b-versatile"
    }
}

R.Tabs = {
    Main = R.Window:CreateTab{ Title = "Home", Icon = "house" },
    Farm = R.Window:CreateTab{ Title = "Farm", Icon = "cookie" },
    Packs = R.Window:CreateTab{ Title = "Packs", Icon = "coins" },
    Misc = R.Window:CreateTab{ Title = "Config", Icon = "folders" },
    Snacks = R.Window:CreateTab{ Title = "Snacks", Icon = "popcorn" },
    Stats = R.Window:CreateTab{ Title = "Stats", Icon = "users" },
    Killer = R.Window:CreateTab{ Title = "killer", Icon = "skull" },
    Calculator = R.Window:CreateTab{ Title = "Calcular", Icon = "calculator" },
    Teleport = R.Window:CreateTab{ Title = "Teleport", Icon = "map-pin" },
    Settings = R.Window:CreateTab{ Title = "Settings", Icon = "settings" },
}

R.Options = Library.Options

Library:Notify{
    Title = "Bienvenido a Mystery Hub",
    Content = "Esperemos te guste el script",
    SubContent = "Sugerencias o bugs a discord",
    Duration = 5
}

----------------------
-- TAB HOME
----------------------

R.PlayerInfoParagraph = R.Tabs.Main:CreateParagraph("PlayerInfoParagraph", {
    Title = "Jugador",
    Content = U.string_format(
        "Nombre: %s (@%s)\nUserId: %d\nCuenta creada hace: %d días",
        D.PlayerInfo.DisplayName,
        D.PlayerInfo.Name,
        D.PlayerInfo.UserId,
        D.PlayerInfo.AccountAge
    )
})

R.ExecutorParagraph = R.Tabs.Main:CreateParagraph("ExecutorParagraph", {
    Title = "Executor",
    Content = U.string_format(
        "Nombre: %s\nVersión: %s",
        D.ExecutorInfo.Name,
        D.ExecutorInfo.Version
    )
})

R.GameInfoParagraph = R.Tabs.Main:CreateParagraph("GameInfoParagraph", {
    Title = "Juego",
    Content = U.string_format(
        "PlaceId: %d\nJobId: %s\nNombre: %s",
        D.GameInfo.PlaceId,
        D.GameInfo.JobId,
        D.GameInfo.Name
    )
})

R.ScriptInfoParagraph = R.Tabs.Main:CreateParagraph("ScriptInfoParagraph", {
    Title = "Script",
    Content = U.string_format(
        "%s - v%s\nAutor: %s\nDiscord: %s",
        D.ScriptInfo.Nombre,
        D.ScriptInfo.Version,
        D.ScriptInfo.Autor,
        D.ScriptInfo.Discord
    )
})

R.StatsParagraph = R.Tabs.Main:CreateParagraph("StatsParagraph", {
    Title = "Rendimiento",
    Content = "Cargando..."
})

if C.FPSCounter then
    C.FPSCounter:Disconnect()
end
C.FPSCounter = S.Run.Heartbeat:Connect(function()
    St.FrameCount = St.FrameCount + 1
    if tick() - St.LastFPSCheck >= 1 then
        St.FPS = St.FrameCount
        St.FrameCount = 0
        St.LastFPSCheck = tick()
    end
end)

task.spawn(function()
    while myGen == MH.Gen do
        H.UpdateHomeStats()
        task.wait(1)
    end
end)

task.spawn(function()
    local ok, info = U.pcall_(function()
        return game:GetService("MarketplaceService"):GetProductInfo(S.PlaceId)
    end)
    if ok and info then
        D.GameInfo.Name = info.Name
        if R.GameInfoParagraph then
            R.GameInfoParagraph:SetValue(U.string_format(
                "PlaceId: %d\nJobId: %s\nNombre: %s",
                D.GameInfo.PlaceId,
                D.GameInfo.JobId,
                D.GameInfo.Name
            ))
        end
    end
end)

----------------------
-- TAB FARM
----------------------

R.BrawlsSystem = R.Tabs.Farm:CreateSection("Sistema de peleas")

R.AutoJoinBrawl = R.Tabs.Farm:CreateToggle("AutoJoinBrawl", {
    Title = "Unirse a peleas automaticamente",
    Description = "Te lleva a pelear sin necesidad de hacer click en el boton de unirse",
    Default = false,
    Callback = function(State)
        V.AutoJoinBrawl = State
        if not State then return end

        task.spawn(function()
            while V.AutoJoinBrawl and task.wait(0.5) do
                if not V.AutoJoinBrawl then break end
                pcall(function()
                    if S.LP.PlayerGui.gameGui.brawlJoinLabel.Visible then
                        S.RS.rEvents.brawlEvent:FireServer("joinBrawl")
                        S.LP.PlayerGui.gameGui.brawlJoinLabel.Visible = false
                    end
                end)
            end
        end)
    end,
})

R.AutoWinBrawl = R.Tabs.Farm:CreateToggle("AutoWinBrawl", {
    Title = "Ganar peleas automaticamente",
    Description = "Se une, se teletransporta a los enemigos y los mata con puños",
    Default = false,
    Callback = function(State)
        V.AutoWinBrawl = State
        if not State then return end

        task.spawn(function()
            while V.AutoWinBrawl and task.wait(0.5) do
                if not V.AutoWinBrawl then break end
                pcall(function()
                    if S.LP.PlayerGui.gameGui.brawlJoinLabel.Visible then
                        S.RS.rEvents.brawlEvent:FireServer("joinBrawl")
                        S.LP.PlayerGui.gameGui.brawlJoinLabel.Visible = false
                    end
                end)
            end
        end)

        task.spawn(function()
            while V.AutoWinBrawl and task.wait(0.4) do
                if not V.AutoWinBrawl then break end
                H.EquipPunch()
            end
        end)

        task.spawn(function()
            while V.AutoWinBrawl and task.wait(0.08) do
                if not V.AutoWinBrawl then break end

                if H.IsLocalPlayerReady() and S.RS:FindFirstChild("brawlInProgress") and S.RS.brawlInProgress.Value then
                    pcall(function() S.LP.muscleEvent:FireServer("punch", "rightHand") end)
                    pcall(function() S.LP.muscleEvent:FireServer("punch", "leftHand") end)
                end
            end
        end)

        task.spawn(function()
            while V.AutoWinBrawl and task.wait(0.12) do
                if not V.AutoWinBrawl then break end

                if H.IsLocalPlayerReady() and S.RS:FindFirstChild("brawlInProgress") and S.RS.brawlInProgress.Value then
                    for _, player in pairs(S.Players:GetPlayers()) do
                        if not V.AutoWinBrawl then break end

                        if H.IsValidBrawlTarget(player) then
                            H.TPToPlayer(player)
                            H.EquipPunch()
                            task.wait(0.03)
                        end
                    end
                end
            end
        end)

        task.spawn(function()
            local lastPlayerCount = 0
            local stuckCounter = 0

            while V.AutoWinBrawl and task.wait(1) do
                if not V.AutoWinBrawl then break end

                local currentPlayerCount = #S.Players:GetPlayers()

                if currentPlayerCount ~= lastPlayerCount then
                    stuckCounter = 0
                    lastPlayerCount = currentPlayerCount
                else
                    stuckCounter = stuckCounter + 1

                    if stuckCounter > 5 then
                        stuckCounter = 0
                        pcall(function()
                            local character = S.LP.Character
                            if character and character:FindFirstChild("Punch") then
                                character.Punch.Parent = S.LP.Backpack
                                task.wait(0.1)
                            end
                            H.EquipPunch()
                        end)
                    end
                end
            end
        end)
    end,
})

R.RocksSystem = R.Tabs.Farm:CreateSection("Golpear rocas")

R.RockCounter = R.Tabs.Farm:CreateParagraph("RockCounter", {
    Title = "Tiempo de farmeo",
    Content = "Tiempo: 00:00:00"
})

if C.RockTimerLoop then
    C.RockTimerLoop = nil
end
task.spawn(function()
    while myGen == MH.Gen do
        task.wait(1)
        if V.AutoRock then
            V.RockTime = V.RockTime + 1
        end
        if R.RockCounter then
            R.RockCounter:SetValue("Time: " .. H.FormatTime(V.RockTime))
        end
    end
end)

R.RockDropdown = R.Tabs.Farm:CreateDropdown("RockDropdown", {
    Title = "Selecciona una roca",
    Values = D.rockNames,
    Value = V.SelectedRock,
    Multi = false,
    AllowNone = true,
    SearchBarEnabled = true,
    Callback = function(val)
        V.SelectedRock = val
    end,
})

R.AutoRockToggle = R.Tabs.Farm:CreateToggle("AutoRockToggle", {
    Title = "Golpear Roca",
    Description = "Golpea las rocas automáticamente",
    Default = false,
    Callback = function(state)
        V.AutoRock = state

        if C.AutoRockCharConn then
            C.AutoRockCharConn:Disconnect()
            C.AutoRockCharConn = nil
        end

        if not state then return end

        local function runLoop(character)
            local humanoid = character:FindFirstChild("Humanoid")
            task.spawn(function()
                while V.AutoRock and character.Parent and humanoid and humanoid.Health > 0 do
                if V.SelectedRock and V.SelectedRock ~= "" then
                    H.FarmRock(character)
                end
                    task.wait()
                end
            end)
        end

        if S.LP.Character then
            runLoop(S.LP.Character)
        end

        C.AutoRockCharConn = S.LP.CharacterAdded:Connect(function(newCharacter)
            if V.AutoRock then
                task.wait(1)
                runLoop(newCharacter)
            end
        end)
    end,
})

R.RocksSystem = R.Tabs.Farm:CreateSection("Equipar herramientas")













Library.Config:BuildSection(R.Tabs.Settings)
Library.Config:SetIgnoreIndexes{}

InterfaceManager:SetLibrary(Library)
InterfaceManager:SetFolder("FluentScriptHub")
InterfaceManager:BuildInterfaceSection(R.Tabs.Settings)

R.Window:SelectTab(1)

Library:Notify{
    Title    = "Muscle Legends Version",
    Content  = "Script ejecutado correctamente",
    Duration = 8
}
