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

func describeFeature(feature):
	_terminal.writeLine("You see "+feature.getDescription()+".")
	
func describeFeatures(cell):
	var features = cell.getFeatures()
	for feature in features:
		describeFeature(feature)

func describeTerrain(cell):
	var terrain = cell.getTerrain()
	_terminal.writeLine("You are in " + terrain.getDescription()+".")
	
func describeItems(cell):
	var items = cell.getItems()
	if items.size()>0:
		_terminal.writeLine("On the ground:")
		for item in items:
			_terminal.writeLine(" - " + item.getDescription())
	
func describeAhead(cell):
	if cell!=null:
		var terrain = cell.getTerrain()
		_terminal.writeLine("Ahead of you is " + terrain.getDescription()+".")
		if cell.hasCreature():
			var creature = cell.getCreature()
			_terminal._color = _palette.LIGHT_RED
			_terminal.writeLine("You are facing "+creature.getDescription()+".")
	else:
		_terminal.writeLine("Ahead of you is the empty, lonely void, calling to you.")

func describeAvatar(creature):
	_terminal.writeLine("Health: "+String(creature.getHealth())+"/"+String(creature.getMaxHealth()))

func showState():
	autoSave()
	_terminal._color = _palette.CYAN
	_terminal.writeLine("In Play:")
	_terminal._color = _palette.GRAY
	#var avatar = _game.getAvatar()
	#_terminal.writeLine("X:" + String(avatar.getColumn()))
	#_terminal.writeLine("Y:" + String(avatar.getRow()))
	
	var cell = _game.getCurrentCell()
	#var creature = cell.getCreature()
	#_terminal.writeLine("Facing:" + String(creature.getFacing()))
	
	describeAvatar(cell.getCreature())
	describeTerrain(cell)
	describeFeatures(cell)
	describeItems(cell)
	
	describeAhead(_game.getNextCell())
	
	_terminal._color = _palette.YELLOW
	
	_terminal.writeLine("1) Turn")
	_terminal.writeLine("2) Move")
	if _game.hasGroundItems():
		_terminal.writeLine("3) Take...")
	if _game.getAvatar().hasItems():
		_terminal.writeLine("4) Inventory")
	if _game.getAvatar().hasEquipped():
		_terminal.writeLine("5) Equipment")
	if _game.getCurrentCell().hasFeatures():
		_terminal.writeLine("6) Interact...")
	if _game.getNextCell()!=null && _game.getNextCell().hasCreature():
		_terminal.writeLine("7) Fight!")
	_terminal.writeLine("0) Leave Play")
	_terminal._color = _palette.GRAY
	_terminal.writeLine("")
	_terminal.writeText(">")

func onTake():
	if _game.hasGroundItems():
		return { "valid": true, "state": _states.GROUND_INVENTORY}
	return { "valid": false, "state": _states.IN_PLAY}
	
func onInventory():
	if _game.getAvatar().hasItems():
		return { "valid": true, "state": _states.INVENTORY}
	return { "valid": false, "state": _states.IN_PLAY}
	
func onEquipment():
	if _game.getAvatar().hasEquipped():
		return { "valid": true, "state": _states.EQUIPMENT}
	return { "valid": false, "state": _states.IN_PLAY}
	
func onInteract():
	if _game.getCurrentCell().hasFeatures():
		return { "valid": true, "state": _states.INTERACT}
	return { "valid": false, "state": _states.IN_PLAY}
	
func onFight():
	if _game.getNextCell()!=null && _game.getNextCell().hasCreature():
		return { "valid": true, "state": _states.FIGHT }
	return { "valid": false, "state": _states.IN_PLAY}

func handleInput(command):
	match command:
		"0": 
			return { "valid": true, "state": _states.LEAVE_PLAY}
		"1":
			return { "valid": true, "state": _states.TURN_MENU }
		"2":
			return { "valid": true, "state": _states.MOVE_MENU }
		"3":
			return onTake()
		"4":
			return onInventory()
		"5":
			return onEquipment()
		"6":
			return onInteract()
		"7":
			return onFight()
		_:
			return { "valid": false, "state": _states.IN_PLAY}
