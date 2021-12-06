extends Node

var _terminal
var _palette
var _inputBuffer
var _states
var _stateTable = {}
var _current
var _game

func initializeStates():
	_states = load("res://States/Utility/States.gd").new()
	_stateTable[_states.MAIN_MENU] = load("res://States/Boilerplate/MainMenuState.gd").new(_terminal, _palette, _states)
	_stateTable[_states.CONFIRM_QUIT] = load("res://States/Boilerplate/ConfirmQuitState.gd").new(_terminal, _palette, _states)
	_stateTable[_states.CONFIRM_ABANDON] = load("res://States/Boilerplate/ConfirmAbandonState.gd").new(_terminal, _palette, _states)
	_stateTable[_states.START_GAME]=load("res://States/Boilerplate/StartGameState.gd").new(_terminal, _palette, _states, _game)
	_stateTable[_states.IN_PLAY] = load("res://States/InPlayState.gd").new(_terminal, _palette, _states, _game)
	_stateTable[_states.LEAVE_PLAY] = load("res://States/Boilerplate/LeavePlayState.gd").new(_terminal, _palette, _states, _game)
	_stateTable[_states.ABOUT] = load("res://States/Boilerplate/AboutState.gd").new(_terminal, _palette, _states)
	_stateTable[_states.TURN_MENU] = load("res://States/TurnMenuState.gd").new(_terminal, _palette, _states, _game)
	_current = _states.MAIN_MENU


func _init(terminal, palette):
	_terminal = terminal
	_palette = palette
	_inputBuffer = load("res://Terminal/InputBuffer.gd").new()
	_game = load("res://Game/Game.gd").new()
	initializeStates()
	showState()
	
func showState():
	_terminal.writeLine("")
	_terminal.writeLine("")
	_stateTable[_current].showState()
	
func handleStateCommand(command):
	var result = _stateTable[_current].handleInput(command)
	_current = result.state
	return result.valid

func handleInput(input):
	var result = _inputBuffer.handleInput(input)
	_terminal._color = _palette.GRAY
	_terminal.replaceLine(">" + result.buffer)
	if(result.newLine):
		if(!handleStateCommand(result.buffer)):
			_terminal.writeLine("")
			_terminal.writeLine("")
			_terminal._color = _palette.RED
			_terminal.writeLine("Please enter a valid option.")
		showState()
	return true
