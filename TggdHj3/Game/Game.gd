extends Node

var _data

func _init():
	_data = preload("res://Data/Data.gd").new()

func reset(difficulty):
	_data.reset(difficulty)
