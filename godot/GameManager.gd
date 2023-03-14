extends Node

var current_level = 3;
var selected_players = [1, 2] setget set_selected_players, get_selected_players

func set_selected_players(list):
	selected_players = list

func get_selected_players():
	return selected_players

var level_info = {
	#tutorial 1
	-2: {
		"complete": false,
		"unlocked": true,
		"fastest_time": 0.0,
		"stars": 0,
	},
	#tutorial 2
	-1: {
		"complete": false,
		"unlocked": false,
		"fastest_time": 0.0,
		"stars": 0,
	},
	#tutorial 3
	0: {
		"complete": false,
		"unlocked": false,
		"fastest_time": 0.0,
		"stars": 0
	},
	1: {
		"complete": false,
		"unlocked": false,
		"fastest_time": 0.0,
		"stars": 0
	},
	2: {
		"complete": false,
		"unlocked": false,
		"fastest_time": 0.0,
		"stars": 0
	},
	3: {
		"complete": false,
		"unlocked": false,
		"fastest_time": 0.0,
		"stars": 0
	},
	4: {
		"complete": false,
		"unlocked": false,
		"fastest_time": 0.0,
		"stars": 0
	},
	5: {
		"complete": false,
		"unlocked": false,
		"fastest_time": 0.0,
		"stars": 0
	},
	6: {
		"complete": false,
		"unlocked": false,
		"fastest_time": 0.0,
		"stars": 0
	},
	7: {
		"complete": false,
		"unlocked": false,
		"fastest_time": 0.0,
		"stars": 0
	},
	8: {
		"complete": false,
		"unlocked": false,
		"fastest_time": 0.0,
		"stars": 0
	}
}

