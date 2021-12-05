extends Node

var _mapCell = preload("res://Data/MapCell.gd").new()

func _init():
	pass
	
func generate(columns):
	var result = []
	for column in columns:
		result.push_back(_mapCell.generate())
	return result
