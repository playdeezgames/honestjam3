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
	_terminal.writeLine("Turn Menu:")
	_terminal._color = _palette.YELLOW
	_terminal.writeLine("1) Turn Left")
	_terminal.writeLine("2) Turn Right")
	_terminal.writeLine("3) Turn Around")
	_terminal.writeLine("0) Nevermind")
	_terminal._color = _palette.GRAY
	_terminal.writeLine("")
	_terminal.writeText(">")

func turnLeft():
	_game.turnLeft()
	_terminal._color = _palette.GREEN
	_terminal.writeLine("")
	_terminal.writeLine("")
	_terminal.writeText("You turn left.")

func turnRight():
	_game.turnRight()
	_terminal._color = _palette.GREEN
	_terminal.writeLine("")
	_terminal.writeLine("")
	_terminal.writeText("You turn right.")

func turnAround():
	_game.turnAround()
	_terminal._color = _palette.GREEN
	_terminal.writeLine("")
	_terminal.writeLine("")
	_terminal.writeText("You turn around.")

func handleInput(command):
	match command:
		"0": 
			return { "valid":true, "state": _states.IN_PLAY}
		"1":
			turnLeft()
			return { "valid":true, "state": _states.IN_PLAY}
		"2":
			turnRight()
			return { "valid":true, "state": _states.IN_PLAY}
		"3":
			turnAround()
			return { "valid":true, "state": _states.IN_PLAY}
		_:
			return { "valid":false, "state": _states.TURN_MENU}
