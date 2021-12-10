extends Node

var _itemDescriptors = load("res://Data/Descriptors/ItemDescriptors.gd").new()
var _item

func _init(item):
	_item = item

func getDescription():
	var descriptor = _itemDescriptors.getDescriptor(_item.itemType)
	var count = getCount()
	if count>1:
		return descriptor.description + " (x" + String(count) + ")"
	return descriptor.description
	
func getItemType():
	return _item.itemType
	
func getItemData():
	return _item

func getCount():
	return _item.count
	
func reduceCount():
	_item.count = _item.count -1
	return _item.count>0
	
func canEquip():
	var descriptor = _itemDescriptors.getDescriptor(_item.itemType)
	return descriptor.equipSlot != null
	
func canUse():
	var descriptor = _itemDescriptors.getDescriptor(_item.itemType)
	return descriptor.usable
	
func getEquipSlot():
	var descriptor = _itemDescriptors.getDescriptor(_item.itemType)
	return descriptor.equipSlot
