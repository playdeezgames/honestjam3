extends Node

var rng = RandomNumberGenerator.new()
var _data = {}
var _difficulty = preload("res://Game/Difficulty.gd").new()

func _init():
	rng.randomize()
	pass
	
func reset(difficulty):
	var rows = _difficulty.getDescriptor(difficulty).board.rows
	var columns = _difficulty.getDescriptor(difficulty).board.columns
	_data = {
			"difficulty": difficulty,
			"columns": columns,
			"rows": rows,
			"column": rng.randi_range(0, columns-1),
			"row": rng.randi_range(0, rows-1)
		}
