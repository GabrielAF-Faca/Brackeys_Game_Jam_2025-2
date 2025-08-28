extends Node2D

@export var animation_tree: AnimationTree
@onready var player: Player = get_owner()


var last_facing_direction := Vector2(0, -1)

func _ready() -> void:
	animation_tree.active = true

func handle_animation():
	var idle = !player.velocity
	
	animation_tree.set("parameters/TimeScale/scale", 1.0)
	if !idle:
		last_facing_direction = player.velocity.normalized()
		animation_tree.set("parameters/TimeScale/scale", max(0.3, player.velocity.length()/player.movement_component.speed))
	
	if player.dashing:
		animation_tree.set("parameters/TimeScale/scale", 1/player.dash_component.dash_duration)
		
	
	animation_tree.set("parameters/PlayerStates/Idle/blend_position", player.input_component.get_mouse_direction(player))
	animation_tree.set("parameters/PlayerStates/Attack/blend_position",player.attack_direction)
	animation_tree.set("parameters/PlayerStates/Run/blend_position", last_facing_direction)
	animation_tree.set("parameters/PlayerStates/Dash/blend_position", player.dash_component.dash_direction)
	
	#animation_tree.set("parameters/blend_position")
