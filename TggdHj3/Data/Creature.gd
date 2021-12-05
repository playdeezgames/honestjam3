extends Node

var _data
var _directions = preload("res://Data/Directions.gd").new()

func _init(data):
	_data = data

func generate():
	var result = {}
	result.facing = _directions.generate()
	return result
