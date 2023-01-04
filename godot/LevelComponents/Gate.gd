extends Area2D

export (int) var id

onready var collision_shape_2D = $StaticBody2D/CollisionShape2D

func _on_Gate_body_entered(body):
	if id in body.keys:
		collision_shape_2D.set_deferred("disabled", true)
		body.keys.erase(id)
