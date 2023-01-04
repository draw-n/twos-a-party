extends Node2D

export (Vector2) var location_one
export (Vector2) var location_two

var at_location_one = true

onready var gate = $Gate
onready var levers = $Levers
onready var tween = $Gate/Tween

func change_gate():
	match at_location_one:
		true:
			change_location(location_one, location_two)
			
		false:
			change_location(location_two, location_one)
	at_location_one = !at_location_one


func change_location(start, end):
	tween.set_active(true)
	tween.interpolate_property(gate, "global_position", start, end, 0.5, Tween.TRANS_LINEAR)

func _ready():
	gate.global_position = location_one
	for i in levers.get_children():
		i.connect("change_gate_state", self, "change_gate")

