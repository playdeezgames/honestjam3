extends Node

var _creature
var _directions = load("res://Data/Factories/Directions.gd").new()

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
