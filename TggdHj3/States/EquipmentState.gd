extends Node

var _terminal
var _palette
var _states
var _game

var equipSlotDescriptors = load("res://Data/Descriptors/EquipSlotDescriptors.gd").new()

func _init(terminal, palette, states, game):
	_terminal = terminal
	_palette = palette
	_states = states
	_game = game
	
func describeEquipSlots():
	var index = 1
	for equipSlot in _game.getAvatar().getEquippedSlots():
		var descriptor = equipSlotDescriptors.getDescriptor(equipSlot)
		var item = _game.getAvatar().getEquipped(equipSlot)
		_terminal.writeLine(String(index)+") "+item.getDescription()+"("+descriptor.description+")")
		index = index + 1
	
func showState():
	_terminal._color = _palette.CYAN
	_terminal.writeLine("Equipment:")
	_terminal._color = _palette.YELLOW
	describeEquipSlots()
	_terminal.writeLine("0) Nevermind")
	_terminal._color = _palette.GRAY
	_terminal.writeLine("")
	_terminal.writeText(">")

func zoomIn(index):
	var equippedSlots = _game.getAvatar().getEquippedSlots()
	if index>=0 && index<equippedSlots.size():
		_game.setCurrentEquipSlot(equippedSlots[index])
		return { "valid":true, "state": _states.EQUIPMENT_DETAIL}
	return { "valid":false, "state": _states.EQUIPMENT}

func handleInput(command):
	match command:
		"0": 
			return { "valid":true, "state": _states.IN_PLAY}
		_:
			return zoomIn(int(command)-1)
