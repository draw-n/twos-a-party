extends Area2D

@export var jump_height: float = 0

@onready var sprite = $Sprite2D

func _ready():
	sprite.play("default")

func _on_Star_body_entered(body):
	SoundManager.play_sound("coin")
	if jump_height != 0:
		body.motion.y = -jump_height
	queue_free()
