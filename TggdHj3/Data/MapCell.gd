extends Node

var _data

func _init(data):
	_data = data

func generate():
	var result = {}
	result.creature = null
	return result
	
func find(column,row):
	if row>=0 && row<_data.map.size():
		var mapRow = _data.map[row]
		if column>=0 && column<mapRow.size():
			return mapRow[column]
	return null
