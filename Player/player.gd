extends CharacterBody2D
class_name Player

@export_category("Components")
@export var movement_component: MovementComponent
@export var input_component: InputComponent
@export var dash_component: DashComponent

@onready var player_animation: Node2D = $PlayerAnimation
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var timer_ghost: Timer = $TimerGhost

var ghost_scene = preload("res://Assets/Ghost/ghost.tscn")

var attacking = false
var attack_direction := Vector2.RIGHT

var dashing = false


func _physics_process(delta: float) -> void:
	
	if input_component.get_dash_input() and not dashing:
		dashing = true
		dash_component.dash(input_component.get_axis_input())
	
	if dashing:
		dash_component.handle_dash_movement(self, delta)
		if timer_ghost.is_stopped():
			timer_ghost.start(dash_component.dash_duration/4)
		
	
	else:
		if input_component.get_attack_input() and !attacking:
			attacking = true
			attack_direction = input_component.get_mouse_direction(self)
		
		if attacking:
			movement_component.handle_movement(self, Vector2.ZERO)
		else:
			movement_component.handle_movement(self, input_component.get_axis_input())
	
	player_animation.handle_animation()
	
	move_and_slide()


func end_attack():
	attacking = false


func _on_timer_ghost_timeout() -> void:
	var ghost = ghost_scene.instantiate()
	ghost.set_property(sprite_2d.global_position, sprite_2d)
	get_tree().current_scene.add_child(ghost)
