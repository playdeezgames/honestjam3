extends Node

var _rng = load("res://Data/Utilities/Rng.gd").new()

func _init():
	pass

func count():
	return 4
	
func generate():
	return _rng.randi_range(0, count()-1)
	
func previous(direction):
	return (direction + count()-1) % count()
	
func next(direction):
	return (direction + 1) % count()
	
func opposite(direction):
	return (direction + count()/2) % count()
	
const delta_column = [0,1,0,-1]
const delta_row = [-1,0,1,0]
	
func step(direction, column, row):
	return { "column": column+delta_column[direction], "row": row+delta_row[direction] }
