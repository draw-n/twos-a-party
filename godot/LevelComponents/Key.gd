extends Area2D

export (int) var id
onready var sprite = $Sprite

func _ready():
	sprite.frame = id

func _on_Key_body_entered(body):
	if body.key == null:
		body.key = id
		queue_free()
