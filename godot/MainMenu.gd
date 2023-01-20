extends Control


func _on_Play_pressed():
	Transitions.change_screen("res://Levels/LevelSelect.tscn")


func _on_Quit_pressed():
	get_tree().quit()
