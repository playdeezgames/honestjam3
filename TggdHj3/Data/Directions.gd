extends Node

var _rng = preload("res://Data/Rng.gd").new()

func _init():
	pass

func count():
	return 4
	
func generate():
	return _rng.randi_range(0, count())
