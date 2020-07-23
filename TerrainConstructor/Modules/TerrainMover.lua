local TerrainMover = {}

function TerrainMover.Move(pos)
	game.Workspace.CurrentCamera.TerrainConstructor.SpawnPos.CFrame = pos
end

return TerrainMover
