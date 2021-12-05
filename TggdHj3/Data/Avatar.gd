extends Node

var _rng = preload("res://Data/Rng.gd").new()
var _data
var _creature
var _mapCell

func _init(data):
	_data = data
	_creature = load("res://Data/Creature.gd").new(_data)
	_mapCell = load("res://Data/MapCell.gd").new(_data)

func generate():
	var cell
	var column
	var row
	while cell==null || cell.creature!=null:
		column = _rng.randi_range(0, _data.columns-1)
		row= _rng.randi_range(0, _data.rows-1)
		cell = _mapCell.find(column,row)
	cell.creature=_creature.generate()
	_data.column = column
	_data.row= row

