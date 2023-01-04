extends CanvasLayer

func _input(event):
	if event.is_action_pressed("ui_pause"):
		get_tree().set("paused", !get_tree().paused)
	if event.is_action_pressed("ui_redo"):
		get_tree().reload_current_scene()


func _on_Button_pressed():
	get_tree().reload_current_scene()


func _on_Pause_pressed():
	get_tree().set("paused", !get_tree().paused)
