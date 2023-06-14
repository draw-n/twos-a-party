extends StaticBody2D

@export var id: int
@export var location_one: Vector2
@export var location_two: Vector2

@onready var tween = $Tween
@onready var sprite = $Sprite2D

var at_location_one = true

func _ready():
	self.global_position = location_one
	sprite.frame = id
	

func change_gate():
	match at_location_one:
		true:
			change_location(location_one, location_two)
			
		false:
			change_location(location_two, location_one)
	at_location_one = !at_location_one


func change_location(start, end):
	tween.set_active(true)
	tween.interpolate_property(self, "global_position", start, end, 0.5, Tween.TRANS_LINEAR)


func _on_Detection_body_entered(body):
	if id == body.key:
		change_gate()
		body.set_key(null)
