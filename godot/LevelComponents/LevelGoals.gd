extends Node2D

onready var goals = $Goals
onready var stars = $Stars
onready var ui = $UI

#func _ready():
#	print(GameManager.level_info)

func _process(delta):
	var goal_sum = 0
	for i in goals.get_children():
		goal_sum += int(i.goal_reached)
	if goal_sum == goals.get_child_count():
		GameManager.level_info[GameManager.current_level]["complete"] = true
		GameManager.level_info[GameManager.current_level]["stars"] = max(GameManager.level_info[GameManager.current_level]["stars"], 3 - stars.get_child_count())
		GameManager.level_info[GameManager.current_level]["fastest_time"] = max(GameManager.level_info[GameManager.current_level]["fastest_time"], ui.time_elapsed)
		if GameManager.current_level == 2:
			Transitions.change_screen("res://GameOver.tscn")
		else:
			GameManager.level_info[GameManager.current_level + 1]["unlocked"] = true
			Transitions.change_screen("res://Levels/LevelSelect.tscn")
			SoundManager.play_music("main")
