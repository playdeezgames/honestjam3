extends Node

var _table = {
	"0": "0",
	"1": "1",
	"2": "2",
	"3": "3",
	"4": "4",
	"5": "5",
	"6": "6",
	"7": "7",
	"8": "8",
	"9": "9",
	"Kp 0": "0",
	"Kp 1": "1",
	"Kp 2": "2",
	"Kp 3": "3",
	"Kp 4": "4",
	"Kp 5": "5",
	"Kp 6": "6",
	"Kp 7": "7",
	"Kp 8": "8",
	"Kp 9": "9",
	"Enter": "\n",
	"Kp Enter": "\n",
	"Backspace": "\b"
}

var _buffer = ""

func _init():
	pass
	
func doBackspace():
	if(_buffer.length()>0):
		_buffer.erase(_buffer.left()-1,1)
	
func doEnter():
	var result = _buffer
	_buffer = ""
	return { "buffer": result, "newLine": true }
	
func handleInput(input):
	if _table.has(input):
		var translated = _table[input]
		if translated=="\n":
			return doEnter()
		elif translated=="\b":
			doBackspace()
		else:
			_buffer+=translated
	return { "buffer": _buffer, "newLine": false }
			
