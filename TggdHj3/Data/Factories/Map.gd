extends Node

var _mapRow

func _init():
	_mapRow = load("res://Data/Factories/MapRow.gd").new()

func generate(columns, rows):
	var result = []
	for row in rows:
		result.push_back(_mapRow.generate(columns))
	return result
