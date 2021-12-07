extends Node

var _mapCell
var _creatureWrapper = load("res://Data/Wrappers/CreatureWrapper.gd")
var _featureWrapper = load("res://Data/Wrappers/FeatureWrapper.gd")
var _terrainWrapper = load("res://Data/Wrappers/TerrainWrapper.gd")

func _init(mapCell):
	_mapCell = mapCell

func getCreature():
	if hasCreature():
		return _creatureWrapper.new(_mapCell.creature)
	return null

func hasCreature():
	return _mapCell.creature!=null

func getCreatureData():
	return _mapCell.creature

func putCreatureData(creature):
	_mapCell.creature = creature

func addFeatureData(feature):
	_mapCell.features.push_back(feature)

func getFeatures():
	var result = []
	for feature in _mapCell.features:
		result.push_back(_featureWrapper.new(feature))
	return result

func setTerrainData(terrain):
	_mapCell.terrain = terrain

func getTerrain():
	return _terrainWrapper.new(_mapCell.terrain)
