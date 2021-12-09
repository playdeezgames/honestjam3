extends Node

var _creature
var _directions = load("res://Data/Factories/Directions.gd").new()
var creatureDescriptors = load("res://Data/Descriptors/CreatureDescriptors.gd").new()

func _init(creature):
	_creature = creature

func getFacing():
	return _creature.facing

func turnLeft():
	_creature.facing = _directions.previous(_creature.facing)

func turnRight():
	_creature.facing = _directions.next(_creature.facing)

func turnAround():
	_creature.facing = _directions.opposite(_creature.facing)
	
func getDescription():
	var descriptor = creatureDescriptors.getDescriptor(_creature.creatureType)
	return descriptor.description
