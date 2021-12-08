extends Node

var _itemDescriptors = load("res://Data/Descriptors/ItemDescriptor.gd").new()
var _item

func _init(item):
	_item = item

func getDescription():
	var descriptor = _itemDescriptors.getDescriptor(_item.itemType)
	var count = getCount()
	if count>1:
		return descriptor.description + " (x"+String(count)+")"
	return descriptor.description
	
func getItemData():
	return _item

func getCount():
	return _item.count
	
func canEquip():
	var descriptor = _itemDescriptors.getDescriptor(_item.itemType)
	return descriptor.equipSlot!=null
	
func getEquipSlot():
	var descriptor = _itemDescriptors.getDescriptor(_item.itemType)
	return descriptor.equipSlot
