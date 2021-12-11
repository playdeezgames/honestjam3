extends Node

var _terminal
var _palette
var _states
var _game
var itemDescriptors = load("res://Data/Descriptors/ItemDescriptors.gd").new()
var _item = load("res://Data/Factories/Item.gd").new()
const POTION_COST = 10

func _init(terminal, palette, states, game):
	_terminal = terminal
	_palette = palette
	_states = states
	_game = game
	
func showState():
	_terminal._color = _palette.CYAN
	_terminal.writeLine("Potion Shoppe:")
	_terminal._color = _palette.GRAY
	_terminal.writeLine("Yer Jools: "+String(_game.getAvatar().getItemCount(itemDescriptors.JOOLS)))
	_terminal._color = _palette.YELLOW
	if _game.getAvatar().hasItemCount(itemDescriptors.JOOLS, POTION_COST):
		_terminal.writeLine("1) Buy Potion for " + String(POTION_COST) + " jools.")
	_terminal.writeLine("0) Leave")
	_terminal._color = _palette.GRAY
	_terminal.writeLine("")
	_terminal.writeText(">")

func onBuy():
	if _game.getAvatar().hasItemCount(itemDescriptors.JOOLS, POTION_COST):
		_game.getAvatar().removeItemCount(itemDescriptors.JOOLS, POTION_COST)
		_game.getAvatar().addItemData(_item.generate(itemDescriptors.POTION))
		_terminal.writeLine("")
		_terminal.writeLine("")
		_terminal._color = _palette.GREEN
		_terminal.writeLine("You buy a potion from the vendor.")
		return { "valid":true, "state": _states.INTERACT_POTION_SHOPPE}
	return { "valid":false, "state": _states.INTERACT_POTION_SHOPPE}

func handleInput(command):
	match command:
		"0": 
			return { "valid":true, "state": _states.IN_PLAY}
		"1":
			return onBuy()
		_:
			return { "valid":false, "state": _states.INTERACT_POTION_SHOPPE}
