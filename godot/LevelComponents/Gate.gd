extends StaticBody2D

export (int) var id
export (Vector2) var location_one
export (Vector2) var location_two

var at_location_one = true

onready var tween = $Tween

func _ready():
	self.global_position = location_one

func change_gate():
	match at_location_one:
		true:
			change_location(location_one, location_two)
			
		false:
			change_location(location_two, location_one)
	at_location_one = !at_location_one


func change_location(start, end):
	print("changing location for tween")
	tween.set_active(true)
	tween.interpolate_property(self, "global_position", start, end, 0.5, Tween.TRANS_LINEAR)


func _on_Detection_body_entered(body):
	if id == body.key:
		change_gate()
		body.key = null
