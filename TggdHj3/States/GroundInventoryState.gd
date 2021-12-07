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
	
func showState():
	_terminal._color = _palette.CYAN
	_terminal.writeLine("On the Ground:")
	_terminal._color = _palette.YELLOW
	var index = 1
	for item in _game.getCurrentCell().getItems():
		_terminal.writeLine(String(index)+") "+item.getDescription())
		index = index + 1
	_terminal.writeLine("0) Nevermind")
	_terminal._color = _palette.GRAY
	_terminal.writeLine("")
	_terminal.writeText(">")
	
func tryPickUp(index):
	if index>=0 && index<_game.getCurrentCell().getItems().size():
		var item = _game.getCurrentCell().getItem(index)
		_terminal.writeLine("")
		_terminal.writeLine("")
		_terminal._color = _palette.GREEN
		_terminal.writeLine("You pick up " + item.getDescription() + ".")
		_game.getAvatar().addItemData(item.getItemData())
		_game.getCurrentCell().removeItem(index)
		if _game.getCurrentCell().hasItems():
			return { "valid":true, "state": _states.GROUND_INVENTORY}
		return { "valid":true, "state": _states.IN_PLAY}
	return { "valid":false, "state": _states.GROUND_INVENTORY}

func handleInput(command):
	match command:
		"0": 
			return { "valid":true, "state": _states.IN_PLAY}
		_:
			return tryPickUp(int(command)-1)
