extends Node2D

@onready var jump: AudioStreamPlayer = $jump

# Global helper function to play jump sound
func sfx_jump() -> void:
	jump.play()

