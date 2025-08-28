extends Node

var cursors = {
	CURSOR_MODES.POINT: {
		CURSORS.IDLE: preload("res://Assets/Cursor/cursors__0.png"),
		CURSORS.CLICK: preload("res://Assets/Cursor/cursors__0.png")
	},
	CURSOR_MODES.HAND: {
		CURSORS.IDLE: preload("res://Assets/Cursor/bnw_18.png"),
		CURSORS.CLICK: preload("res://Assets/Cursor/bnw_19.png"),
	},
	CURSOR_MODES.TARGET: {
		CURSORS.IDLE: preload("res://Assets/Cursor/bnw_42.png"),
		CURSORS.CLICK: preload("res://Assets/Cursor/bnw_42.png")
	}
}

enum CURSORS {IDLE, CLICK}
enum CURSOR_MODES {POINT, HAND, TARGET}

signal cursor_change(cursor, mode)

var current_mode: CURSOR_MODES

func change_cursor(cursor: CURSORS, mode: CURSOR_MODES):
	Input.set_custom_mouse_cursor(cursors[mode][cursor],0,Vector2(0,0))
	current_mode = mode
	
func _ready() -> void:
	change_cursor(CURSORS.IDLE, CURSOR_MODES.TARGET)
	cursor_change.connect(change_cursor)
