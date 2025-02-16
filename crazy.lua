-- Gui to Lua
-- Version: 3.2

-- Instances:

local DBFRAME = Instance.new("Frame")
local corner = Instance.new("UICorner")
local guiname = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local close = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local god = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")

--Properties:

DBFRAME.Name = "DBFRAME"
DBFRAME.Parent = game.StarterGui.DBMAIN
DBFRAME.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
DBFRAME.BackgroundTransparency = 0.100
DBFRAME.BorderColor3 = Color3.fromRGB(0, 0, 0)
DBFRAME.BorderSizePixel = 0
DBFRAME.Position = UDim2.new(0.380780339, 0, 0.371007383, 0)
DBFRAME.Size = UDim2.new(0, 330, 0, 209)

corner.CornerRadius = UDim.new(0, 12)
corner.Name = "corner"
corner.Parent = DBFRAME

guiname.Name = "guiname"
guiname.Parent = DBFRAME
guiname.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
guiname.BorderColor3 = Color3.fromRGB(0, 0, 0)
guiname.BorderSizePixel = 0
guiname.Position = UDim2.new(0.342424244, 0, 0.0334928222, 0)
guiname.Size = UDim2.new(0, 104, 0, 27)
guiname.Font = Enum.Font.Arcade
guiname.Text = "DB RAILS MENU"
guiname.TextColor3 = Color3.fromRGB(200, 200, 200)
guiname.TextSize = 12.000
guiname.TextWrapped = true

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = guiname

close.Name = "close"
close.Parent = DBFRAME
close.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
close.BorderColor3 = Color3.fromRGB(0, 0, 0)
close.BorderSizePixel = 0
close.Position = UDim2.new(0.839393914, 0, 0.0334928222, 0)
close.Size = UDim2.new(0, 46, 0, 27)
close.Font = Enum.Font.Unknown
close.Text = "X"
close.TextColor3 = Color3.fromRGB(200, 200, 200)
close.TextSize = 16.000

UICorner_2.CornerRadius = UDim.new(0, 10)
UICorner_2.Parent = close

god.Name = "god"
god.Parent = DBFRAME
god.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
god.BorderColor3 = Color3.fromRGB(0, 0, 0)
god.BorderSizePixel = 0
god.Position = UDim2.new(0.369696975, 0, 0.416267931, 0)
god.Size = UDim2.new(0, 85, 0, 35)
god.Font = Enum.Font.Unknown
god.Text = "GOD"
god.TextColor3 = Color3.fromRGB(200, 200, 200)
god.TextSize = 16.000

UICorner_3.CornerRadius = UDim.new(0, 10)
UICorner_3.Parent = god

-- Scripts:

local function VKVD_fake_script() -- DBFRAME.drag 
	local script = Instance.new('LocalScript', DBFRAME)

	local UIS = game:GetService("UserInputService")
	local Frame = script.Parent
	
	local dragging, dragInput, startPos, startMousePos
	
	Frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			startPos = Frame.Position
			startMousePos = input.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	UIS.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			local delta = input.Position - startMousePos
			Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
	
end
coroutine.wrap(VKVD_fake_script)()
local function AKNFM_fake_script() -- DBFRAME.drag 
	local script = Instance.new('LocalScript', DBFRAME)

	local UIS = game:GetService("UserInputService")
	local Frame = script.Parent
	
	local dragging, dragStart, startPos
	
	Frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = Frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	UIS.InputChanged:Connect(function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			local delta = input.Position - dragStart
			Frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		end
	end)
	
end
coroutine.wrap(AKNFM_fake_script)()
local function BBBYRC_fake_script() -- close.closeapp 
	local script = Instance.new('LocalScript', close)

	local button = script.Parent
	local gui = button.Parent.Parent -- Предполагается, что кнопка внутри Frame, а Frame внутри ScreenGui
	
	button.MouseButton1Click:Connect(function()	
		gui:Destroy()
	end)
	
end
coroutine.wrap(BBBYRC_fake_script)()
local function GFRMEVT_fake_script() -- god.godmode 
	local script = Instance.new('LocalScript', god)

	local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local button = script.Parent
	
	local player = Players.LocalPlayer
	local char = player.Character or player.CharacterAdded:Wait()
	local humanoid = char:FindFirstChildOfClass("Humanoid")
	
	local active = false
	
	-- **Функция активации GodMode**
	local function toggleGodMode()
		active = not active
	
		if active then
			-- Устанавливаем бесконечное здоровье
			humanoid.MaxHealth = math.huge
			humanoid.Health = math.huge
	
			-- Создаем объект защиты от урона (если он еще не создан)
			if not char:FindFirstChild("GodModeShield") then
				local shield = Instance.new("ForceField")
				shield.Name = "GodModeShield"
				shield.Parent = char
			end
		else
			-- Убираем GodMode
			humanoid.MaxHealth = 100
			humanoid.Health = 100
	
			-- Удаляем защиту
			local shield = char:FindFirstChild("GodModeShield")
			if shield then
				shield:Destroy()
			end
		end
	
		-- Изменение цвета кнопки
		button.TextColor3 = active and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(255, 50, 50) -- Зеленый если включено, красный если выключено
		button.BackgroundColor3 = active and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(40, 40, 40) -- Небольшое затемнение при активации
	end
	
	-- **Обработчик нажатия кнопки**
	button.MouseButton1Click:Connect(toggleGodMode)
	
end
coroutine.wrap(GFRMEVT_fake_script)()
