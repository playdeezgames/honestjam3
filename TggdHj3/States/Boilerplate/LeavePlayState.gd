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
	_terminal.writeLine("Leave Game:")
	_terminal._color = _palette.YELLOW
	_terminal.writeLine("1) Abandon Game")
	_terminal.writeLine("0) Continue")
	_terminal._color = _palette.GRAY
	_terminal.writeLine("")
	_terminal.writeText(">")

func handleInput(command):
	match command:
		"0": 
			return { "valid":true, "state": _states.IN_PLAY}
		"1":
			return {"valid":true, "state":_states.CONFIRM_ABANDON}
		_:
			return { "valid":false, "state": _states.LEAVE_PLAY}
