extends Node

var featureDescriptors = load("res://Data/Descriptors/FeatureDescriptors.gd").new()
var states = load("res://States/Utility/States.gd").new()

var _feature

func _init(feature):
	_feature = feature

func getType():
	return _feature.featureType
	
func getDescription():
	return featureDescriptors.getDescriptor(_feature.featureType).description
