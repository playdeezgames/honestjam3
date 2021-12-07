extends Node

const _featureDescriptors =	{
		"mapedge":{
			"description":"You are at the edge of the world."
		},
		"mapcorner":{
			"description":"You are in the corner of the world."
		}		
	}

var _feature

func _init(feature):
	_feature = feature

func getType():
	return _feature.featureType
	
func getDescription():
	return _featureDescriptors[_feature.featureType].description
