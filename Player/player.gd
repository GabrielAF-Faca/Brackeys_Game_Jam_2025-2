extends CharacterBody2D

@export_category("Components")
@export var movement_component: MovementComponent
@export var input_component: InputComponent

@export_category("Attributes")
@export var speed: float = 300.0
@export var accel_speed: float = 18.0
@export var decel_speed: float = 17.0

func _physics_process(delta: float) -> void:
	
	movement_component.handle_movement(self, input_component.get_input(), speed)
	
	move_and_slide()


func _on_mouse_shape_entered(shape_idx: int) -> void:
	Global.cursor_change.emit(Global.CURSORS.HAND_OPEN)


func _on_mouse_shape_exited(shape_idx: int) -> void:
	Global.cursor_change.emit(Global.CURSORS.HAND_POINT)
