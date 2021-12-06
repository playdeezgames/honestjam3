extends Node

var _mapCell
var _creatureWrapper = preload("res://Data/CreatureWrapper.gd")

func _init(mapCell):
	_mapCell = mapCell

func getCreature():
	if _mapCell.creature!=null:
		return _creatureWrapper.new(_mapCell.creature)
	return null
	
func putCreature(creature):
	_mapCell.creature = creature
