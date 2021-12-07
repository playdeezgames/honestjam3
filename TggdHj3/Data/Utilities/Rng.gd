extends Node

var _rng = RandomNumberGenerator.new()

func _init():
	_rng.randomize()

func randi_range(from, to):
	return _rng.randi_range(from, to)

func fromGenerator(generator):
	var total = 0
	for key in generator:
		total = total + generator[key]
	var generated = randi_range(0, total-1)
	for key in generator:
		if generated<generator[key]:
			return key
		else:
			generated = generated - generator[key]
