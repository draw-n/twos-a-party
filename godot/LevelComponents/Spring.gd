extends Area2D

export (float) var jump_height = 250

func _on_Spring_body_entered(body):
	body.motion.y = -jump_height
