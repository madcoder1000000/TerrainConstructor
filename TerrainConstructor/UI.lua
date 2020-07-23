local UI = {}

local mouse;

function UI:assignMouse(mouse1)
	mouse = mouse1
end

local widgetInfo = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Top,  -- Widget will be initialized in floating panel
	true,   -- Widget will be initially enabled
	true,  -- Don't override the previous enabled state
	150,    -- Default width of the floating window
	150,    -- Default height of the floating window
	150,    -- Minimum width of the floating window
	150     -- Minimum height of the floating window
)
--Create UI elements
local NewGuiPart1 = Instance.new("UIListLayout")
-------
local NewGuiPart2 = Instance.new("Frame")
NewGuiPart2.BackgroundColor3 = Color3.new(0.129412, 0.129412, 0.129412)
NewGuiPart2.BorderSizePixel = 0
NewGuiPart2.Size = UDim2.new(1, 0, 1, 0)
NewGuiPart1.Parent = NewGuiPart2
-------
local NewGuiPart3 = Instance.new("TextButton")
NewGuiPart3.Active = true
NewGuiPart3.BackgroundTransparency = 1
NewGuiPart3.BorderSizePixel = 0
NewGuiPart3.Name = "DragTerrain"
NewGuiPart3.Selectable = true
NewGuiPart3.Size = UDim2.new(0.100000001, 0, 1, 0)
NewGuiPart3.Style = Enum.ButtonStyle.Custom
NewGuiPart3.FontSize = Enum.FontSize.Size14
NewGuiPart3.Text = "Enable terrain drag"
NewGuiPart3.TextScaled = true
NewGuiPart3.TextColor3 = Color3.new(1, 1, 1)
NewGuiPart3.Parent = NewGuiPart2
NewGuiPart3.MouseButton1Click:Connect(function()
	local selection = game:GetService("Selection")
	
	game.ServerStorage.TerrainConstructorAssets.TerrainScaler.Parent = game.Workspace.Camera.TerrainConstructorTemp
	game.ServerStorage.TerrainConstructorAssets.TerrainScaler.CFrame = mouse.Hit
	local selectTable = {game.Workspace.Camera.TerrainConstructorTemp.TerrainScaler}
	selection:Set(selectTable)
end)
-------
local NewGuiPart4 = Instance.new("TextButton")
NewGuiPart4.Active = true
NewGuiPart4.BackgroundTransparency = 1
NewGuiPart4.BorderSizePixel = 0
NewGuiPart4.Name = "RemoveDrag"
NewGuiPart4.Selectable = true
NewGuiPart4.Size = UDim2.new(0.100000001, 0, 1, 0)
NewGuiPart4.Position = UDim2.new(0.1, 0, 0, 0)
NewGuiPart4.Style = Enum.ButtonStyle.Custom
NewGuiPart4.FontSize = Enum.FontSize.Size14
NewGuiPart4.Text = "Disable terrain drag"
NewGuiPart4.TextScaled = true
NewGuiPart4.TextColor3 = Color3.new(1, 1, 1)
NewGuiPart4.Parent = NewGuiPart2
NewGuiPart4.MouseButton1Click:Connect(function()
	if game.Workspace.Camera.TerrainConstructorTemp:FindFirstChild("TerrainScaler") then
		game.Workspace.Camera.TerrainConstructorTemp.TerrainScaler.Parent = game.ServerStorage.TerrainConstructorAssets
	end
end)



function UI:GetInstances()
	return NewGuiPart2
end
function UI:GetWidget()
	return widgetInfo
end

return UI
