extends Node

var _data
var _dataWrapper

func _init():
	_data = load("res://Data/Data.gd").new()
	_dataWrapper = load("res://Data/Wrappers/DataWrapper.gd")

func reset(difficulty):
	_data.reset(difficulty)

func getData():
	return _dataWrapper.new(_data._data)

func getAvatarPosition():
	var result = {}
	result.column = _data._data.avatar.column
	result.row = _data._data.avatar.row
	return result
