extends Node

const MAP_EDGE = "mapedge"
const MAP_CORNER = "mapcorner"

func _init():
	pass
	
func generate(featureType):
	return {"featureType":featureType}
