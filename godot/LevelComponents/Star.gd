extends Area2D

func _on_Star_body_entered(body):
	queue_free()
