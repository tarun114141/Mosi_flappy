extends Node2D

# References to AudioStreamPlayers for different characters
@onready var BG_mosi: AudioStreamPlayer = $mosi
@onready var BG_rahul: AudioStreamPlayer = $Rahul
@onready var BG_keju: AudioStreamPlayer = $Keju

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Play specific background music based on the selected character
	if Global.Character==0:
		BG_mosi.play()
	if Global.Character==1:
		BG_keju.play()# Replace with function body.
	if Global.Character==2:
		BG_rahul.play()
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
