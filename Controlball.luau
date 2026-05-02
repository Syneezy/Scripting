local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera
local ball = workspace:WaitForChild("Football")
local coreGui = game:GetService("CoreGui")

-- Create main UI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "BallControlUI"
screenGui.Parent = coreGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Enabled = false

-- Create show/hide toggle button
local toggleButton = Instance.new("TextButton")
toggleButton.Name = "ToggleButton"
toggleButton.Size = UDim2.new(0, 60, 0, 60)
toggleButton.Position = UDim2.new(1, -20, 0.5, -30)
toggleButton.AnchorPoint = Vector2.new(1, 0.5)
toggleButton.BackgroundColor3 = Color3.fromRGB(0, 180, 216)
toggleButton.BorderSizePixel = 0
toggleButton.Text = "⚽"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.GothamBold
toggleButton.TextSize = 28
toggleButton.Parent = screenGui

local toggleCorner = Instance.new("UICorner")
toggleCorner.CornerRadius = UDim.new(1, 0)
toggleCorner.Parent = toggleButton

local toggleStroke = Instance.new("UIStroke")
toggleStroke.Color = Color3.fromRGB(255, 255, 255)
toggleStroke.Transparency = 0.5
toggleStroke.Thickness = 2
toggleStroke.Parent = toggleButton

-- Create modern container with rounded corners
local mainContainer = Instance.new("Frame")
mainContainer.Name = "MainContainer"
mainContainer.Size = UDim2.new(0, 320, 0, 200)
mainContainer.Position = UDim2.new(1, -20, 0.5, -100)
mainContainer.AnchorPoint = Vector2.new(1, 0.5)
mainContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
mainContainer.BackgroundTransparency = 0.15
mainContainer.BorderSizePixel = 0
mainContainer.Visible = false
mainContainer.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 16)
corner.Parent = mainContainer

local shadow = Instance.new("UIStroke")
shadow.Color = Color3.fromRGB(0, 0, 0)
shadow.Transparency = 0.6
shadow.Thickness = 2
shadow.Parent = mainContainer

-- Title bar
local titleBar = Instance.new("Frame")
titleBar.Name = "TitleBar"
titleBar.Size = UDim2.new(1, 0, 0, 45)
titleBar.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
titleBar.BackgroundTransparency = 0.3
titleBar.BorderSizePixel = 0
titleBar.Parent = mainContainer

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 16)
titleCorner.Parent = titleBar

-- Close button
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0.5, -15)
closeButton.AnchorPoint = Vector2.new(0, 0.5)
closeButton.BackgroundColor3 = Color3.fromRGB(231, 76, 60)
closeButton.BorderSizePixel = 0
closeButton.Text = "✕"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 16
closeButton.Parent = titleBar

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(1, 0)
closeCorner.Parent = closeButton

-- Title text
local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, -60, 1, 0)
titleText.Position = UDim2.new(0, 20, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "⚽ Ball Controller"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.Font = Enum.Font.GothamBold
titleText.TextSize = 18
titleText.TextXAlignment = Enum.TextXAlignment.Left
titleText.Parent = titleBar

-- Control button
local controlButton = Instance.new("TextButton")
controlButton.Name = "ControlButton"
controlButton.Size = UDim2.new(1, -30, 0, 55)
controlButton.Position = UDim2.new(0, 15, 0, 60)
controlButton.BackgroundColor3 = Color3.fromRGB(0, 180, 216)
controlButton.BorderSizePixel = 0
controlButton.Text = "TAKE CONTROL"
controlButton.TextColor3 = Color3.fromRGB(255, 255, 255)
controlButton.Font = Enum.Font.GothamBold
controlButton.TextSize = 16
controlButton.Parent = mainContainer

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 12)
buttonCorner.Parent = controlButton

-- Speed control
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(0.45, 0, 0, 30)
speedLabel.Position = UDim2.new(0, 15, 0, 130)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "SPEED: 50"
speedLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
speedLabel.Font = Enum.Font.GothamMedium
speedLabel.TextSize = 14
speedLabel.TextXAlignment = Enum.TextXAlignment.Left
speedLabel.Parent = mainContainer

-- Speed buttons
local minusButton = Instance.new("TextButton")
minusButton.Size = UDim2.new(0, 35, 0, 35)
minusButton.Position = UDim2.new(0.55, 0, 0, 128)
minusButton.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
minusButton.BorderSizePixel = 0
minusButton.Text = "-"
minusButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minusButton.Font = Enum.Font.GothamBold
minusButton.TextSize = 20
minusButton.Parent = mainContainer

local minusCorner = Instance.new("UICorner")
minusCorner.CornerRadius = UDim.new(0, 8)
minusCorner.Parent = minusButton

local plusButton = Instance.new("TextButton")
plusButton.Size = UDim2.new(0, 35, 0, 35)
plusButton.Position = UDim2.new(0.85, -15, 0, 128)
plusButton.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
plusButton.BorderSizePixel = 0
plusButton.Text = "+"
plusButton.TextColor3 = Color3.fromRGB(255, 255, 255)
plusButton.Font = Enum.Font.GothamBold
plusButton.TextSize = 20
plusButton.Parent = mainContainer

local plusCorner = Instance.new("UICorner")
plusCorner.CornerRadius = UDim.new(0, 8)
plusCorner.Parent = plusButton

-- State variables
local controlling = false
local speed = 50

-- Camera rotation variables
local cameraYaw = 0
local cameraPitch = math.rad(-20) -- slight downward angle
local cameraDistance = 15
local isRotating = false
local lastTouchPosition = Vector2.new()

-- Helper: detect mobile/touch
local function isMobile()
	return UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
end

-- Show/Hide GUI functions
local function showGUI()
	mainContainer.Visible = true
	toggleButton.Visible = false
end

local function hideGUI()
	mainContainer.Visible = false
	toggleButton.Visible = true
end

-- Toggle button click
toggleButton.MouseButton1Click:Connect(function()
	showGUI()
end)

-- Close button click
closeButton.MouseButton1Click:Connect(function()
	hideGUI()
end)

-- Update control button appearance
local function updateControlButton()
	if controlling then
		controlButton.Text = "STOP CONTROL"
		controlButton.BackgroundColor3 = Color3.fromRGB(231, 76, 60)
		toggleButton.Visible = false
	else
		controlButton.Text = "TAKE CONTROL"
		controlButton.BackgroundColor3 = Color3.fromRGB(0, 180, 216)
		if not mainContainer.Visible then
			toggleButton.Visible = true
		end
	end
end

-- Update speed display
local function updateSpeedDisplay()
	speedLabel.Text = "SPEED: " .. math.floor(speed)
end

-- Control button click
controlButton.MouseButton1Click:Connect(function()
	controlling = not controlling
	updateControlButton()
end)

-- Speed adjustment
minusButton.MouseButton1Click:Connect(function()
	speed = math.max(10, speed - 10)
	updateSpeedDisplay()
end)

plusButton.MouseButton1Click:Connect(function()
	speed = math.min(200, speed + 10)
	updateSpeedDisplay()
end)

-- Camera rotation input handlers
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	
	if input.UserInputType == Enum.UserInputType.Touch and controlling then
		isRotating = true
		lastTouchPosition = input.Position
	elseif input.UserInputType == Enum.UserInputType.MouseButton2 and controlling then
		isRotating = true
		lastTouchPosition = input.Position
	end
end)

UserInputService.InputChanged:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	
	if isRotating and controlling then
		local delta = input.Position - lastTouchPosition
		
		if input.UserInputType == Enum.UserInputType.Touch then
			-- Mobile swipe for camera rotation
			local sensitivity = 0.005
			cameraYaw = cameraYaw - delta.X * sensitivity
			cameraPitch = math.clamp(cameraPitch - delta.Y * sensitivity, math.rad(-80), math.rad(80))
			lastTouchPosition = input.Position
		elseif input.UserInputType == Enum.UserInputType.MouseMovement then
			-- Desktop right-click drag for camera rotation
			local sensitivity = 0.003
			cameraYaw = cameraYaw - delta.X * sensitivity
			cameraPitch = math.clamp(cameraPitch - delta.Y * sensitivity, math.rad(-80), math.rad(80))
			lastTouchPosition = input.Position
		end
	end
	
	-- Mouse wheel for camera distance (desktop only)
	if input.UserInputType == Enum.UserInputType.MouseWheel and controlling then
		cameraDistance = math.clamp(cameraDistance - input.Position.Z * 0.5, 5, 30)
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch or 
	   input.UserInputType == Enum.UserInputType.MouseButton2 then
		isRotating = false
	end
end)

-- Initialize camera yaw based on current camera position
local function initializeCameraAngles()
	local ballPos = ball.Position
	local camPos = camera.CFrame.Position
	local direction = (camPos - ballPos).Unit
	cameraYaw = math.atan2(direction.X, direction.Z)
	cameraPitch = math.asin(-direction.Y)
	cameraDistance = (camPos - ballPos).Magnitude
end

-- Initialize toggle button
toggleButton.Visible = true
screenGui.Enabled = true

-- Initialize camera when ball is found
initializeCameraAngles()

-- Main game loop
RunService.RenderStepped:Connect(function()
	if controlling then
		-- Calculate camera position behind the ball
		local horizontalOffset = Vector3.new(
			math.sin(cameraYaw) * math.cos(cameraPitch),
			math.sin(cameraPitch),
			math.cos(cameraYaw) * math.cos(cameraPitch)
		)
		
		local cameraPosition = ball.Position + horizontalOffset * cameraDistance
		
		-- Set camera to third-person view looking at ball
		camera.CFrame = CFrame.new(cameraPosition, ball.Position)
		camera.CameraType = Enum.CameraType.Custom
		camera.CameraSubject = nil
		
		-- Get camera's forward direction for ball movement
		local lookVector = camera.CFrame.LookVector
		
		-- Create or update BodyVelocity
		local bodyVelocity = ball:FindFirstChild("FlyVelocity")
		if not bodyVelocity then
			bodyVelocity = Instance.new("BodyVelocity")
			bodyVelocity.MaxForce = Vector3.new(1e5, 1e5, 1e5)
			bodyVelocity.Velocity = Vector3.new()
			bodyVelocity.Name = "FlyVelocity"
			bodyVelocity.Parent = ball
		end
		
		-- Ball always moves forward in camera direction
		bodyVelocity.Velocity = lookVector * speed
	else
		-- Reset camera to player when not controlling
		if player.Character and player.Character:FindFirstChild("Humanoid") then
			camera.CameraSubject = player.Character.Humanoid
			camera.CameraType = Enum.CameraType.Custom
		end
		
		-- Remove BodyVelocity
		local bodyVelocity = ball:FindFirstChild("FlyVelocity")
		if bodyVelocity then
			bodyVelocity:Destroy()
		end
	end
end)

-- Pinch to zoom for mobile
UserInputService.TouchPinch:Connect(function(touchPositions, scale, velocity, gameProcessed)
	if gameProcessed then return end
	if controlling then
		cameraDistance = math.clamp(cameraDistance / scale, 5, 30)
	end
end)
