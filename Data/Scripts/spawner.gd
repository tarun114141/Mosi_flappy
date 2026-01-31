extends Node2D

@export var pipe_scene: PackedScene
@export var spawn_x: int = 250

@onready var timer: Timer = $Timer

func _ready():
	randomize()
    # Apply initial difficulty settings
	Global.apply_difficulty()
	timer.timeout.connect(spawn_pipe)
	start_timer()

func start_timer():
    # Set a random wait time based on current difficulty
	timer.wait_time = randf_range(
		Global.min_spawn_time,
		Global.max_spawn_time
	)
	timer.start()

func spawn_pipe():
    # Instantiate and position a new pipe
	var pipe = pipe_scene.instantiate()
	pipe.global_position.x = spawn_x
	add_child(pipe)

    # Reset timer for next spawn
	start_timer()

