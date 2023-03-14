extends Area2D

export (float) var jump_height = 250

onready var sprite = $Sprite

func _ready():
	sprite.play("default")

func _on_Spring_body_entered(body):
	sprite.play("pressed")
	body.motion.y = -jump_height


func _on_Sprite_animation_finished():
	sprite.play("default")
