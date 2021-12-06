extends Node

var _data
var _dataWrapper

func _init():
	_data = load("res://Data/Data.gd").new()
	_dataWrapper = load("res://Data/Wrappers/DataWrapper.gd")

func reset(difficulty):
	_data.reset(difficulty)

func getData():
	return _dataWrapper.new(_data._data)

func turnLeft():
	var data = getData()
	var avatar = data.getAvatar()
	var creature = data.getMap().getCell(avatar.getColumn(), avatar.getRow()).getCreature()
	creature.turnLeft()

func turnRight():
	var data = getData()
	var avatar = data.getAvatar()
	var creature = data.getMap().getCell(avatar.getColumn(), avatar.getRow()).getCreature()
	creature.turnRight()

func turnAround():
	var data = getData()
	var avatar = data.getAvatar()
	var creature = data.getMap().getCell(avatar.getColumn(), avatar.getRow()).getCreature()
	creature.turnAround()

