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
	
func describeEquipmentDetail():
	var slot = _game.getCurrentEquipSlot()
	var slotDescriptor = equipSlotDescriptors.getDescriptor(slot)
	_terminal._color = _palette.GRAY
	var item = _game.getAvatar().getEquipped(slot)
	_terminal.writeLine("Item: " + item.getDescription())
	_terminal.writeLine("Equipped on: " + slotDescriptor.description)
	
func showState():
	_terminal._color = _palette.CYAN
	_terminal.writeLine("Equipment Detail:")
	describeEquipmentDetail()
	_terminal._color = _palette.YELLOW
	_terminal.writeLine("1) Unequip")
	_terminal.writeLine("0) Nevermind")
	_terminal._color = _palette.GRAY
	_terminal.writeLine("")
	_terminal.writeText(">")
	
func onUnequip():
	var slot = _game.getCurrentEquipSlot()
	var item = _game.getAvatar().getEquipped(slot)
	_game.getAvatar().unequip(slot)
	_game.getAvatar().addItemData(item._item)
	if _game.getAvatar().hasEquipped():
		return { "valid":true, "state": _states.EQUIPMENT }
	return { "valid":true, "state": _states.IN_PLAY }

func handleInput(command):
	match command:
		"0": 
			return { "valid":true, "state": _states.EQUIPMENT }
		"1":
			return onUnequip()
		_:
			return { "valid":false, "state": _states.EQUIPMENT_DETAIL }
