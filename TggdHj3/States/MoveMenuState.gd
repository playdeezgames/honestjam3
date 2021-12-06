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
	_terminal.writeLine("Move Menu:")
	_terminal._color = _palette.YELLOW
	_terminal.writeLine("1) Move Ahead")
	_terminal.writeLine("2) Move Left")
	_terminal.writeLine("3) Move Right")
	_terminal.writeLine("4) Move Back")
	_terminal.writeLine("0) Nevermind")
	_terminal._color = _palette.GRAY
	_terminal.writeLine("")
	_terminal.writeText(">")

func moveAhead():
	if _game.moveAhead():
		_terminal._color = _palette.GREEN
		_terminal.writeLine("")
		_terminal.writeLine("")
		_terminal.writeText("You move ahead.")
		return { "valid":true, "state": _states.IN_PLAY}
	else:
		_terminal._color = _palette.RED
		_terminal.writeLine("")
		_terminal.writeLine("")
		_terminal.writeText("You cannot move that way.")
		return { "valid":true, "state": _states.IN_PLAY}

func moveLeft():
	if _game.moveLeft():
		_terminal._color = _palette.GREEN
		_terminal.writeLine("")
		_terminal.writeLine("")
		_terminal.writeText("You move left.")
		return { "valid":true, "state": _states.IN_PLAY}
	else:
		_terminal._color = _palette.RED
		_terminal.writeLine("")
		_terminal.writeLine("")
		_terminal.writeText("You cannot move that way.")
		return { "valid":true, "state": _states.IN_PLAY}

func moveRight():
	if _game.moveRight():
		_terminal._color = _palette.GREEN
		_terminal.writeLine("")
		_terminal.writeLine("")
		_terminal.writeText("You move right.")
		return { "valid":true, "state": _states.IN_PLAY}
	else:
		_terminal._color = _palette.RED
		_terminal.writeLine("")
		_terminal.writeLine("")
		_terminal.writeText("You cannot move that way.")
		return { "valid":true, "state": _states.IN_PLAY}

func moveBack():
	if _game.moveBack():
		_terminal._color = _palette.GREEN
		_terminal.writeLine("")
		_terminal.writeLine("")
		_terminal.writeText("You move back.")
		return { "valid":true, "state": _states.IN_PLAY}
	else:
		_terminal._color = _palette.RED
		_terminal.writeLine("")
		_terminal.writeLine("")
		_terminal.writeText("You cannot move that way.")
		return { "valid":true, "state": _states.IN_PLAY}

func handleInput(command):
	match command:
		"0": 
			return { "valid":true, "state": _states.IN_PLAY}
		"1":
			return moveAhead()
		"2":
			return moveLeft()
		"3":
			return moveRight()
		"4":
			return moveBack()
		_:
			return { "valid":false, "state": _states.TURN_MENU}
