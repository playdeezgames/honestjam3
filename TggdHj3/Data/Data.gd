extends Node

var rng = RandomNumberGenerator.new()
var _data = {}
var _difficulty = preload("res://Game/Difficulty.gd").new()
var _map = preload("res://Data/Map.gd").new(_data)

func _init():
	rng.randomize()
	pass
	
func generateAvatar():
	_data.column = rng.randi_range(0, _data.columns-1)
	_data.row= rng.randi_range(0, _data.rows-1)
	pass
	
func reset(difficulty):
	var rows = _difficulty.getDescriptor(difficulty).board.rows
	var columns = _difficulty.getDescriptor(difficulty).board.columns
	_data.difficulty = difficulty
	_data.columns = columns
	_data.rows = rows
	_data.map = _map.generate(columns, rows)
	generateAvatar()
