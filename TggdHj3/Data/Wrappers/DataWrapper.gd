extends Node

var _data
var _mapWrapper = preload("res://Data/Wrappers/MapWrapper.gd")
var _avatarWrapper = preload("res://Data/Wrappers/AvatarWrapper.gd")

func _init(data):
	_data = data

func getMap():
	return _mapWrapper.new(_data.map)
	
func getAvatar():
	return _avatarWrapper.new(_data.avatar)
