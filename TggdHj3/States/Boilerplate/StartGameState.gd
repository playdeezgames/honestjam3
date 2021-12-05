extends Node

var _terminal
var _palette
var _states
var _game
var _difficulty

func _init(terminal, palette, states, game):
	_terminal = terminal
	_palette = palette
	_states = states
	_game = game
	_difficulty = preload("res://Game/Difficulty.gd").new()
	
func showState():
	_terminal._color = _palette.CYAN
	_terminal.writeLine("Choose Difficulty:")
	_terminal._color = _palette.YELLOW
	_terminal.writeLine("1) Normal")
	_terminal.writeLine("0) Never mind")
	_terminal._color = _palette.GRAY
	_terminal.writeLine("")
	_terminal.writeText(">")

func handleInput(command):
	match command:
		"0": 
			return { "valid":true, "state": _states.MAIN_MENU}
		"1":
			_game.reset(_difficulty.NORMAL)
			return {"valid":true, "state":_states.IN_PLAY}
		_:
			return { "valid":false, "state": _states.START_GAME}
