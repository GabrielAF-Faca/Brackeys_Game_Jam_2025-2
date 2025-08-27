extends Node
class_name InputComponent

func get_input()-> Vector2:
	
	return Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	)
