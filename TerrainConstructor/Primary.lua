local toolbar = plugin:CreateToolbar("TerrainConstructor")
local UI = require(script.Parent.UI)
local wCount = 0
local ChangeHistoryService = game:GetService("ChangeHistoryService")

function unload()
	if game.Workspace.Camera:FindFirstChild("TerrainConstructorTemp") then
		game.Workspace.Camera.TerrainConstructorTemp:Destroy()
		game.ServerStorage.TerrainConstructorAssets:Destroy()
	end
	
end
function load()
	local container = Instance.new("Model", game.Workspace.Camera)
	container.Name = "TerrainConstructorTemp"
	local c2 = Instance.new("Model", game.ServerStorage)
	c2.Name = "TerrainConstructorAssets"
	for i,item in pairs(script.Parent.Instances:GetChildren()) do
		item.Parent = c2
	end
	UI:assignMouse(plugin:GetMouse())
end
function permLoad()
	if game.Workspace.Camera:FindFirstChild("TerrainConstructorPerm") then
		print("Plugin has loaded before, no new perm assets need to be generated.")
	else
		print("Plugin has not loaded before here, generating event libraries.")
		local lib = Instance.new("Model", game.Workspace.Camera)
		for i,item in pairs(script.Parent.Events:GetChildren()) do
			item.Parent = lib
		end
		lib.Name = "TerrainConstructorPerm"
	end
end
permLoad()

function onClick()
	unload()
	load()
	local int = UI:GetInstances()
	local w = UI:GetWidget()
	--Totally followed a tutorial lol.
	local testWidget = plugin:CreateDockWidgetPluginGui("Main"..wCount, w)
	testWidget.Title = "TerrainConstructor Menu"  -- Optional widget title
	int.Parent = testWidget
	
	
	wCount = wCount + 1
end

function setWaypoint(point)
	ChangeHistoryService:SetWaypoint(point)
	
end
if game.Workspace.Camera:FindFirstChild("TerrainConstructorPerm") then
		game.Workspace.Camera.TerrainConstructorPerm.SetUndoWaypoint.Event:Connect(setWaypoint)
end

local newScriptButton = toolbar:CreateButton("TerrainConstructor Menu", "Opens the TerrainConstructor plugin menu", "rbxassetid://413372165")
newScriptButton.Click:Connect(onClick)
