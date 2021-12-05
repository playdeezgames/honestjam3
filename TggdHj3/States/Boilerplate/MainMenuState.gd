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
	_terminal.writeLine("Main Menu:")
	_terminal._color = _palette.YELLOW
	_terminal.writeLine("1) Start")
	_terminal.writeLine("0) Quit")
	_terminal._color = _palette.GRAY
	_terminal.writeLine("")
	_terminal.writeText(">")

func handleInput(command):
	match command:
		"0":
			return { "valid":true, "state": _states.CONFIRM_QUIT}
		"1":
			return { "valid":true, "state": _states.START_GAME}
		_:
			return { "valid":false, "state": _states.MAIN_MENU}
