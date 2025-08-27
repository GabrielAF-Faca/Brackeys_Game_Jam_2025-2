extends Node

var cursors = {
	CURSORS.HAND_CLOSED: preload("res://Assets/Cursor/hand_thin_closed.png"),
	CURSORS.HAND_OPEN: preload("res://Assets/Cursor/hand_thin_open.png"),
	CURSORS.HAND_POINT: preload("res://Assets/Cursor/hand_thin_point.png"),
	CURSORS.HAND_CLICK: preload("res://Assets/Cursor/hand_thin_click.png")
}

enum CURSORS {HAND_CLOSED, HAND_OPEN, HAND_POINT, HAND_CLICK}

signal cursor_change(cursor)

func change_cursor(cursor: CURSORS):
	Input.set_custom_mouse_cursor(cursors[cursor],0,Vector2(20,15))
	
func _ready() -> void:
	change_cursor(CURSORS.HAND_POINT)
	cursor_change.connect(change_cursor)
	
