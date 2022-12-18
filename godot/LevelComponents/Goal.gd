extends Area2D

onready var stars = $Stars

var num = 0

func _process(delta):
	if len(get_overlapping_bodies()) == 3:
		GameManager.level_info[GameManager.current_level]["complete"] = true
		GameManager.level_info[GameManager.current_level]["stars"] = 3 - stars.get_child_count()
		if GameManager.current_level == 12:
			pass
		else:
			GameManager.level_info[GameManager.current_level + 1]["unlocked"] = true
		get_tree().change_scene("res://Levels/LevelSelect.tscn")
