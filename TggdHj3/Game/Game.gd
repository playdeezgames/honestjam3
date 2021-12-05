extends Node

var _data

func _init():
	_data = load("res://Data/Data.gd").new()

func reset(difficulty):
	_data.reset(difficulty)

func getData():
	return _data
