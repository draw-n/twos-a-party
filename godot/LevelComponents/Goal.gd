extends Area2D

onready var stars = $Stars
export (int) var goal_num = 3

var num = 0

func _process(delta):
	if len(get_overlapping_bodies()) == goal_num:
		GameManager.level_info[GameManager.current_level]["complete"] = true
		GameManager.level_info[GameManager.current_level]["stars"] = max(GameManager.level_info[GameManager.current_level]["stars"], 3 - stars.get_child_count())
		if GameManager.current_level == 8:
			pass
		else:
			GameManager.level_info[GameManager.current_level + 1]["unlocked"] = true
		get_tree().change_scene("res://Levels/LevelSelect.tscn")
