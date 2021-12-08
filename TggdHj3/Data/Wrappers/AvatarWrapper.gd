extends Node

var _avatar
var _itemWrapper = load("res://Data/Wrappers/ItemWrapper.gd")
var _itemDescriptors = load("res://Data/Descriptors/ItemDescriptor.gd").new()

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
	_avatar.items = _itemDescriptors.restackItems(_avatar.items)

func hasItems():
	return _avatar.items.size()>0

func getItems():
	var result = []
	for item in _avatar.items:
		result.push_back(_itemWrapper.new(item))
	return result
