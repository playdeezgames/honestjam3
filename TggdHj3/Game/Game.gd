extends Node

var _data
var _dataWrapper
var _directions = load("res://Data/Factories/Directions.gd").new()
var currentInventoryIndex
var currentEquipSlot

func getCurrentInventoryIndex():
	return currentInventoryIndex

func setCurrentInventoryIndex(index):
	currentInventoryIndex = index
	
func setCurrentEquipSlot(slot):
	currentEquipSlot = slot
	
func getCurrentEquipSlot():
	return currentEquipSlot

func _init():
	_data = load("res://Data/Data.gd").new()
	_dataWrapper = load("res://Data/Wrappers/DataWrapper.gd")

func reset(difficulty):
	_data.reset(difficulty)

func getData():
	return _dataWrapper.new(_data._data)
	
func getAvatar():
	return getData().getAvatar()
	
func getCurrentCell():
	var avatar = getAvatar()
	return getData().getMap().getCell(avatar.getColumn(), avatar.getRow())
	
func getAvatarCreature():
	return getCurrentCell().getCreature()
	
func getNextCell():
	var avatar = getAvatar()
	var creature = getAvatarCreature()
	var direction = creature.getFacing()
	var nextPosition = _directions.step(direction, avatar.getColumn(), avatar.getRow())
	return getData().getMap().getCell(nextPosition.column, nextPosition.row)

func hasGroundItems():
	return getCurrentCell().hasItems()

func turnLeft():
	var data = getData()
	var avatar = getAvatar()
	var creature = data.getMap().getCell(avatar.getColumn(), avatar.getRow()).getCreature()
	creature.turnLeft()

func turnRight():
	var data = getData()
	var avatar = getAvatar()
	var creature = data.getMap().getCell(avatar.getColumn(), avatar.getRow()).getCreature()
	creature.turnRight()

func turnAround():
	var data = getData()
	var avatar = getAvatar()
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

func isWin():
	var data = getData()
	var map = data.getMap()
	for column in map.getColumns():
		for row in map.getRows():
			if !map.getCell(column, row).isWin():
				return false	
	return true
