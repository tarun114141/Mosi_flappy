extends Node

# Global state variables
var score: int = 0
var difficulty_level: int = 1

# Current game parameters
var pipe_speed: int = 200
var min_spawn_time: float = 1.8
var max_spawn_time: float = 2.5

# High score persistence
var H_score: int = 0
const SAVE_PATH := "user://save.dat"

# Selected character index
var Character: int = 1

# Difficulty configurations for each level
const DIFFICULTY = {
	1: { "speed": 200, "min_time": 1.8, "max_time": 2.5 },
	2: { "speed": 260, "min_time": 1.4, "max_time": 2.0 },
	3: { "speed": 330, "min_time": 1.0, "max_time": 1.5 },
	4: { "speed": 420, "min_time": 0.8, "max_time": 1.2 }
}

func _ready():
	# Load high score on game start
	load_high_score()

func apply_difficulty():
	# Update game parameters based on current level
	var data = DIFFICULTY[difficulty_level]
	pipe_speed = data.speed
	min_spawn_time = data.min_time
	max_spawn_time = data.max_time

func reset():
	# Reset game state to initial values
	score = 0
	difficulty_level = 1
	apply_difficulty()

func update_difficulty():
	# Increase difficulty based on score milestones
	if score == 10:
		difficulty_level = 2
	elif score == 20:
		difficulty_level = 3
	elif score == 30:
		difficulty_level = 4

	apply_difficulty()

func save_high_score():
	print("Saved high score:", H_score)
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_32(H_score)
		file.close()

func load_high_score():
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		if file:
			H_score = file.get_32()
			file.close()
			print("Loaded high score:", H_score)
	else:
		H_score = 0

func check_high_score():
	print("Checking h sp")
	if score > H_score:
		H_score = score
		save_high_score()
