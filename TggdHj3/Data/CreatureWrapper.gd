extends Node

var _creature

func _init(creature):
	_creature = creature

func getFacing():
	return _creature.facing
