extends Node

var _mapCell
var _data

func _init(data):
	_data = data
	_mapCell = load("res://Data/MapCell.gd").new(_data)
	
func generate(columns):
	var result = []
	for column in columns:
		result.push_back(_mapCell.generate())
	return result
