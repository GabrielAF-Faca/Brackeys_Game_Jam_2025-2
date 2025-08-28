extends Sprite2D


func _ready():
	ghosting()
	
func set_property(tx_pos, sprite:Sprite2D):
	global_position = tx_pos
	scale = sprite.scale
	rotation = sprite.rotation
	texture = sprite.texture
	hframes = sprite.hframes
	vframes = sprite.vframes
	frame = sprite.frame
	frame_coords = sprite.frame_coords


func ghosting():
	
	var tween_fade = get_tree().create_tween()
	
	tween_fade.tween_property(self, "self_modulate", Color(1.0, 1.0, 1.0, 0.0), 0.15)
	
	await tween_fade.finished
	
	queue_free()


#func set_properties(sprite: Sprite2D):
	#sprite_2d.texture = sprite.texture
	#sprite_2d.modulate = Color(1.0, 1.0, 1.0, 0.5)
	#sprite_2d.scale = Vector2(0.9, 0.9)
#
#func fade():
	#var tween = create_tween()
	#tween.tween_property(sprite_2d, "modulate", Color(1.0, 1.0, 1.0, 0.0), 0.1)
	#tween.set_parallel(true)
	#tween.tween_property(sprite_2d, "scale", Vector2(0.5, 0.5), 0.1)
	#tween.tween_callback(queue_free)
	#tween.play()
