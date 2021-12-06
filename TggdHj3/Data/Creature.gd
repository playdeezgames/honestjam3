extends Node

var _directions = preload("res://Data/Directions.gd").new()

func _init():
	pass

func generate():
	var result = {}
	result.facing = _directions.generate()
	return result
