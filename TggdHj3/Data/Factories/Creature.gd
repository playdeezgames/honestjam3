extends Node

var _directions = preload("res://Data/Factories/Directions.gd").new()

func _init():
	pass

func generate(creatureType):
	var result = {}
	result.creatureType = creatureType
	result.facing = _directions.generate()
	return result
