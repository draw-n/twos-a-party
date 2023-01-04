extends Area2D

export (float) var jump_height = 0

func _on_Star_body_entered(body):
	if jump_height != 0:
		body.motion.y = -jump_height
	queue_free()
