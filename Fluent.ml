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
MH.S.Camera = workspace.CurrentCamera
MH.S.JobId = game.JobId
MH.S.PlaceId = game.PlaceId

MH.V = MH.V or {

}

MH.T = MH.T or {

}

MH.C = MH.C or {

}

MH.St = MH.St or {
    Ping = 0,
    FPS = 0,
    FrameCount = 0,
    LastFPSCheck = tick(),
    JoinTick = tick(),
}

MH.D = MH.D or {

}

MH.H = MH.H or {}

local S = MH.S
local V = MH.V
local D = MH.D
local T = MH.T
local C = MH.C
local H = MH.H
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

D.PlayerInfo = D.PlayerInfo or {
    Name = S.LP.Name,
    DisplayName = S.LP.DisplayName,
    UserId = S.LP.UserId,
    AccountAge = S.LP.AccountAge,
}

D.ExecutorInfo = D.ExecutorInfo or {
    Name = (identifyexecutor and identifyexecutor()) or "Desconocido",
    Version = (getexecutorname and getexecutorname()) or "N/A",
}

D.GameInfo = D.GameInfo or {
    PlaceId = S.PlaceId,
    JobId = S.JobId,
    Name = "Cargando...",
}

D.ScriptInfo = D.ScriptInfo or {
    Nombre = "Mystery Hub Rework",
    Version = "1.0.0",
    Autor = "Grupo Misterioso",
    Discord = "discord.gg/mysteryhub",
}

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
    Size = UDim2.fromOffset(480, 360),
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
-- Tab Home
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
        "%s | v%s\nAutor: %s\nDiscord: %s",
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
-- Tab Farm
----------------------

Library.Config:BuildSection(R.Tabs.Settings)
Library.Config:SetIgnoreIndexes{}

InterfaceManager:SetLibrary(Library)
InterfaceManager:SetFolder("FluentScriptHub")
InterfaceManager:BuildInterfaceSection(R.Tabs.Settings)

R.Window:SelectTab(1)

Library:Notify{
    Title = "Muscle Legends Version",
    Content = "Script ejecutado correctamente",
    Duration = 8
}
