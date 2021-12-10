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
	
func describeAvatar(creature):
	_terminal.writeLine("Yer Health: "+String(creature.getHealth())+"/"+String(creature.getMaxHealth()))

func showState():
	_terminal._color = _palette.CYAN
	_terminal.writeLine("COMBAT!")
	_terminal._color = _palette.GRAY
	describeAvatar(_game.getCurrentCell().getCreature())
	var creature = _game.getNextCell().getCreature()
	_terminal.writeLine("You are fighting "+creature.getDescription()+".")
	_terminal._color = _palette.YELLOW
	_terminal.writeLine("To attack, choose a number betwen 1 and 100.")
	_terminal.writeLine("0) Leave Combat")
	_terminal._color = _palette.GRAY
	_terminal.writeLine("")
	_terminal.writeText(">")
	
func onWin():
	_terminal.writeLine("")
	_terminal._color = _palette.GREEN
	_terminal.writeLine("YOU WIN!!!")
	return { "valid":true, "state": _states.MAIN_MENU}
	
func onHit():
	_terminal.writeLine("")
	_terminal.writeLine("")
	_terminal._color = _palette.GREEN
	_terminal.writeLine("Correct! Victory!")
	_game.getNextCell().putCreatureData(null)
	if _game.isWin():
		return onWin()
	#TODO: creature drops?
	return { "valid":true, "state": _states.IN_PLAY}
	
func onDead():
	_terminal.writeLine("YER DEAD!")
	return { "valid":true, "state": _states.MAIN_MENU}
	
func onMiss(message):
	_terminal.writeLine("")
	_terminal.writeLine("")
	_terminal._color = _palette.RED
	_terminal.writeLine(message)
	_terminal.writeLine("You lose one health!")
	_game.getCurrentCell().getCreature().addWounds(1)
	if _game.getCurrentCell().getCreature().isDead():
		return onDead()
	return { "valid":true, "state": _states.FIGHT}
	
func doAttack(number):
	if number>=1 && number<=100:
		var target = _game.getNextCell().getCreature().getTarget()
		if number==target:
			return onHit()
		elif number<target:
			return onMiss("Yer guess is too low!")
		elif number>target:
			return onMiss("Yer guess is too high!")
	return { "valid":false, "state": _states.FIGHT}
	
func handleInput(command):
	match command:
		"0": 
			return { "valid":true, "state": _states.IN_PLAY}
		_:
			return doAttack(int(command))
