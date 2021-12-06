extends Node

var _mapCell
var _creatureWrapper = preload("res://Data/Wrappers/CreatureWrapper.gd")

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
