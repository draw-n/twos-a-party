extends Node2D

onready var gate = $ButtonGate
onready var buttons = $Buttons

func _ready():
	for i in buttons.get_children():
		i.connect("change_gate_state", gate, "change_gate")
