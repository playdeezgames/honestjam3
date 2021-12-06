extends Node

var rng = RandomNumberGenerator.new()
var _data = {}
var _difficulty = preload("res://Game/Difficulty.gd").new()
var _map = preload("res://Data/Map.gd").new(_data)
var _avatar = preload("res://Data/Avatar.gd").new()
var _mapWrapper = preload("res://Data/MapWrapper.gd")
var _creature = preload("res://Data/Creature.gd").new()

func _init():
	rng.randomize()
	pass
	
func reset(difficulty):
	var rows = _difficulty.getDescriptor(difficulty).board.rows
	var columns = _difficulty.getDescriptor(difficulty).board.columns
	_data.difficulty = difficulty
	_data.columns = columns
	_data.rows = rows
	_data.map = _map.generate(columns, rows)
	var map = _mapWrapper.new(_data.map)
	_data.avatar = _avatar.generate(map)
	map.getCell(_data.avatar.column, _data.avatar.row).putCreature(_creature.generate())

func getMap():
	return _map
