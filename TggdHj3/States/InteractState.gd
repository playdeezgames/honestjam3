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
	
func describeFeatures():
	var features = _game.getCurrentCell().getFeatures()
	var index = 1
	for feature in features:
		_terminal.writeLine(String(index)+") "+feature.getDescription())
		index = index + 1
	
func showState():
	_terminal._color = _palette.CYAN
	_terminal.writeLine("Interact:")
	_terminal._color = _palette.YELLOW
	describeFeatures()
	_terminal.writeLine("0) Nevermind")
	_terminal._color = _palette.GRAY
	_terminal.writeLine("")
	_terminal.writeText(">")
	
func zoomIn(index):
	var features = _game.getCurrentCell().getFeatures()
	if index>=0 && index<features.size():
		var feature = features[index]
		return { "valid":true, "state": feature.getInteractState()}
	return { "valid":false, "state": _states.INTERACT}

func handleInput(command):
	match command:
		"0": 
			return { "valid":true, "state": _states.IN_PLAY}
		_:
			return zoomIn(int(command)-1)
