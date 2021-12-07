extends Node

var rng = RandomNumberGenerator.new()
var _data = {}
var _difficulty = load("res://Game/Difficulty.gd").new()
var _map = load("res://Data/Factories/Map.gd").new()
var _avatar = load("res://Data/Factories/Avatar.gd").new()
var _mapWrapper = load("res://Data/Wrappers/MapWrapper.gd")
var _creature = load("res://Data/Factories/Creature.gd").new()
var _feature = load("res://Data/Factories/Feature.gd").new()
var _terrain = load("res://Data/Factories/Terrain.gd").new()

func _init():
	rng.randomize()
	
func populateCorners(map):
	map.getCell(0,0).addFeatureData(_feature.generate(_feature.MAP_CORNER))
	map.getCell(0,map.getRows()-1).addFeatureData(_feature.generate(_feature.MAP_CORNER))
	map.getCell(map.getColumns()-1,0).addFeatureData(_feature.generate(_feature.MAP_CORNER))
	map.getCell(map.getColumns()-1,map.getRows()-1).addFeatureData(_feature.generate(_feature.MAP_CORNER))

func populateEdges(map):
	for column in range(1, map.getColumns()-2):
		map.getCell(column,0).addFeatureData(_feature.generate(_feature.MAP_EDGE))
		map.getCell(column,map.getRows()-1).addFeatureData(_feature.generate(_feature.MAP_EDGE))
	for row in range(1, map.getRows()-2):
		map.getCell(0, row).addFeatureData(_feature.generate(_feature.MAP_EDGE))
		map.getCell(map.getColumns()-1,row).addFeatureData(_feature.generate(_feature.MAP_EDGE))
		
func populateTerrain(map):
	for column in map.getColumns():
		for row in map.getRows():
			map.getCell(column, row).setTerrainData(_terrain.generate())
	
func populateMap():
	var map = _mapWrapper.new(_data.map)
	populateTerrain(map)
	populateCorners(map)
	populateEdges(map)

func placeAvatar():
	var map = _mapWrapper.new(_data.map)
	_data.avatar = _avatar.generate(map)
	map.getCell(_data.avatar.column, _data.avatar.row).putCreatureData(_creature.generate())
	
func reset(difficulty):
	var rows = _difficulty.getDescriptor(difficulty).board.rows
	var columns = _difficulty.getDescriptor(difficulty).board.columns
	_data.difficulty = difficulty
	_data.columns = columns
	_data.rows = rows
	_data.map = _map.generate(columns, rows)
	populateMap()
	placeAvatar()

func getMap():
	return _map
