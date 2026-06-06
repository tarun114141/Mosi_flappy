extends Control
signal resume

@onready var resume_button: Button = $VBoxContainer/resume
@onready var master_bus := AudioServer.get_bus_index("Master")
@onready var sfx_bus := AudioServer.get_bus_index("SFX")
@onready var BG_bus := AudioServer.get_bus_index("BG_music")

@onready var m_audio: HSlider = $VBoxContainer/M_audio
@onready var sfx_audio: HSlider = $VBoxContainer/SFX_audio
@onready var bg_audio: HSlider = $VBoxContainer/BG_audio

func _ready() -> void:
	visible=false
	# Process even when game is paused
	process_mode = Node.PROCESS_MODE_ALWAYS
	# Initialize sliders with current volume levels
	m_audio.value = AudioServer.get_bus_volume_db(master_bus)
	sfx_audio.value = AudioServer.get_bus_volume_db(sfx_bus)
	bg_audio.value = AudioServer.get_bus_volume_db(BG_bus)


func _on_to_main_pressed() -> void:
	# Unpause and return to main menu
	get_tree().paused= false
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_resume_pressed() -> void:
	# Hide menu and resume game
	hide()
	get_tree().paused= false
	resume.emit()


func _on_restart_pressed() -> void:
	# Reset game state and reload main scene
	get_tree().paused=false
	Global.reset() 
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	
func show_menu():
	# Show the pause menu and pause the game tree
	show()
	get_tree().paused = true
	resume_button.grab_focus()

func _on_m_audio_value_changed(value: float) -> void:
	print("M_audio")
	AudioServer.set_bus_volume_db(master_bus, value)
	# Mute if volume is very low
	AudioServer.set_bus_mute(master_bus, value <= -39)


func _on_sfx_audio_value_changed(value: float) -> void:
	print("sfx_audio")
	AudioServer.set_bus_volume_db(sfx_bus, value)
	AudioServer.set_bus_mute(sfx_bus, value <= -39)


func _on_bg_audio_value_changed(value: float) -> void:
	print("BG_music")
	AudioServer.set_bus_volume_db(BG_bus, value)
	AudioServer.set_bus_mute(BG_bus, value <= -39)
