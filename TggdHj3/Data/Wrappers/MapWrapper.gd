extends Node

var _map
var _mapCellWrapper = preload("res://Data/Wrappers/MapCellWrapper.gd")

func _init(map):
	_map = map

func getCell(column,row):
	if row>=0 && row<_map.size():
		var mapRow = _map[row]
		if column>=0 && column<mapRow.size():
			return _mapCellWrapper.new(mapRow[column])
	return null
	
func getRows():
	return _map.size()
	
func getColumns():
	return _map[0].size()
	
