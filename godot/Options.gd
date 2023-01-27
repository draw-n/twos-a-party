extends CanvasLayer

onready var music_slider = $Control/ColorRect/VBoxContainer/MusicSlider
onready var sound_slider = $Control/ColorRect/VBoxContainer/SoundSlider

func _process(delta):
	if Input.is_action_just_pressed("ui_pause"):
		change_visible(!self.visible)

func _ready():
	var middle = (music_slider.max_value + music_slider.min_value) / 2
	SoundManager.set_music_volume(-80)
	SoundManager.set_sound_volume(-80)
	music_slider.value = middle
	sound_slider.value = middle
	

func _on_MusicSlider_value_changed(value):
	SoundManager.set_music_volume(value)


func _on_SoundSlider_value_changed(value):
	SoundManager.set_sound_volume(value)

func change_visible(show):
	self.visible = show
