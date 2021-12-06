extends Node

var _mapCell

func _init():
	_mapCell = load("res://Data/Factories/MapCell.gd").new()
	
func generate(columns):
	var result = []
	for column in columns:
		result.push_back(_mapCell.generate())
	return result

