extends Node

var _avatar

func _init(avatar):
	_avatar = avatar

func getColumn():
	return _avatar.column
	
func getRow():
	return _avatar.row
