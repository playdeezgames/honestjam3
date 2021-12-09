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
var _item = load("res://Data/Factories/Item.gd").new()
var _itemDescriptors = load("res://Data/Descriptors/ItemDescriptors.gd").new()
var featureDescriptors = load("res://Data/Descriptors/FeatureDescriptors.gd").new()
var creatureDescriptors = load("res://Data/Descriptors/CreatureDescriptors.gd").new()

func _init():
	rng.randomize()
	
func populateCorners(map):
	map.getCell(0,0).addFeatureData(_feature.generate(featureDescriptors.MAP_CORNER))
	map.getCell(0,map.getRows()-1).addFeatureData(_feature.generate(featureDescriptors.MAP_CORNER))
	map.getCell(map.getColumns()-1,0).addFeatureData(_feature.generate(featureDescriptors.MAP_CORNER))
	map.getCell(map.getColumns()-1,map.getRows()-1).addFeatureData(_feature.generate(featureDescriptors.MAP_CORNER))

func populateEdges(map):
	for column in range(1, map.getColumns()-2):
		map.getCell(column,0).addFeatureData(_feature.generate(featureDescriptors.MAP_EDGE))
		map.getCell(column,map.getRows()-1).addFeatureData(_feature.generate(featureDescriptors.MAP_EDGE))
	for row in range(1, map.getRows()-2):
		map.getCell(0, row).addFeatureData(_feature.generate(featureDescriptors.MAP_EDGE))
		map.getCell(map.getColumns()-1,row).addFeatureData(_feature.generate(featureDescriptors.MAP_EDGE))
		
func populateTerrain(map):
	for column in map.getColumns():
		for row in map.getRows():
			map.getCell(column, row).setTerrainData(_terrain.generate())
	
func populateItems(map):
	for itemType in _itemDescriptors.getItemTypes():
		var itemCount = _itemDescriptors.getCount(itemType)
		for index in itemCount:
			var column = rng.randi_range(0, map.getColumns()-1)
			var row = rng.randi_range(0, map.getRows()-1)
			map.getCell(column,row).addItemData(_item.generate(itemType))
			
func populateCreature(map, creatureType):
	var column = rng.randi_range(0, map.getColumns()-1)
	var row = rng.randi_range(0, map.getRows()-1)
	if map.getCell(column,row).hasCreature():
		populateCreature(map, creatureType)
	else:
		map.getCell(column,row).putCreatureData(_creature.generate(creatureType))
			
func populateCreatures(map):
	for creatureType in creatureDescriptors.getCreatureTypes():
		var descriptor = creatureDescriptors.getDescriptor(creatureType)
		for index in descriptor.count:
			populateCreature(map, creatureType)
	
func populateMap():
	var map = _mapWrapper.new(_data.map)
	populateTerrain(map)
	populateCorners(map)
	populateEdges(map)
	populateItems(map)
	populateCreatures(map)

func placeAvatar():
	var map = _mapWrapper.new(_data.map)
	_data.avatar = _avatar.generate(map)
	map.getCell(_data.avatar.column, _data.avatar.row).putCreatureData(_creature.generate(creatureDescriptors.AVATAR))
	
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
