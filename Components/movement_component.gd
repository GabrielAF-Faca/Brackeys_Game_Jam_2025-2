extends Node
class_name MovementComponent

@export_subgroup("Running Parameters")
@export var speed: float = 200.0
@export var accel_speed: float = 18.0
@export var decel_speed: float = 17.0


func handle_movement(body: CharacterBody2D, direction: Vector2, delta: float=0):
	
	if direction != Vector2.ZERO:
		body.velocity = body.velocity.move_toward(direction.normalized()*speed, accel_speed)
	else:
		body.velocity = body.velocity.move_toward(Vector2.ZERO, decel_speed)
