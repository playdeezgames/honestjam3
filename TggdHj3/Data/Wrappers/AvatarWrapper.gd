extends Node

var _avatar

func _init(avatar):
	_avatar = avatar

func getColumn():
	return _avatar.column
	
func getRow():
	return _avatar.row

func putColumn(column):
	_avatar.column = column
	
func putRow(row):
	_avatar.row = row
	
func addItemData(item):
	_avatar.items.push_back(item)
