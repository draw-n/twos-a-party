extends KinematicBody2D

export (bool) var selected setget set_selected, get_selected

func set_selected(value):
	selected = value

func get_selected():
	return selected
export (Texture) var CHARACTER_SPRITE
export (int) var ACCELERATION = 1000
export (int) var MAX_SPEED = 200
export (float) var FRICTION = .25
export (int) var GRAVITY = 300
export (int) var JUMP_FORCE = 200

onready var sprite = $Sprite
onready var indicator = $Indicator
#onready var animationPlayer = $AnimationPlayer
onready var collision_shape2D = $CollisionShape2D

var motion = Vector2.ZERO
var double_jump = true

# Called when the node enters the scene tree for the first time.
func _ready():
	if CHARACTER_SPRITE != null:
		sprite.texture = CHARACTER_SPRITE



func _physics_process(delta):
	indicator.visible = get_selected()
	var x_input = 0
	if selected:
		x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if x_input != 0:
			
		motion.x += x_input * ACCELERATION * delta
		motion.x = clamp(motion.x, -MAX_SPEED, MAX_SPEED)
		sprite.flip_h = x_input < 0
		#animationPlayer.play("Move")
	else:
		#animationPlayer.play("Idle")
		motion.x = lerp(motion.x, 0, FRICTION)
		
	
	motion.y += GRAVITY * delta 
	
	if is_on_floor():
		var y_input = 0
		if selected == true:
			y_input = Input.is_action_just_pressed("ui_up")
		if y_input:
			motion.y = -JUMP_FORCE
		double_jump = true
	else:

		#animationPlayer.play("Idle")
	#	if double_jump == true:
	#		if Input.is_action_just_pressed("ui_up"):
	#			motion.y = -JUMP_FORCE
	#			double_jump = false
		#animationPlayer.play("Jump")

		if Input.is_action_just_released("ui_up") and motion.y < -JUMP_FORCE/2:
					motion.y = -JUMP_FORCE/2
	
	motion = move_and_slide(motion, Vector2.UP)
