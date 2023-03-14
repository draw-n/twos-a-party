extends Node

var children

func _ready():
	children = self.get_children()

func _process(delta):
	if !(1 in GameManager.selected_players):
		_reselect(children[0], children[1], children[2])
	elif !(2 in GameManager.selected_players):
		_reselect(children[1], children[0], children[2])
	else:
		_reselect(children[2], children[0], children[1])

func _reselect(false_child, true_child_one, true_child_two):
	false_child.set_selected(false)
	true_child_one.set_selected(true)
	true_child_two.set_selected(true)
	
	
