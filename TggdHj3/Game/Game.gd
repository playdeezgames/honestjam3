extends Node

var _data
var _dataWrapper
var _directions = load("res://Data/Factories/Directions.gd").new()

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

func moveAhead():
	var data = getData()
	var avatar = data.getAvatar()
	var map = data.getMap()
	var avatarCell = map.getCell(avatar.getColumn(), avatar.getRow())
	var avatarCreature = avatarCell.getCreature()
	var direction = avatarCreature.getFacing()
	var candidate = _directions.step(direction, avatar.getColumn(), avatar.getRow())
	var candidateCell = map.getCell(candidate.column, candidate.row)
	if candidateCell!=null && !candidateCell.hasCreature():
		candidateCell.putCreatureData(avatarCell.getCreatureData())
		avatarCell.putCreatureData(null)
		avatar.putColumn(candidate.column)
		avatar.putRow(candidate.row)
		return true
	return false

func moveLeft():
	var data = getData()
	var avatar = data.getAvatar()
	var map = data.getMap()
	var avatarCell = map.getCell(avatar.getColumn(), avatar.getRow())
	var avatarCreature = avatarCell.getCreature()
	var direction = _directions.previous(avatarCreature.getFacing())
	var candidate = _directions.step(direction, avatar.getColumn(), avatar.getRow())
	var candidateCell = map.getCell(candidate.column, candidate.row)
	if candidateCell!=null && !candidateCell.hasCreature():
		candidateCell.putCreatureData(avatarCell.getCreatureData())
		avatarCell.putCreatureData(null)
		avatar.putColumn(candidate.column)
		avatar.putRow(candidate.row)
		return true
	return false

func moveRight():
	var data = getData()
	var avatar = data.getAvatar()
	var map = data.getMap()
	var avatarCell = map.getCell(avatar.getColumn(), avatar.getRow())
	var avatarCreature = avatarCell.getCreature()
	var direction = _directions.next(avatarCreature.getFacing())
	var candidate = _directions.step(direction, avatar.getColumn(), avatar.getRow())
	var candidateCell = map.getCell(candidate.column, candidate.row)
	if candidateCell!=null && !candidateCell.hasCreature():
		candidateCell.putCreatureData(avatarCell.getCreatureData())
		avatarCell.putCreatureData(null)
		avatar.putColumn(candidate.column)
		avatar.putRow(candidate.row)
		return true
	return false

func moveBack():
	var data = getData()
	var avatar = data.getAvatar()
	var map = data.getMap()
	var avatarCell = map.getCell(avatar.getColumn(), avatar.getRow())
	var avatarCreature = avatarCell.getCreature()
	var direction = _directions.opposite(avatarCreature.getFacing())
	var candidate = _directions.step(direction, avatar.getColumn(), avatar.getRow())
	var candidateCell = map.getCell(candidate.column, candidate.row)
	if candidateCell!=null && !candidateCell.hasCreature():
		candidateCell.putCreatureData(avatarCell.getCreatureData())
		avatarCell.putCreatureData(null)
		avatar.putColumn(candidate.column)
		avatar.putRow(candidate.row)
		return true
	return false

