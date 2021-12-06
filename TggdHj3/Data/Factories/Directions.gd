extends Node

var _rng = load("res://Data/Utilities/Rng.gd").new()

func _init():
	pass

func count():
	return 4
	
func generate():
	return _rng.randi_range(0, count())
	
func previous(direction):
	return (direction + count()-1) % count()
	
func next(direction):
	return (direction + 1) % count()
	
func opposite(direction):
	return (direction + count()/2) % count()
