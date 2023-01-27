extends Control

onready var options = $Options

func _on_Play_pressed():
	Transitions.change_screen("res://Levels/LevelSelect.tscn")


func _on_Quit_pressed():
	get_tree().quit()

func _on_Options_pressed():
	options.change_visible(!(options.visible))
