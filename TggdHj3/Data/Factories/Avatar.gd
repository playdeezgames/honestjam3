extends Node

var _rng = preload("res://Data/Utilities/Rng.gd").new()

func _init():
	pass
	
func generate(map):
	var column = _rng.randi_range(0, map.getColumns()-1)
	var row = _rng.randi_range(0, map.getRows()-1)
	var cell = map.getCell(column,row)
	if cell!=null && cell.getCreature()==null:
		return { "column": column, "row":row, "items":[] }
	else:
		return generate(map)

