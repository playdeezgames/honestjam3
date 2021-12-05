extends Node

var _mapRow
var _data

func _init(data):
	_data = data
	_mapRow = load("res://Data/MapRow.gd").new(_data)

func generate(columns, rows):
	var result = []
	for row in rows:
		result.push_back(_mapRow.generate(columns))
	return result
