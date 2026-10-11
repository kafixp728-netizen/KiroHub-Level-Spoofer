-- =======================================================
-- RIVALS VISUAL LEVEL SPOOFER (UPDATED)
-- Key: Gemini
-- =======================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Configuration
local DESIRED_LEVEL = "level"
local SpoofEnabled = false

-- -------------------------------------------------------
-- GUI CREATION
-- -------------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RivalsSpooferRemade"
ScreenGui.ResetOnSpawn = false

-- Parent GUI to CoreGui or PlayerGui
local success, _ = pcall(function()
    ScreenGui.Parent = CoreGui
end)
if not success then
    ScreenGui.Parent = PlayerGui
end

-- Main Window Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 340, 0, 220)
MainFrame.Position = UDim2.new(0.5, -170, 0.4, -110)
MainFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 24)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(0, 255, 170)
MainStroke.Thickness = 2
MainStroke.Parent = MainFrame

-- Header Title
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 45)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "⚡ RIVALS SPOOFER (REMADE) ⚡"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 15
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Parent = MainFrame

-- Key Section Frame
local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(1, -30, 1, -55)
KeyFrame.Position = UDim2.new(0, 15, 0, 45)
KeyFrame.BackgroundTransparency = 1
KeyFrame.Parent = MainFrame

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(1, 0, 0, 40)
KeyInput.Position = UDim2.new(0, 0, 0, 10)
KeyInput.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
KeyInput.PlaceholderText = "Enter Key (Gemini)..."
KeyInput.PlaceholderColor3 = Color3.fromRGB(120, 120, 140)
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Font = Enum.Font.Gotham
KeyInput.TextSize = 14
KeyInput.Parent = KeyFrame

local KeyCorner = Instance.new("UICorner")
KeyCorner.CornerRadius = UDim.new(0, 8)
KeyCorner.Parent = KeyInput

local SubmitKeyBtn = Instance.new("TextButton")
SubmitKeyBtn.Size = UDim2.new(1, 0, 0, 40)
SubmitKeyBtn.Position = UDim2.new(0, 0, 0, 60)
SubmitKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 170)
SubmitKeyBtn.Text = "UNLOCK SPOOFER"
SubmitKeyBtn.TextColor3 = Color3.fromRGB(18, 18, 24)
SubmitKeyBtn.Font = Enum.Font.GothamBold
SubmitKeyBtn.TextSize = 14
SubmitKeyBtn.Parent = KeyFrame

local SubmitCorner = Instance.new("UICorner")
SubmitCorner.CornerRadius = UDim.new(0, 8)
SubmitCorner.Parent = SubmitKeyBtn

-- Spoofer Section Frame
local SpooferFrame = Instance.new("Frame")
SpooferFrame.Size = UDim2.new(1, -30, 1, -55)
SpooferFrame.Position = UDim2.new(0, 15, 0, 45)
SpooferFrame.BackgroundTransparency = 1
SpooferFrame.Visible = false
SpooferFrame.Parent = MainFrame

local LevelInput = Instance.new("TextBox")
LevelInput.Size = UDim2.new(1, 0, 0, 40)
LevelInput.Position = UDim2.new(0, 0, 0, 10)
LevelInput.BackgroundColor3 = Color3.fromRGB(28, 28, 38)
LevelInput.Text = DESIRED_LEVEL
LevelInput.TextColor3 = Color3.fromRGB(0, 255, 170)
LevelInput.Font = Enum.Font.GothamBold
LevelInput.TextSize = 15
LevelInput.Parent = SpooferFrame

local LevelCorner = Instance.new("UICorner")
LevelCorner.CornerRadius = UDim.new(0, 8)
LevelCorner.Parent = LevelInput

local ApplyBtn = Instance.new("TextButton")
ApplyBtn.Size = UDim2.new(1, 0, 0, 40)
ApplyBtn.Position = UDim2.new(0, 0, 0, 60)
ApplyBtn.BackgroundColor3 = Color3.fromRGB(90, 105, 255)
ApplyBtn.Text = "ENABLE LEVEL SPOOF"
ApplyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ApplyBtn.Font = Enum.Font.GothamBold
ApplyBtn.TextSize = 14
ApplyBtn.Parent = SpooferFrame

local ApplyCorner = Instance.new("UICorner")
ApplyCorner.CornerRadius = UDim.new(0, 8)
ApplyCorner.Parent = ApplyBtn

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, 0, 0, 20)
StatusLabel.Position = UDim2.new(0, 0, 0, 110)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Status: Locked"
StatusLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 11
StatusLabel.Parent = MainFrame

-- -------------------------------------------------------
-- SPOOFER ENGINE
-- -------------------------------------------------------
local function runSpooferEngine()
    if not SpoofEnabled then return end
    
    for _, guiElement in pairs(PlayerGui:GetDescendants()) do
        if guiElement:IsA("TextLabel") or guiElement:IsA("TextBox") then
            local text = guiElement.Text
            local name = guiElement.Name:lower()
            
            -- Detect level labels using lowercase text:find("level")
            if text:find("Lvl") or text:find("LVL") or text:find("level") or name:find("level") or name:find("lvl") then
                guiElement.Text = DESIRED_LEVEL
            end
        end
    end
end

-- -------------------------------------------------------
-- CONTROLLER LOGIC
-- -------------------------------------------------------
SubmitKeyBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == "Gemini" then
        KeyFrame.Visible = false
        SpooferFrame.Visible = true
        StatusLabel.Text = "Status: Authorized! Press Enable to spoof."
        StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 170)
    else
        StatusLabel.Text = "Status: Invalid Key! Try again."
        StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
        KeyInput.Text = ""
    end
end)

ApplyBtn.MouseButton1Click:Connect(function()
    if LevelInput.Text ~= "" then
        DESIRED_LEVEL = LevelInput.Text
        SpoofEnabled = true
        runSpooferEngine()
        
        StatusLabel.Text = "Status: ACTIVE (Set to '" .. DESIRED_LEVEL .. "')"
        StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 170)
    end
end)

-- RenderStepped connection locks the visual text every frame
RunService.RenderStepped:Connect(function()
    if SpoofEnabled then
        runSpooferEngine()
    end
end)

print("[Rivals Spoofer Remade] Loaded successfully!")
