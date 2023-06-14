extends TextureButton

@export var normal_texture: Texture2D;
@export var pressed_texture: Texture2D;
@export var hover_texture: Texture2D;
@export var disabled_texture: Texture2D;
@export var focused_texture: Texture2D;

@export var level: int;
@export var path: String;

@onready var label = $Label
@onready var stars = $HBoxContainer

func _ready():
	if level == 0:
		label.set("test", str(1))
	elif level <= -1:
		label.set("text", str(level + 3))
	else:
		label.set("text", str(level +1))

	self.set("texture_normal", normal_texture);
	self.set("texture_pressed", pressed_texture);
	self.set("texture_hover", hover_texture);
	self.set("texture_disabled", disabled_texture);
	self.set("texture_focused", focused_texture);
	if GameManager.level_info[level]["unlocked"] == false:
		self.set("disabled", true)
	var individual_stars = stars.get_children()
	label.set("visible", !self.disabled)
	if GameManager.level_info[level]["complete"] == true:
		for i in range(GameManager.level_info[level]["stars"]):
			individual_stars[i].show()

func _on_LevelSelectButton_pressed():
	GameManager.current_level = level
	Transitions.change_screen(path)
	SoundManager.play_music("happy")
