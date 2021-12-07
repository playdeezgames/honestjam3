extends Node

const itemDescriptors = {
	"trousers":{
		"description": "a dignified pair of trousers"
	},
	"jools":{
		"description": "jools"
	}
}

var _item

func _init(item):
	_item = item

func getDescription():
	return itemDescriptors[_item.itemType].description
	
func getItemData():
	return _item
