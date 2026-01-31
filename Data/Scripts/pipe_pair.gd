extends Node2D

@export var speed: int  = 200
@export var gap_size: int = 160
@export var min_y: int  = -250
@export var max_y: int = 250

#@onready var top_pipe = $top
#@onready var bottom_pipe = $bottom
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
    # Randomize the vertical position of the pipe gap
	global_position = Vector2(900, randi_range(min_y, max_y))

	
# Called every frame. 'delta' is the elapsed time since the previous frame.


func _process(delta):
    # Move pipe left based on global speed
	global_position.x -= Global.pipe_speed * delta

    # Destroy pipe when it goes off screen
	if global_position.x < -850:
		queue_free()



func _on_area_2d_body_entered(body: Node2D) -> void:
    # Increment score when player passes through the gap (Area2D sensor)
	Global.score += 1
	Global.update_difficulty()
	print("score",Global.score, " Difficultu", Global.difficulty_level) 

