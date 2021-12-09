extends Node

const terrainDescriptors = {
	"grass":{
		"description":"a grassy area"
	},
	"trees":{
		"description":"a wooded area"
	}
}

var _terrain

func _init(terrain):
	_terrain = terrain
	
func getDescription():
	return terrainDescriptors[_terrain.terrainType].description

