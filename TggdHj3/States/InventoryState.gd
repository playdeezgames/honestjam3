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
	
func describeItems():
	var items = _game.getAvatar().getItems()
	var index = 1
	for item in items:
		_terminal.writeLine(String(index)+") "+item.getDescription())
		index=index+1
	
func showState():
	_terminal._color = _palette.CYAN
	_terminal.writeLine("Inventory:")
	_terminal._color = _palette.YELLOW
	describeItems()
	_terminal.writeLine("0) Nevermind")
	_terminal._color = _palette.GRAY
	_terminal.writeLine("")
	_terminal.writeText(">")

func handleInput(command):
	match command:
		"0": 
			return { "valid":true, "state": _states.IN_PLAY}
		_:
			return { "valid":false, "state": _states.TURN_MENU}
