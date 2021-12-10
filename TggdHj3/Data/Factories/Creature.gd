extends Node

var directions = load("res://Data/Factories/Directions.gd").new()
var creatureDescriptors = load("res://Data/Descriptors/CreatureDescriptors.gd").new()
var rng = preload("res://Data/Utilities/Rng.gd").new()

func postCreateAvatar(creature):
	creature.maxHealth = 20
	creature.wounds = 0
	creature.facing = directions.generate()
	pass
	
func postCreateDreamWraith(creature):
	creature.target = rng.randi_range(1,100)
	pass

func postCreate(creature):
	if creature.creatureType == creatureDescriptors.AVATAR:
		postCreateAvatar(creature)
	elif creature.creatureType == creatureDescriptors.DREAM_WRAITH:
		postCreateDreamWraith(creature)

func _init():
	pass

func generate(creatureType):
	var result = {}
	result.creatureType = creatureType
	postCreate(result)
	return result
