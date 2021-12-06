extends Node

var _data
var _mapWrapper = preload("res://Data/MapWrapper.gd")
var _avatarWrapper = preload("res://Data/AvatarWrapper.gd")

func _init(data):
	_data = data

func getMap():
	return _mapWrapper.new(_data.map)
	
func getAvatar():
	return _avatarWrapper.new(_data.avatar)
