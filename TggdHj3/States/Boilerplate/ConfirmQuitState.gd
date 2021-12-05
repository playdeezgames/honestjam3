extends Node

var _terminal
var _palette
var _states

func _init(terminal, palette, states):
	_terminal = terminal
	_palette = palette
	_states = states
	
func showState():
	_terminal._color = _palette.CYAN
	_terminal.writeLine("Are you sure you want to quit?")
	_terminal._color = _palette.YELLOW
	_terminal.writeLine("1) Yes")
	_terminal.writeLine("0) No")
	_terminal._color = _palette.GRAY
	_terminal.writeLine("")
	_terminal.writeText(">")

func handleInput(command):
	match command:
		"0": 
			return { "valid":true, "state": _states.MAIN_MENU}
		"1": 
			_terminal._color = _palette.BROWN
			_terminal.writeLine("")
			_terminal.writeLine("")
			_terminal.writeLine("One day, I figure out how to make the game quit. Until then.... YOU ARE STUCK HERE!")
			return { "valid":true, "state": _states.MAIN_MENU}
		_:
			return { "valid":false, "state": _states.CONFIRM_QUIT}
