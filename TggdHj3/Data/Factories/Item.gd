extends Node

const TROUSERS = "trousers"
const JOOLS = "jools"

const itemCounts = {
	TROUSERS: 1,
	JOOLS: 100
}

func _init():
	pass

func generate(itemType):
	return {"itemType":itemType}
	
func getCount(itemType):
	return itemCounts[itemType]
	
func getItemTypes():
	var result = []
	for key in itemCounts:
		result.push_back(key)
	return result
