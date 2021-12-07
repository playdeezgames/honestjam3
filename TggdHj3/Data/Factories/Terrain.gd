extends Node

var _rng = load("res://Data/Utilities/Rng.gd").new()

const GRASS = "grass"
const TREES = "trees"

const generator = {
	GRASS:5,
	TREES:1
}

func _init():
	pass

func generate():
	return {"terrainType":_rng.fromGenerator(generator)}
