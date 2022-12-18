extends Node

var children

func _ready():
	children = self.get_children()
	children[0].selected = true
	children[1].selected = true

func _process(delta):
	if Input.is_action_just_pressed("one"):
		_reselect(children[0], children[1])
	if Input.is_action_just_pressed("two"):
		_reselect(children[1], children[0])

func _reselect(false_child, true_child):
	false_child.set_selected(false)
	true_child.set_selected(true)
	
	
