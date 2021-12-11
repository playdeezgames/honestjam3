extends Node

const MAP_EDGE = "mapedge"
const MAP_CORNER = "mapcorner"
const POTION_SHOPPE = "potionshoppe"

var states = load("res://States/Utility/States.gd").new()
var featureDescriptors =	{
		MAP_EDGE:{
			"description":"the edge of the world",
			"interactState": states.INTERACT_EDGE,
			"count":0
		},
		MAP_CORNER:{
			"description":"the corner of the world",
			"interactState": states.INTERACT_CORNER,
			"count":0
		},
		POTION_SHOPPE:{
			"description":"a vendor selling potions",
			"interactState": states.INTERACT_POTION_SHOPPE,
			"count":3
		}
	}

func _init():
	pass
	
func getDescriptor(feature):
	return featureDescriptors[feature]

func getFeatureTypes():
	var result = []
	for key in featureDescriptors:
		result.push_back(key)
	return result
