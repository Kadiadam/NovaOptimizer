local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

--==================================================
-- ScreenGui
--==================================================

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "NovaOptimizer"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = playerGui


--==================================================
-- الزر الصغير
--==================================================

local Button = Instance.new("TextButton")
Button.Name = "NovaButton"
Button.Size = UDim2.new(0, 55, 0, 55)
Button.Position = UDim2.new(0, 20, 0.5, -27)
Button.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
Button.Text = "N"
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.TextSize = 24
Button.Font = Enum.Font.GothamBold
Button.AutoButtonColor = true
Button.Parent = ScreenGui

local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(1, 0)
ButtonCorner.Parent = Button


--==================================================
-- القائمة الرئيسية
--==================================================

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 320, 0, 300)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 27)
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame


--==================================================
-- العنوان
--==================================================

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -55, 0, 45)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "NOVA OPTIMIZER"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = MainFrame


--==================================================
-- زر الإغلاق
--==================================================

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Position = UDim2.new(1, -45, 0, 2)
CloseButton.BackgroundTransparency = 1
CloseButton.Text = "×"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 26
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Parent = MainFrame


--==================================================
-- خط فاصل
--==================================================

local Divider = Instance.new("Frame")
Divider.Size = UDim2.new(1, -20, 0, 1)
Divider.Position = UDim2.new(0, 10, 0, 45)
Divider.BackgroundColor3 = Color3.fromRGB(55, 55, 60)
Divider.BorderSizePixel = 0
Divider.Parent = MainFrame


--==================================================
-- FPS Counter
--==================================================

local FPSToggle = Instance.new("TextButton")
FPSToggle.Name = "FPSToggle"
FPSToggle.Size = UDim2.new(1, -30, 0, 42)
FPSToggle.Position = UDim2.new(0, 15, 0, 60)
FPSToggle.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
FPSToggle.Text = "📊 FPS Counter     [ OFF ]"
FPSToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
FPSToggle.TextSize = 14
FPSToggle.Font = Enum.Font.GothamBold
FPSToggle.Parent = MainFrame

local FPSButtonCorner = Instance.new("UICorner")
FPSButtonCorner.CornerRadius = UDim.new(0, 8)
FPSButtonCorner.Parent = FPSToggle


--==================================================
-- عداد FPS أعلى الشاشة
--==================================================

local FPSLabel = Instance.new("TextLabel")
FPSLabel.Name = "FPSCounter"
FPSLabel.Size = UDim2.new(0, 160, 0, 40)
FPSLabel.Position = UDim2.new(0.5, -80, 0, 10)
FPSLabel.BackgroundTransparency = 1
FPSLabel.Text = "FPS: 0"
FPSLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
FPSLabel.TextSize = 22
FPSLabel.Font = Enum.Font.GothamBold
FPSLabel.Visible = false
FPSLabel.Parent = ScreenGui


--==================================================
-- إنشاء أزرار الـ Optimizer
--==================================================

local function CreateToggle(name, text, yPosition)

    local Toggle = Instance.new("TextButton")

    Toggle.Name = name
    Toggle.Size = UDim2.new(1, -30, 0, 42)
    Toggle.Position = UDim2.new(0, 15, 0, yPosition)

    Toggle.BackgroundColor3 = Color3.fromRGB(35, 35, 42)

    Toggle.Text = text .. "     [ OFF ]"
    Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)

    Toggle.TextSize = 14
    Toggle.Font = Enum.Font.GothamBold

    Toggle.Parent = MainFrame

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 8)
    Corner.Parent = Toggle

    return Toggle
end


local FPSBoost = CreateToggle(
    "FPSBoost",
    "🚀 FPS Boost",
    110
)

local NoShadows = CreateToggle(
    "NoShadows",
    "🌑 No Shadows",
    160
)

local NoEffects = CreateToggle(
    "NoEffects",
    "✨ No Effects",
    210
)

local LowGraphics = CreateToggle(
    "LowGraphics",
    "🎨 Low Graphics",
    260
)


--==================================================
-- FPS Counter System
--==================================================

local FPSRunning = false
local Frames = 0
local LastTime = tick()

RunService.RenderStepped:Connect(function()

    if not FPSRunning then
        return
    end

    Frames += 1

    local CurrentTime = tick()

    if CurrentTime - LastTime >= 1 then

        FPSLabel.Text = "FPS: " .. Frames

        Frames = 0
        LastTime = CurrentTime

    end

end)


--==================================================
-- FPS Counter Toggle
--==================================================

FPSToggle.MouseButton1Click:Connect(function()

    FPSRunning = not FPSRunning

    if FPSRunning then

        FPSToggle.Text = "📊 FPS Counter     [ ON ]"
        FPSLabel.Visible = true

    else

        FPSToggle.Text = "📊 FPS Counter     [ OFF ]"
        FPSLabel.Visible = false

    end

end)


--==================================================
-- FPS Boost
--==================================================

local FPSBoostEnabled = false

FPSBoost.MouseButton1Click:Connect(function()

    FPSBoostEnabled = not FPSBoostEnabled

    if FPSBoostEnabled then

        FPSBoost.Text = "🚀 FPS Boost       [ ON ]"

        -- تقليل جودة الرسوم المحلية
        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        end)

    else

        FPSBoost.Text = "🚀 FPS Boost       [ OFF ]"

    end

end)


--==================================================
-- No Shadows
--==================================================

local NoShadowsEnabled = false

NoShadows.MouseButton1Click:Connect(function()

    NoShadowsEnabled = not NoShadowsEnabled

    if NoShadowsEnabled then

        NoShadows.Text = "🌑 No Shadows      [ ON ]"

        Lighting.GlobalShadows = false

    else

        NoShadows.Text = "🌑 No Shadows      [ OFF ]"

        Lighting.GlobalShadows = true

    end

end)


--==================================================
-- No Effects
--==================================================

local NoEffectsEnabled = false

NoEffects.MouseButton1Click:Connect(function()

    NoEffectsEnabled = not NoEffectsEnabled

    if NoEffectsEnabled then

        NoEffects.Text = "✨ No Effects       [ ON ]"

        for _, object in ipairs(Lighting:GetChildren()) do

            if object:IsA("BloomEffect")
                or object:IsA("BlurEffect")
                or object:IsA("ColorCorrectionEffect")
                or object:IsA("SunRaysEffect")
                or object:IsA("DepthOfFieldEffect") then

                object.Enabled = false

            end

        end

    else

        NoEffects.Text = "✨ No Effects       [ OFF ]"

        for _, object in ipairs(Lighting:GetChildren()) do

            if object:IsA("BloomEffect")
                or object:IsA("BlurEffect")
                or object:IsA("ColorCorrectionEffect")
                or object:IsA("SunRaysEffect")
                or object:IsA("DepthOfFieldEffect") then

                object.Enabled = true

            end

        end

    end

end)


--==================================================
-- Low Graphics
--==================================================

local LowGraphicsEnabled = false

LowGraphics.MouseButton1Click:Connect(function()

    LowGraphicsEnabled = not LowGraphicsEnabled

    if LowGraphicsEnabled then

        LowGraphics.Text = "🎨 Low Graphics    [ ON ]"

        pcall(function()
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        end)

    else

        LowGraphics.Text = "🎨 Low Graphics    [ OFF ]"

    end

end)


--==================================================
-- فتح القائمة
--==================================================

Button.MouseButton1Click:Connect(function()

    MainFrame.Visible = true
    Button.Visible = false

end)


--==================================================
-- إغلاق القائمة
--==================================================

CloseButton.MouseButton1Click:Connect(function()

    MainFrame.Visible = false
    Button.Visible = true

end)


--==================================================
-- سحب زر N
--==================================================

local dragging = false
local dragStart
local startPosition

Button.InputBegan:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        dragging = true

        dragStart = input.Position
        startPosition = Button.Position

    end

end)


UserInputService.InputChanged:Connect(function(input)

    if dragging and (
        input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch
    ) then

        local delta = input.Position - dragStart

        Button.Position = UDim2.new(
            startPosition.X.Scale,
            startPosition.X.Offset + delta.X,

            startPosition.Y.Scale,
            startPosition.Y.Offset + delta.Y
        )

    end

end)


UserInputService.InputEnded:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        dragging = false

    end

end)