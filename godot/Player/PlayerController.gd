extends Node

var children

func _ready():
	children = self.get_children()
	children[0].selected = true
	children[1].selected = true

func _process(delta):
	if Input.is_action_just_pressed("one"):
		_reselect(children[0], children[1], children[2])
		GameManager.set_selected_players([2, 3])
	if Input.is_action_just_pressed("two"):
		_reselect(children[1], children[0], children[2])
		GameManager.set_selected_players([1, 3])
	if Input.is_action_just_pressed("three"):
		_reselect(children[2], children[0], children[1])
		GameManager.set_selected_players([1, 2])

func _reselect(false_child, true_child_one, true_child_two):
	false_child.set_selected(false)
	true_child_one.set_selected(true)
	true_child_two.set_selected(true)
	
	
