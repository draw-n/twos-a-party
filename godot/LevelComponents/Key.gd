extends Area2D

export (int) var id

func _on_Key_body_entered(body):
	body.keys.append(id)
	queue_free()
