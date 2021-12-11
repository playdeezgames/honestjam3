extends Node

var _avatar
var _itemWrapper = load("res://Data/Wrappers/ItemWrapper.gd")
var _itemDescriptors = load("res://Data/Descriptors/ItemDescriptors.gd").new()

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
	
func hasItemCount(itemType, amount):
	var total = 0
	for item in _avatar.items:
		if item.itemType == itemType:
			total = total + item.count
	return total>=amount
	
func getItemCount(itemType):
	var total = 0
	for item in _avatar.items:
		if item.itemType == itemType:
			total = total + item.count
	return total

func getItems():
	var result = []
	for item in _avatar.items:
		result.push_back(_itemWrapper.new(item))
	return result
	
func removeItem(index):
	_avatar.items.remove(index)
	
func removeItemCount(itemType, count):
	var newItems = []
	for item in _avatar.items:
		if item.itemType==itemType:
			if item.count>count:
				item.count = item.count-count
				count = 0
				newItems.push_back(item)
			else:
				count = count - item.count
		else:
			newItems.push_back(item)
	_avatar.items = newItems
	return count
	
func isEquipped(equipSlot):
	return _avatar.equipSlots.has(equipSlot)
	
func hasEquipped():
	return _avatar.equipSlots.size()>0
	
func getEquippedSlots():
	var result = []
	for key in _avatar.equipSlots:
		result.push_back(key)
	return result
	
func getEquipped(equipSlot):
	if isEquipped(equipSlot):
		return _itemWrapper.new(_avatar.equipSlots[equipSlot])
	return null

func equip(equipSlot, item):
	_avatar.equipSlots[equipSlot]=item
	
func unequip(equipSlot):
	_avatar.equipSlots.erase(equipSlot)
