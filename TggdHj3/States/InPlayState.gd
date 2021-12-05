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
	
func autoSave():
	var file = File.new()
	file.open("user://autosave.dat", File.WRITE)
	file.store_var(_game._data._data)
	file.close()
	
func showState():
	autoSave()
	_terminal._color = _palette.CYAN
	_terminal.writeLine("In Play:")
	_terminal._color = _palette.GRAY
	var avatarPosition = _game.getAvatarPosition()
	_terminal.writeLine("X:" + String(avatarPosition.column))
	_terminal.writeLine("Y:" + String(avatarPosition.row))
	
	var cell = _game.getData().getMap().getCell(avatarPosition.column, avatarPosition.row)
	
	#var avatarCreature = _game.getAvatarCreature()
	
	_terminal.writeLine("Facing:" + String(cell.creature.facing)) # avatarCreature.getFacing()
	# avatarCreature.setFacing(2)
	_terminal._color = _palette.YELLOW
	_terminal.writeLine("0) Leave Play")
	_terminal._color = _palette.GRAY
	_terminal.writeLine("")
	_terminal.writeText(">")

func handleInput(command):
	match command:
		"0": 
			return { "valid":true, "state": _states.LEAVE_PLAY}
		_:
			return { "valid":false, "state": _states.IN_PLAY}
