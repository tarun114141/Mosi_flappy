extends Area2D

var triggered := false
@onready var label: Label = $Label
var texts : Array= []




func _ready() -> void:
	# Select a set of random texts based on the chosen character
	match Global.Character:
		0:
			texts = [
				"Unemployment",
				"Inflation",
				"Education Crisis",
				"Sab changa si",
				"(A+B)²",
				"Mera Rishta",
				"Fakeer",
				
			]
		1:
			texts = [
				"Keju",
				"Daru Badnam Kardi",
				"Nayak",
				"Jail",
				"Slap X4"
			]
		2:
			texts = [
				"Pappu",
				"Aloo",
				"Restart",
				"Ravadi",
			]
		_:
			texts = ["Keep Going"]
		
	# Display a random text from the selected list
	label.text = texts.pick_random()
	

func _on_body_entered(body: Node2D) -> void:
		  
	# Handle player collision with the pipe
	print("collision")
	Global.check_high_score()
	play_cutscene()


func play_cutscene():
	call_deferred("_change_scene")

func _change_scene():
	# Trigger game over sequence
	get_tree().paused = false   # IMPORTANT
	get_tree().change_scene_to_file("res://Scenes/bkl.tscn")
