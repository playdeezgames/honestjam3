extends Node

var equipSlotDescriptors = load("res://Data/Descriptors/EquipSlotDescriptors.gd").new()

const TROUSERS = "trousers"
const JOOLS = "jools"
const POTION = "potion"

var itemDescriptors = {
	TROUSERS:{
		"description": "a dignified pair of trousers",
		"stackable": false,
		"count":1,
		"equipSlot": equipSlotDescriptors.LEGS
	},
	JOOLS:{
		"description": "jools",
		"stackable": true,
		"count":100,
		"equipSlot": null
	},
	POTION:{
		"description": "potion",
		"stackable": true,
		"count": 10,
		"equipSlot": null
	}
}

func _init():
	pass

func getDescriptor(itemType):
	return itemDescriptors[itemType]

func getCount(itemType):
	return getDescriptor(itemType).count
	
func getItemTypes():
	var result = []
	for key in itemDescriptors:
		result.push_back(key)
	return result

func restackItem(items, item):
	var descriptor = getDescriptor(item.itemType)
	if descriptor.stackable:
		for existingItem in items:
			if existingItem.itemType == item.itemType:
				existingItem.count = existingItem.count + item.count
				return
	items.push_back(item)

func restackItems(items):
	var result = []
	for item in items:
		restackItem(result, item)
	return result
