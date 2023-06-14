extends Area2D

var available = true

@export var id: int

@onready var sprite = $Sprite2D

signal change_gate_state


func _process(delta):
	if available:
		sprite.frame = id * 2
	else:
		sprite.frame = id * 2 + 1

func _on_Lever_body_entered(body):
	if available:
		emit_signal("change_gate_state")
		available = false
