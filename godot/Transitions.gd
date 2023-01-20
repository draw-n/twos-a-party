extends CanvasLayer

signal scene_changed()

func _ready():
	control.rect_global_position = Vector2(0, -600)

onready var control = $Control
onready var tween = $Tween

func change_screen(path, delay = 10):
	change_location(control, Vector2(0, -600), Vector2(0, 0))
	
	if get_tree().change_scene(path) == OK:
		yield(get_tree().create_timer(delay), "timeout")
		change_location(control, Vector2(0, 0), Vector2(0, 600))
		emit_signal("scene_changed")
		control.rect_global_position = Vector2(0,-600)
		control.hide()

func change_location(node, start, end):
	tween.set_active(true)
	tween.interpolate_property(node, "rect_global_position", start, end, 0.5, Tween.TRANS_LINEAR)
	yield(tween, "tween_completed")
