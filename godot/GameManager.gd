extends Node

var current_level = -2;

var level_info = {
	#tutorial 1
	-2: {
		"player_stats": {"acceleration": 0, "max_speed": 0, "friction": 0, "gravity": 0, "jump_force":0},
		"complete": false,
		"unlocked": true,
		"fastest_time": 0.0,
		"stars": 0,
	},
	#tutorial 2
	-1: {
		"player_stats": {"acceleration": 0, "max_speed": 0, "friction": 0, "gravity": 0, "jump_force":0},
		"complete": false,
		"unlocked": false,
		"fastest_time": 0.0,
		"stars": 0,
	},
	#tutorial 3
	0: {
		"player_stats": {"acceleration": 0, "max_speed": 0, "friction": 0, "gravity": 0, "jump_force":0},
		"complete": false,
		"unlocked": false,
		"fastest_time": 0.0,
		"stars": 0
	},
	1: {
		"player_stats": {"acceleration": 0, "max_speed": 0, "friction": 0, "gravity": 0, "jump_force":0},
		"complete": false,
		"unlocked": false,
		"fastest_time": 0.0,
		"stars": 0
	},
	2: {
		"player_stats": {"acceleration": 0, "max_speed": 0, "friction": 0, "gravity": 0, "jump_force":0},
		"complete": false,
		"unlocked": false,
		"fastest_time": 0.0,
		"stars": 0
	},
	3: {
		"player_stats": {"acceleration": 0, "max_speed": 0, "friction": 0, "gravity": 0, "jump_force":0},
		"complete": false,
		"unlocked": false,
		"fastest_time": 0.0,
		"stars": 0
	},
	4: {
		"player_stats": {"acceleration": 0, "max_speed": 0, "friction": 0, "gravity": 0, "jump_force":0},
		"complete": false,
		"unlocked": false,
		"fastest_time": 0.0,
		"stars": 0
	},
	5: {
		"player_stats": {"acceleration": 0, "max_speed": 0, "friction": 0, "gravity": 0, "jump_force":0},
		"complete": false,
		"unlocked": false,
		"fastest_time": 0.0,
		"stars": 0
	},
	6: {
		"player_stats": {"acceleration": 0, "max_speed": 0, "friction": 0, "gravity": 0, "jump_force":0},
		"complete": false,
		"unlocked": false,
		"fastest_time": 0.0,
		"stars": 0
	},
	7: {
		"player_stats": {"acceleration": 0, "max_speed": 0, "friction": 0, "gravity": 0, "jump_force":0},
		"complete": false,
		"unlocked": false,
		"fastest_time": 0.0,
		"stars": 0
	},
	8: {
		"player_stats": {"acceleration": 0, "max_speed": 0, "friction": 0, "gravity": 0, "jump_force":0},
		"complete": false,
		"unlocked": false,
		"fastest_time": 0.0,
		"stars": 0
	},
	9: {
		"player_stats": {"acceleration": 0, "max_speed": 0, "friction": 0, "gravity": 0, "jump_force":0},
		"complete": false,
		"unlocked": false,
		"fastest_time": 0.0,
		"stars": 0
	},
	10: {
		"player_stats": {"acceleration": 0, "max_speed": 0, "friction": 0, "gravity": 0, "jump_force":0},
		"complete": false,
		"unlocked": false,
		"fastest_time": 0.0,
		"stars": 0
	},
	11: {
		"player_stats": {"acceleration": 0, "max_speed": 0, "friction": 0, "gravity": 0, "jump_force":0},
		"complete": false,
		"unlocked": false,
		"fastest_time": 0.0,
		"stars": 0
	},
	12: {
		"player_stats": {"acceleration": 0, "max_speed": 0, "friction": 0, "gravity": 0, "jump_force":0},
		"complete": false,
		"unlocked": false,
		"fastest_time": 0.0,
		"stars": 0,
	}
}
func _input(event):
	if event.is_action_pressed("ui_pause"):
		get_tree().set("paused", !get_tree().paused)
		print("paused")
