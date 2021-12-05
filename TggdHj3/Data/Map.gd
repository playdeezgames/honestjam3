extends Node

var _mapRow = preload("res://Data/MapRow.gd").new()

func _init():
	pass

func generate(columns, rows):
	var result = []
	for row in rows:
		result.push_back(_mapRow.generate(columns))
	return result
