extends Node

var _feature

func _init(feature):
	_feature = feature

func getType():
	return _feature.featureType
