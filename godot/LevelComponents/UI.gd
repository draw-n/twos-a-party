extends CanvasLayer

@onready var options = $Options
@onready var count_up_timer = $Control/ColorRect/VBoxContainer/HBoxContainer/Timer
@onready var cat_buttons = $Control/ColorRect/VBoxContainer/HBoxContainer2

var time_elapsed = 0.0

func _ready():
	if GameManager.current_level < 0:
		cat_buttons.queue_free()
	else: 
		for i in range(len(cat_buttons.get_children())):
			cat_buttons.get_children()[i].button_pressed = !((i + 1) in GameManager.selected_players)
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
	if GameManager.current_level >= 0:
		for i in range(len(cat_buttons.get_children())):
			cat_buttons.get_children()[i].button_pressed = !((i + 1) in GameManager.selected_players)
	if Input.is_action_just_pressed("switch"):
		match GameManager.selected_players:
			[1, 2]:
				GameManager.set_selected_players([2, 3])
			[2, 3]:
				GameManager.set_selected_players([1, 3])
			[1, 3]:
				GameManager.set_selected_players([1, 2])
	

func _on_Button_pressed():
	get_tree().reload_current_scene()


func _on_Pause_pressed():
	options.change_visible(true)
	get_tree().set("paused", true)
	


func _on_Cat1_pressed():
	GameManager.set_selected_players([2, 3])


func _on_Cat2_pressed():
	GameManager.set_selected_players([1, 3])


func _on_Cat3_pressed():
	GameManager.set_selected_players([1, 2])
