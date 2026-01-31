extends Node2D

@onready var video_stream_player: VideoStreamPlayer = $VideoStreamPlayer
@export var videos: Array[VideoStream] 

func _ready():
	# Play the video corresponding to the selected character
	video_stream_player.stream = videos[Global.Character]
	
	video_stream_player.play()
    # Connect signal to handle when video ends
	video_stream_player.finished.connect(_on_video_finished)

# Reset game and return to character selection when video ends
func _on_video_finished():
	Global.reset()
	get_tree().change_scene_to_file("res://Scenes/character_selection.tscn")
