extends Node

const NORMAL = "normal"

var _descriptors={}

func _init():
	_descriptors[NORMAL] = { 
			"board":{
				"columns":8,
				"rows":8
			}
		}
		
func getDescriptor(difficulty):
	return _descriptors[difficulty]
