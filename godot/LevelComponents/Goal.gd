extends Area2D

onready var stars = $Stars
export (int) var goal_num = 1

var num = 0

func _process(delta):
	if len(get_overlapping_bodies()) == goal_num:
		GameManager.level_info[GameManager.current_level]["complete"] = true
		GameManager.level_info[GameManager.current_level]["stars"] = max(GameManager.level_info[GameManager.current_level]["stars"], 3 - stars.get_child_count())
		if GameManager.current_level == 8:
			Transitions.change_screen("res://GameOver.tscn")
		else:
			GameManager.level_info[GameManager.current_level + 1]["unlocked"] = true
		Transitions.change_screen("res://Levels/LevelSelect.tscn")
