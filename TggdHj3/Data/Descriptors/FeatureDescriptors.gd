extends Node

const MAP_EDGE = "mapedge"
const MAP_CORNER = "mapcorner"

const _featureDescriptors =	{
		MAP_EDGE:{
			"description":"You are at the edge of the world."
		},
		MAP_CORNER:{
			"description":"You are in the corner of the world."
		}		
	}

func _init():
	pass
	
func getDescriptor(feature):
	return _featureDescriptors[feature]
