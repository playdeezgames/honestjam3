extends Node

var _terminal
var _palette
var _states
var _game

func _init(terminal, palette, states, game):
	_terminal = terminal
	_palette = palette
	_states = states
	_game = game

func getItem():
	var index = _game.getCurrentInventoryIndex()
	return _game.getAvatar().getItems()[index]
	
func describeItem():
	_terminal.writeLine(getItem().getDescription())

func showState():
	_terminal._color = _palette.CYAN
	_terminal.writeLine("Inventory Detail:")
	_terminal._color = _palette.GRAY
	describeItem()
	_terminal._color = _palette.YELLOW
	if getItem().getCount()>1:
		_terminal.writeLine("1) Drop All")
		_terminal.writeLine("2) Drop One")
	else:
		_terminal.writeLine("1) Drop")
	if getItem().canEquip():
		_terminal.writeLine("3) Equip")

	_terminal.writeLine("0) Nevermind")
	_terminal._color = _palette.GRAY
	_terminal.writeLine("")
	_terminal.writeText(">")
	
func doDrop():
	var item = getItem()
	_game.getCurrentCell().addItemData(item._item)
	_game.getAvatar().removeItem(_game.getCurrentInventoryIndex())
	_terminal.writeLine("")
	_terminal.writeLine("")
	_terminal._color = _palette.GREEN
	_terminal.writeLine("You drop the item(s).")
	if _game.getAvatar().hasItems():
		return { "valid":true, "state": _states.INVENTORY}
	return { "valid":true, "state": _states.IN_PLAY}

func doDropOne():
	var item = getItem()
	if item.getCount()>1:
		item._item.count = item._item.count - 1
		_game.getCurrentCell().addItemData({"itemType":item._item.itemType, "count":1})
		_terminal.writeLine("")
		_terminal.writeLine("")
		_terminal._color = _palette.GREEN
		_terminal.writeLine("Drop the item.")
		return { "valid":true, "state": _states.INVENTORY_DETAIL}
	return { "valid":false, "state": _states.INVENTORY_DETAIL}

func doEquip():
	if getItem().canEquip():
		var equipSlot = getItem().getEquipSlot()
		if _game.getAvatar().isEquipped(equipSlot):
			_terminal.writeLine("")
			_terminal.writeLine("")
			_terminal._color = _palette.RED
			_terminal.writeLine("Something is already equipped.")
			return { "valid":true, "state": _states.INVENTORY_DETAIL}
		_game.getAvatar().equip(equipSlot, getItem()._item)
		_game.getAvatar().removeItem(_game.getCurrentInventoryIndex())
		_terminal.writeLine("")
		_terminal.writeLine("")
		_terminal._color = _palette.GREEN
		_terminal.writeLine("You equip the item.")
		if _game.getAvatar().hasItems():
			return { "valid":true, "state": _states.INVENTORY}
		return { "valid":true, "state": _states.IN_PLAY}
	return { "valid":false, "state": _states.INVENTORY_DETAIL}

func handleInput(command):
	match command:
		"0": 
			return { "valid":true, "state": _states.INVENTORY}
		"1":
			return doDrop()
		"2":
			return doDropOne()
		"3":
			return doEquip()
		_:
			return { "valid":false, "state": _states.INVENTORY_DETAIL}
