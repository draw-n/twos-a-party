extends Area2D

var goal_reached = false


func _on_Goal_body_entered(body):
	goal_reached = true


func _on_Goal_body_exited(body):
	goal_reached = false
