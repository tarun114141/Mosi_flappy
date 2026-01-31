extends Control

@onready var start: Button = $VBoxContainer/Start
@onready var h_score: Label = $VBoxContainer/H_score


func _ready() -> void:
    # Display the stored high score
	h_score.text="High Score: " + str(Global.H_score)
	
    # Set initial focus
	start.grab_focus()

func _on_start_pressed() -> void:
    # Go to character selection screen
	get_tree().change_scene_to_file("res://Scenes/character_selection.tscn") 

func _on_button_pressed() -> void:
    # Quit the game
	get_tree().quit()
	
func _process(delta: float) -> void:
    # Handle quit shortcut
	if Input.is_action_just_pressed("pause"):
		get_tree().quit()

