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
	_terminal.writeLine("About Dreamwraiths of SPLORR!!")
	_terminal.writeLine("")
	_terminal._color = _palette.GRAY
	_terminal.writeLine("A Production of TheGrumpyGameDev")
	_terminal.writeLine("For Honest Jam III")
	_terminal.writeLine("")
	_terminal._color = _palette.YELLOW
	_terminal.writeLine("0) Main Menu")
	_terminal._color = _palette.GRAY
	_terminal.writeLine("")
	_terminal.writeText(">")

func handleInput(command):
	match command:
		"0": 
			return { "valid":true, "state": _states.MAIN_MENU}
		_:
			return { "valid":false, "state": _states.ABOUT}
