local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MysteryPositionUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 230, 0, 155)
Main.Position = UDim2.new(0.5, -115, 0.5, -77)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 32)
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 8)
Corner.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 32)
Title.BackgroundColor3 = Color3.fromRGB(105, 65, 190)
Title.Text = "Mystery Hub | Position"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 13
Title.Parent = Main

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = Title

local PositionText = Instance.new("TextLabel")
PositionText.Position = UDim2.new(0, 10, 0, 42)
PositionText.Size = UDim2.new(1, -20, 0, 65)
PositionText.BackgroundTransparency = 1
PositionText.TextColor3 = Color3.fromRGB(220, 220, 230)
PositionText.Font = Enum.Font.Code
PositionText.TextSize = 14
PositionText.TextXAlignment = Enum.TextXAlignment.Left
PositionText.TextYAlignment = Enum.TextYAlignment.Center
PositionText.Text = "X: 0\nY: 0\nZ: 0"
PositionText.Parent = Main

local CopyButton = Instance.new("TextButton")
CopyButton.Position = UDim2.new(0, 10, 1, -38)
CopyButton.Size = UDim2.new(1, -20, 0, 28)
CopyButton.BackgroundColor3 = Color3.fromRGB(105, 65, 190)
CopyButton.Text = "Copy Position"
CopyButton.TextColor3 = Color3.new(1, 1, 1)
CopyButton.Font = Enum.Font.GothamBold
CopyButton.TextSize = 12
CopyButton.Parent = Main

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 6)
ButtonCorner.Parent = CopyButton

local currentPosition = Vector3.zero

local function UpdatePosition()
    local Character = LocalPlayer.Character
    local Root = Character and Character:FindFirstChild("HumanoidRootPart")

    if Root then
        currentPosition = Root.Position

        PositionText.Text = string.format(
            "X: %.2f\nY: %.2f\nZ: %.2f",
            currentPosition.X,
            currentPosition.Y,
            currentPosition.Z
        )
    else
        PositionText.Text = "Esperando personaje..."
    end
end

local Connection = RunService.Heartbeat:Connect(UpdatePosition)

CopyButton.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(string.format(
            "Vector3.new(%.2f, %.2f, %.2f)",
            currentPosition.X,
            currentPosition.Y,
            currentPosition.Z
        ))

        CopyButton.Text = "Copied!"
        task.wait(1)
        CopyButton.Text = "Copy Position"
    end
end)

ScreenGui.Destroying:Connect(function()
    Connection:Disconnect()
end)
