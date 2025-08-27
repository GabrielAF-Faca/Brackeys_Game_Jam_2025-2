extends Node
class_name MovementComponent


func handle_movement(body: CharacterBody2D, direction: Vector2, speed: float):
	
	if direction != Vector2.ZERO:
		body.velocity = body.velocity.move_toward(direction.normalized()*speed, body.accel_speed)
	else:
		body.velocity = body.velocity.move_toward(Vector2.ZERO, body.decel_speed)
		
