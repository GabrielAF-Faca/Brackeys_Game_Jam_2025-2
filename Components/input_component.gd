extends Node
class_name InputComponent

func get_axis_input()-> Vector2:
	
	return Vector2(
		Input.get_axis("left", "right"),
		Input.get_axis("up", "down")
	)

func get_attack_input()->bool:
	return Input.is_action_just_pressed("attack")

func get_dash_input() -> bool:
	
	if not get_axis_input(): return false
	
	return Input.is_action_just_pressed("dash")

func get_mouse_direction(body: CharacterBody2D) -> Vector2:
	
	return (get_viewport().get_camera_2d().get_global_mouse_position() - body.position).normalized()
