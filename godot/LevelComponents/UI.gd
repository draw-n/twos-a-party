extends CanvasLayer

onready var options = $Options
onready var count_up_timer = $Control/ColorRect/HBoxContainer/Timer

var time_elapsed = 0.0

func _input(event):
	if event.is_action_pressed("ui_pause"):
		options.change_visible(true)
		get_tree().set("paused", true)
	if event.is_action_pressed("ui_redo"):
		get_tree().reload_current_scene()

func _process(delta):
	time_elapsed += delta
	var minutes = time_elapsed / 60
	var seconds = fmod(time_elapsed, 60)
	count_up_timer.text = "%02d:%02d" % [minutes, seconds]

func _on_Button_pressed():
	get_tree().reload_current_scene()


func _on_Pause_pressed():
	options.change_visible(true)
	get_tree().set("paused", true)
	
