extends Node2D

@export var speed: float = 200.0

@onready var top_cloud: Sprite2D = $Top
@onready var bottom_cloud: Sprite2D = $Bottom

var cloud_width: float

func _ready():
    # Calculate screen width reference based on texture size
	cloud_width = top_cloud.texture.get_size().x * 0.65

func _process(delta):
    # Move both cloud layers
	move_cloud(top_cloud, delta)
	move_cloud(bottom_cloud, delta)

# Moves a cloud sprite to the left and resets its position when it moves off-screen
func move_cloud(cloud: Sprite2D, delta):
	cloud.position.x -= speed * delta
	
	# When fully off screen -> reset to right side to create endless loop
	if cloud.position.x <= -cloud_width:
		cloud.position.x += cloud_width * 2

