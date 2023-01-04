extends TextureButton

export (Texture) var normal_texture;
export (Texture) var pressed_texture;
export (Texture) var hover_texture;
export (Texture) var disabled_texture;
export (Texture) var focused_texture;

export (int) var level;
export (String) var path;

onready var label = $Label
onready var stars = $HBoxContainer

func _ready():
	if level <= 0:
		label.set("text", str(level + 3))
	else:
		label.set("text", str(level))

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
	get_tree().change_scene(path)
