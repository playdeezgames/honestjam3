extends Node

var _mapCell
var _creatureWrapper = load("res://Data/Wrappers/CreatureWrapper.gd")
var _featureWrapper = load("res://Data/Wrappers/FeatureWrapper.gd")
var _terrainWrapper = load("res://Data/Wrappers/TerrainWrapper.gd")
var _itemWrapper = load("res://Data/Wrappers/ItemWrapper.gd")
var _itemDescriptors = load("res://Data/Descriptors/ItemDescriptors.gd").new()
var creatureDescriptors = load("res://Data/Descriptors/CreatureDescriptors.gd").new()

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
	
func hasFeatures():
	return _mapCell.features.size()>0

func getFeatures():
	var result = []
	for feature in _mapCell.features:
		result.push_back(_featureWrapper.new(feature))
	return result

func setTerrainData(terrain):
	_mapCell.terrain = terrain

func getTerrain():
	return _terrainWrapper.new(_mapCell.terrain)
	
func addItemData(item):
	_mapCell.items.push_back(item)
	_mapCell.items = _itemDescriptors.restackItems(_mapCell.items)
	
func getItems():
	var result = []
	for item in _mapCell.items:
		result.push_back(_itemWrapper.new(item))
	return result
	
func getItem(index):
	return _itemWrapper.new(_mapCell.items[index])
	
func hasItems():
	return getItems().size()>0
	
func removeItem(index):
	_mapCell.items.remove(index)
	
func isWin():
	return _mapCell.creature==null || _mapCell.creature.creatureType==creatureDescriptors.AVATAR
