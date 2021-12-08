extends Node

const LEGS = "legs"

const equipSlotDescriptors = {
	LEGS:{
		"description": "yer legs"
	}
}

func _init():
	pass

func getDescriptor(equipSlot):
	return equipSlotDescriptors[equipSlot]
