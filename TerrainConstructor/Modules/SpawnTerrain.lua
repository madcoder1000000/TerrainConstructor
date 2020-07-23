local SpawnTerrain = {}

function SpawnTerrain:spawnCube(pos, size, material)
	game.Workspace.Terrain:FillBlock(pos, size, material)
end

return SpawnTerrain
