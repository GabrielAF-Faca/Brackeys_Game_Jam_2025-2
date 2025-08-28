extends Node
class_name DashComponent

@export_subgroup("Dash Parameters")
@export var dash_duration: float = 0.4
@export var dash_speed: float = 300


var dash_direction := Vector2(1,0)
var dash_timer: float = 0.0


func dash(direction: Vector2):
	dash_direction = direction
	dash_timer = dash_duration

func handle_dash_movement(body: CharacterBody2D, delta: float):

	var elapsed_percent = 1.0 - (dash_timer/dash_duration)
	var current_speed = lerp(dash_speed, dash_speed*0.5, elapsed_percent)
	
	body.velocity = dash_direction.normalized() * current_speed
	dash_timer -= delta
	
	if dash_timer <= 0.0:
		dash_direction = Vector2.ZERO
		body.dashing = false
