extends Area2D

func _on_Star_body_entered(body):
	body.motion.y = body.JUMP_VELOCITY * 1.5
	queue_free()
