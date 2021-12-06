extends Node

var _rng = RandomNumberGenerator.new()

func _init():
	_rng.randomize()

func randi_range(from, to):
	return _rng.randi_range(from, to)
