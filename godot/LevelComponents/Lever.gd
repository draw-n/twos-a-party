extends Area2D

var available = true

onready var sprite = $Sprite

signal change_gate_state

func _ready():
	sprite.play('default')

func _on_Lever_body_entered(body):
	if available:
		sprite.play('pressed')
		emit_signal("change_gate_state")
		print("changing gate state from lever")
		available = false


func _on_Sprite_animation_finished():
	if sprite.animation == 'pressing':
		sprite.play('pressed')
