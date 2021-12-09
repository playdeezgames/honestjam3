extends Node

const MAP_EDGE = "mapedge"
const MAP_CORNER = "mapcorner"

var states = load("res://States/Utility/States.gd").new()
var _featureDescriptors =	{
		MAP_EDGE:{
			"description":"the edge of the world",
			"interactState": states.INTERACT_EDGE
		},
		MAP_CORNER:{
			"description":"the corner of the world",
			"interactState": states.INTERACT_CORNER
		}		
	}

func _init():
	pass
	
func getDescriptor(feature):
	return _featureDescriptors[feature]
