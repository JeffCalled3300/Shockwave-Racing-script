if game.PlaceId != 9961650006 then script:Destroy()

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local UICorner_2 = Instance.new("UICorner")
local TextLabel_2 = Instance.new("TextLabel")
local UICorner_3 = Instance.new("UICorner")
local TextLabel_3 = Instance.new("TextLabel")
local UICorner_4 = Instance.new("UICorner")

-- Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(177, 177, 177)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.0253164582, 0, 0.75124377, 0)
Frame.Size = UDim2.new(0.110548526, 0, 0.208955228, 0)

UICorner.Parent = Frame

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.111967571, 0, 0, 0)
TextLabel.Size = UDim2.new(0.771986961, 0, 0.297619045, 0)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "E - End"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextSize = 14.000

UICorner_2.Parent = TextLabel

TextLabel_2.Parent = Frame
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0.111967571, 0, 0.34756723, 0)
TextLabel_2.Size = UDim2.new(0.771986961, 0, 0.297619045, 0)
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.Text = "R - Spawn"
TextLabel_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.TextSize = 14.000

UICorner_3.Parent = TextLabel_2

TextLabel_3.Parent = Frame
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(0.111967571, 0, 0.702380955, 0)
TextLabel_3.Size = UDim2.new(0.771986961, 0, 0.297619045, 0)
TextLabel_3.Font = Enum.Font.SourceSans
TextLabel_3.Text = "F - Points"
TextLabel_3.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.TextSize = 14.000

UICorner_4.Parent = TextLabel_3

-- Scripts:

local function NNUHKH_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	local uis = game.UserInputService
	local plr = game.Players.LocalPlayer
	
	uis.InputBegan:Connect(function(inputObj, gameProcessedEvent)
		if gameProcessedEvent then return end
	
		if inputObj.KeyCode == Enum.KeyCode.E then
	
			plr.Character:MoveTo(game.Workspace.Finish.Finish.Position)
		elseif inputObj.KeyCode == Enum.KeyCode.R then
			plr.Character:MoveTo(game.Workspace.Spawn.Details.Floor.Position)
		elseif inputObj.KeyCode == Enum.KeyCode.F then
			for i=1, 10 do
				plr.Character:MoveTo(game.Workspace.Coins.Points:GetChildren()[i].Position)
				wait(0.2)
			end
		end
	end)
end
coroutine.wrap(NNUHKH_fake_script)()
local function SDWM_fake_script() -- Frame.Dragable 
	local script = Instance.new('LocalScript', Frame)

	local frame = script.Parent
	
	local TweenService = game:GetService("TweenService")
	
	local offsetX = 0
	local offsetY = 0
	
	local initialPosition = frame.Position
	
	local function onMouseDown(x, y)
		offsetX = x - frame.Position.X.Offset
		offsetY = y - frame.Position.Y.Offset
	
		local mouseMoveConn
		local mouseUpConn
	
		mouseMoveConn = game:GetService("UserInputService").InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement then
				local newPosition = UDim2.new(initialPosition.X.Scale, input.Position.X - offsetX, initialPosition.Y.Scale, input.Position.Y - offsetY)
				local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
				local tween = TweenService:Create(frame, tweenInfo, { Position = newPosition })
				tween:Play()
			end
		end)
	
		mouseUpConn = game:GetService("UserInputService").InputEnded:Connect(function(input)
			mouseMoveConn:Disconnect()
			mouseUpConn:Disconnect()
		end)
	end
	
	frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			onMouseDown(input.Position.X, input.Position.Y)
		end
	end)
end
coroutine.wrap(SDWM_fake_script)()
