extends CanvasLayer

signal scene_changed()

func _ready():
	control.global_position = Vector2(0, -600)

@onready var control = $Control

func change_screen(path, delay = 10):
	change_location(control, Vector2(0, -600), Vector2(0, 0))
	
	if get_tree().change_scene_to_file(path) == OK:
		await get_tree().create_timer(delay).timeout
		change_location(control, Vector2(0, 0), Vector2(0, 600))
		emit_signal("scene_changed")
		control.global_position = Vector2(0,-600)
		control.hide()

func change_location(node, start, end):
	var tween = get_tree().create_tween()
	node.set_global_position(start)
	tween.tween_property(node, "global_position", end, 0.5).set_trans(Tween.TRANS_LINEAR)
