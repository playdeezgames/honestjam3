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
	_stateTable[_states.MOVE_MENU] = load("res://States/MoveMenuState.gd").new(_terminal, _palette, _states, _game)
	_stateTable[_states.GROUND_INVENTORY] = load("res://States/GroundInventoryState.gd").new(_terminal, _palette, _states, _game)
	_stateTable[_states.INVENTORY] = load("res://States/InventoryState.gd").new(_terminal, _palette, _states, _game)
	_stateTable[_states.INVENTORY_DETAIL] = load("res://States/InventoryDetailState.gd").new(_terminal, _palette, _states, _game)
	_stateTable[_states.EQUIPMENT] = load("res://States/EquipmentState.gd").new(_terminal, _palette, _states, _game)
	_stateTable[_states.EQUIPMENT_DETAIL] = load("res://States/EquipmentDetailState.gd").new(_terminal, _palette, _states, _game)
	_stateTable[_states.INTERACT] = load("res://States/InteractState.gd").new(_terminal, _palette, _states, _game)
	_stateTable[_states.INTERACT_CORNER] = load("res://States/InteractCornerState.gd").new(_terminal, _palette, _states, _game)
	_stateTable[_states.INTERACT_EDGE] = load("res://States/InteractEdgeState.gd").new(_terminal, _palette, _states, _game)
	_stateTable[_states.OBLIVION] = load("res://States/OblivionState.gd").new(_terminal, _palette, _states, _game)
	_stateTable[_states.FIGHT] = load("res://States/FightState.gd").new(_terminal, _palette, _states, _game)
	_stateTable[_states.INTERACT_POTION_SHOPPE] = load("res://States/InteractPotionShoppeState.gd").new(_terminal, _palette, _states, _game)
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
