local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer

local CoreGui = game:GetService("CoreGui")

if CoreGui:FindFirstChild("MysteryPositionUI") then
    CoreGui.MysteryPositionUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MysteryPositionUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 260, 0, 185)
Main.Position = UDim2.new(0.5, -130, 0.5, -92)
Main.BackgroundColor3 = Color3.fromRGB(20, 16, 31)
Main.BorderSizePixel = 0
Main.Active = true
Main.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(135, 75, 220)
MainStroke.Thickness = 1.4
MainStroke.Parent = Main

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 42)
Header.BackgroundColor3 = Color3.fromRGB(91, 49, 155)
Header.BorderSizePixel = 0
Header.Active = true
Header.Parent = Main

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 12)
HeaderCorner.Parent = Header

local HeaderCover = Instance.new("Frame")
HeaderCover.Size = UDim2.new(1, 0, 0, 12)
HeaderCover.Position = UDim2.new(0, 0, 1, -12)
HeaderCover.BackgroundColor3 = Header.BackgroundColor3
HeaderCover.BorderSizePixel = 0
HeaderCover.Parent = Header

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -85, 1, 0)
Title.Position = UDim2.new(0, 13, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "MYSTERY HUB"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local HideButton = Instance.new("TextButton")
HideButton.Size = UDim2.new(0, 28, 0, 28)
HideButton.Position = UDim2.new(1, -68, 0, 7)
HideButton.BackgroundColor3 = Color3.fromRGB(120, 75, 190)
HideButton.Text = "—"
HideButton.TextColor3 = Color3.new(1,1,1)
HideButton.Font = Enum.Font.GothamBold
HideButton.TextSize = 16
HideButton.Parent = Header

local HideCorner = Instance.new("UICorner")
HideCorner.CornerRadius = UDim.new(0, 7)
HideCorner.Parent = HideButton

local DestroyButton = Instance.new("TextButton")
DestroyButton.Size = UDim2.new(0, 28, 0, 28)
DestroyButton.Position = UDim2.new(1, -35, 0, 7)
DestroyButton.BackgroundColor3 = Color3.fromRGB(160, 55, 90)
DestroyButton.Text = "X"
DestroyButton.TextColor3 = Color3.new(1,1,1)
DestroyButton.Font = Enum.Font.GothamBold
DestroyButton.TextSize = 12
DestroyButton.Parent = Header

local DestroyCorner = Instance.new("UICorner")
DestroyCorner.CornerRadius = UDim.new(0, 7)
DestroyCorner.Parent = DestroyButton

local Container = Instance.new("Frame")
Container.Size = UDim2.new(1, -20, 0, 85)
Container.Position = UDim2.new(0, 10, 0, 52)
Container.BackgroundColor3 = Color3.fromRGB(32, 25, 47)
Container.BorderSizePixel = 0
Container.Parent = Main

local ContainerCorner = Instance.new("UICorner")
ContainerCorner.CornerRadius = UDim.new(0, 9)
ContainerCorner.Parent = Container

local PositionText = Instance.new("TextLabel")
PositionText.Size = UDim2.new(1, -20, 1, 0)
PositionText.Position = UDim2.new(0, 10, 0, 0)
PositionText.BackgroundTransparency = 1
PositionText.Text = "X: 0.00\nY: 0.00\nZ: 0.00"
PositionText.TextColor3 = Color3.fromRGB(225, 215, 245)
PositionText.Font = Enum.Font.GothamMedium
PositionText.TextSize = 14
PositionText.TextXAlignment = Enum.TextXAlignment.Left
PositionText.Parent = Container

local CopyButton = Instance.new("TextButton")
CopyButton.Size = UDim2.new(1, -20, 0, 30)
CopyButton.Position = UDim2.new(0, 10, 1, -38)
CopyButton.BackgroundColor3 = Color3.fromRGB(112, 65, 185)
CopyButton.Text = "COPY POSITION"
CopyButton.TextColor3 = Color3.new(1,1,1)
CopyButton.Font = Enum.Font.GothamBold
CopyButton.TextSize = 11
CopyButton.Parent = Main

local CopyCorner = Instance.new("UICorner")
CopyCorner.CornerRadius = UDim.new(0, 8)
CopyCorner.Parent = CopyButton

local dragging = false
local dragInput
local dragStart
local startPosition

local function UpdateDrag(input)
    local delta = input.Position - dragStart

    Main.Position = UDim2.new(
        startPosition.X.Scale,
        startPosition.X.Offset + delta.X,
        startPosition.Y.Scale,
        startPosition.Y.Offset + delta.Y
    )
end

Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then

        dragging = true
        dragStart = input.Position
        startPosition = Main.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Header.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement
    or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.MouseMovement
        or input == dragInput
    ) then
        UpdateDrag(input)
    end
end)

local MiniButton = Instance.new("TextButton")
MiniButton.Size = UDim2.new(0, 42, 0, 42)
MiniButton.Position = UDim2.new(0.5, -21, 0.5, -21)
MiniButton.BackgroundColor3 = Color3.fromRGB(91, 49, 155)
MiniButton.Text = "+"
MiniButton.TextColor3 = Color3.new(1,1,1)
MiniButton.TextSize = 23
MiniButton.Font = Enum.Font.GothamBold
MiniButton.Visible = false
MiniButton.Parent = ScreenGui

local MiniCorner = Instance.new("UICorner")
MiniCorner.CornerRadius = UDim.new(1, 0)
MiniCorner.Parent = MiniButton

local MiniStroke = Instance.new("UIStroke")
MiniStroke.Color = Color3.fromRGB(165, 105, 245)
MiniStroke.Thickness = 1.5
MiniStroke.Parent = MiniButton

local miniDragging = false
local miniStart
local miniPosition

MiniButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then

        miniDragging = true
        miniStart = input.Position
        miniPosition = MiniButton.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                miniDragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if miniDragging and (
        input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch
    ) then
        local delta = input.Position - miniStart
        MiniButton.Position = UDim2.new(
            miniPosition.X.Scale,
            miniPosition.X.Offset + delta.X,
            miniPosition.Y.Scale,
            miniPosition.Y.Offset + delta.Y
        )
    end
end)

HideButton.MouseButton1Click:Connect(function()
    Main.Visible = false
    MiniButton.Visible = true
end)

MiniButton.MouseButton1Click:Connect(function()
    Main.Visible = true
    MiniButton.Visible = false
end)

local currentPosition = Vector3.zero

local Connection = RunService.RenderStepped:Connect(function()
    local Character = Player.Character
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
        PositionText.Text = "Waiting for character..."
    end
end)

CopyButton.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(string.format(
            "Vector3.new(%.3f, %.3f, %.3f)",
            currentPosition.X,
            currentPosition.Y,
            currentPosition.Z
        ))

        CopyButton.Text = "COPIED!"

        task.delay(1.2, function()
            if CopyButton.Parent then
                CopyButton.Text = "COPY POSITION"
            end
        end)
    else
        CopyButton.Text = "NOT SUPPORTED"
        task.delay(1.2, function()
            if CopyButton.Parent then
                CopyButton.Text = "COPY POSITION"
            end
        end)
    end
end)

DestroyButton.MouseButton1Click:Connect(function()
    Connection:Disconnect()
    ScreenGui:Destroy()
end)
