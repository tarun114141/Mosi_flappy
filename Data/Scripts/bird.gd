extends CharacterBody2D


const JUMP_VELOCITY = -400.0
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var score_label: Label = $Camera2D/Control/score
@onready var paused: Control = $CanvasLayer/Paused
@export var characters: Array[SpriteFrames]


func _ready() -> void:
    # Set the bird's appearance based on selected character
	animation.sprite_frames= characters[Global.Character]
	animation.play("idle")

func _physics_process(delta: float) -> void:
	# Update the score display
	score_label.text="SCORE: " + str(Global.score)
    
    # Add gravity if not on the floor
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump input
	if Input.is_action_just_pressed("Jump") :
		velocity.y = JUMP_VELOCITY
		Sfx.sfx_jump()
		animation.play("jump")
		
	# Switch back to idle animation when falling
	if velocity.y > 0:
		animation.play("idle")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	
	#velocity.x = SPEED
	
	# Move the character
	move_and_slide()
	
# Handle pause input	
func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		get_tree().paused = not get_tree().paused
		
		paused.visible = get_tree().paused
		paused.show_menu()
	

 # Replace with function body.
