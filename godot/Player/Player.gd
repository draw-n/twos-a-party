extends KinematicBody2D

export (bool) var selected setget set_selected, get_selected

enum {
	SIT,
	STAND
}

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
export (float) var JUMP_HEIGHT = 100
export (float) var JUMP_TIME_TO_PEAK = 0.5
export (float) var JUMP_TIME_TO_DESCEND = 0.4

onready var JUMP_VELOCITY = ((2.0 * JUMP_HEIGHT) / JUMP_TIME_TO_PEAK) * -1.0
onready var JUMP_GRAVITY = ((-2.0 * JUMP_HEIGHT) / (JUMP_TIME_TO_PEAK * JUMP_TIME_TO_PEAK)) * -1.0
onready var FALL_GRAVITY = ((-2.0 * JUMP_HEIGHT) / (JUMP_TIME_TO_DESCEND * JUMP_TIME_TO_DESCEND)) * -1.0
onready var sprite = $Sprite
onready var indicator = $Indicator
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var collision_shape2D = $CollisionShape2D
onready var timer = $Timer

var state = SIT
var motion = Vector2.ZERO
var started = false
var double_jump = true
# Called when the node enters the scene tree for the first time.
func _ready():
	if CHARACTER_SPRITE != null:
		sprite.texture = CHARACTER_SPRITE
	animationTree.active = true
	animationTree.set("parameters/Stand/blend_position", 1)
	animationTree.set("parameters/Run/blend_position", 1)
	animationTree.set("parameters/Sit/blend_position", 1)
	animationTree.set("parameters/Jump/blend_position", 1)
	animationTree.set("parameters/SitToJump/blend_position", 1)
	animationTree.set("parameters/SitToRun/blend_position", 1)
	animationTree.set("parameters/StandToSit/blend_position", 1)

func get_gravity():
	return JUMP_GRAVITY if motion.y < 0.0 else FALL_GRAVITY

func _physics_process(delta):
	indicator.visible = get_selected()
	var x_input = 0
	if selected:
		x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if x_input != 0:
		started = false
		state = STAND
		motion.x += x_input * ACCELERATION
		motion.x = clamp(motion.x, -MAX_SPEED, MAX_SPEED)
		animationTree.set("parameters/Stand/blend_position", x_input)
		animationTree.set("parameters/Run/blend_position", x_input)
		animationTree.set("parameters/Sit/blend_position", x_input)
		animationTree.set("parameters/Jump/blend_position", x_input)
		animationTree.set("parameters/SitToJump/blend_position", x_input)
		animationTree.set("parameters/SitToRun/blend_position", x_input)
		animationTree.set("parameters/StandToSit/blend_position", x_input)
		animationState.travel("Run")
	else:
		if started == false:
			timer.start(3)
			started = true
		match state:
			SIT:
				animationState.travel("Sit")
			STAND:
				animationState.travel("Stand")
				
		motion.x = lerp(motion.x, 0, FRICTION)
		
	
	motion.y += get_gravity() * delta 
	
	if is_on_floor():
		var y_input = 0
		if selected == true:
			y_input = Input.is_action_just_pressed("ui_up")
		if y_input:
			motion.y = JUMP_VELOCITY
		double_jump = true
	else:
		started = false
		state = STAND
		animationState.travel("Jump")

		#animationPlayer.play("Idle")
	#	if double_jump == true:
	#		if Input.is_action_just_pressed("ui_up"):
	#			motion.y = -JUMP_FORCE
	#			double_jump = false
		#animationPlayer.play("Jump")

		if Input.is_action_just_released("ui_up") and motion.y < JUMP_VELOCITY/2:
					motion.y = JUMP_VELOCITY/2
	
	motion = move_and_slide(motion, Vector2.UP)

func _on_Timer_timeout():
	state = SIT


