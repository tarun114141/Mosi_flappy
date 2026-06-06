extends Control

@onready var mosi: Button = $VBoxContainer/mosi

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Set focus to the first button for keyboard/gamepad navigation
	mosi.grab_focus()

func _on_meloni_pressed() -> void:
	# Select character 1 and start game
	Global.Character=1
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_mosi_pressed() -> void:
	# Select character 0 and start game
	Global.Character=0
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_button_pressed() -> void:
	# Select character 2 and start game
	Global.Character=2
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	
	
func _process(delta: float) -> void:
	# Quit game if pause input is pressed on this screen
	if Input.is_action_just_pressed("pause"):
		get_tree().quit()
