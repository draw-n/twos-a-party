extends Area2D

signal change_gate_state

var entered = false
onready var label = $CanvasLayer/Label

func _process(delta):
	if entered == true and Input.is_action_just_pressed("ui_accept"):
		emit_signal("change_gate_state")
	label.set("visible", entered)

func _on_Lever_body_entered(body):
	entered = true


func _on_Lever_body_exited(body):
	entered = false