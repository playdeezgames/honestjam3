extends Node

const AVATAR = "avatar"
const DREAM_WRAITH = "dreamwraith"

var creatureDescriptors ={
	AVATAR:{
		"description":"you",
		"count":0
	},
	DREAM_WRAITH:{
		"description":"a dreamwraith",
		"count":1
	}
}

func _init():
	pass
	
func getDescriptor(creatureType):
	return creatureDescriptors[creatureType]
	
func getCreatureTypes():
	var result = []
	for key in creatureDescriptors:
		result.push_back(key)
	return result
