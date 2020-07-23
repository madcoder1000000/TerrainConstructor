script.Parent:GetPropertyChangedSignal("Position"):Connect(function()
	game.Workspace.Terrain:FillBlock(script.Parent.CFrame, script.Parent.Size, Enum.Material.Grass)
	game.Workspace.Camera.TerrainConstructorPerm.SetUndoWaypoint:Fire("TerrainConstructor_Scale")
end)
