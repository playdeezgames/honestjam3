extends Node

var _columns
var _rows
var _lines
var _color = Color(1,1,1,1)

func _init(columns, rows):
	_columns = columns
	_rows = rows
	_lines=[[]]
	
func scroll():
	while(_lines.size()>_rows):
		_lines.pop_front()

func newLine():
	var line = []
	_lines.push_back(line)
	scroll()
	return line

func write(character):
	var line = _lines[_lines.size()-1]
	if line.size() == _columns:
		line = newLine()
	line.push_back({"character":character, "color":_color})

func writeText(text):
	for character in text:
		write(character.to_ascii()[0])
		
func writeLine(text):
	writeText(text)
	newLine()
	
func replaceLine(text):
	_lines[_lines.size()-1]=[]
	writeText(text)
