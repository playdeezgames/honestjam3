extends Node2D

var texture

var spriteSources = []

const CELL_WIDTH = 16
const CELL_HEIGHT = 16
const CELL_COLUMNS = 80
const CELL_ROWS = 45

onready var terminal = preload("res://Terminal/Terminal.gd").new(CELL_COLUMNS, CELL_ROWS)
onready var palette = preload("res://Terminal/Palette.gd").new()
onready var stateMachine = preload("res://States/Utility/StateMachine.gd").new(terminal, palette)
#onready var woohoo = preload("res://woohoo.wav")

var rng = RandomNumberGenerator.new()
var sfx

func setUpSpriteSources():
	for y in range(16):
		for x in range(16):
			spriteSources.append(Rect2(x*CELL_WIDTH,y*CELL_HEIGHT,CELL_WIDTH,CELL_HEIGHT))
			
func _ready():
	VisualServer.set_default_clear_color(Color(0,0,0,1))
	rng.randomize()
	texture = load("res://romfont8x8.png")
	setUpSpriteSources()
	#TODO: learn about the bus!
	#sfx = preload("res://Sfx.gd").new($AudioStreamPlayer2D)
	#sfx.play(sfx.WOOHOO)
	

func _draw():
	var y = 0
	for line in terminal._lines:
		var x = 0
		for cell in line:
			var destination = Rect2(x*CELL_WIDTH, y*CELL_HEIGHT,CELL_WIDTH, CELL_HEIGHT)
			var source = spriteSources[cell.character]
			var color = cell.color
			draw_texture_rect_region(texture, destination, source, color)
			x+=1
		y+=1

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed:
			if stateMachine.handleInput(event.as_text()):
				update()
