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
	_terminal.writeLine("You are in oblivion.")
	_terminal._color = _palette.GRAY
	_terminal.writeLine("")
	_terminal.writeText(">")

func handleInput(command):
	return { "valid":false, "state": _states.OBLIVION}
