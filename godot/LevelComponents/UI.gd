extends CanvasLayer

onready var options = $Options

func _input(event):
	if event.is_action_pressed("ui_pause"):
		options.change_visible(true)
		get_tree().set("paused", true)
	if event.is_action_pressed("ui_redo"):
		get_tree().reload_current_scene()


func _on_Button_pressed():
	get_tree().reload_current_scene()


func _on_Pause_pressed():
	options.change_visible(true)
	get_tree().set("paused", true)
	
