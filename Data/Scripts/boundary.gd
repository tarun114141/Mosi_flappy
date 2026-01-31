extends Area2D

# Detect when the player hits the boundary (ground or pipes)
@warning_ignore("unused_parameter")
func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	print("collison")
	play_cutscene() 

# Defer the scene change to ensure physics processing is safe
func play_cutscene():
	call_deferred("_change_scene")

# Unpause (just in case) and switch to the 'game over' cutscene
func _change_scene():
	get_tree().paused = false   # IMPORTANT
	get_tree().change_scene_to_file("res://Scenes/bkl.tscn")
