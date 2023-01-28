extends CanvasLayer

onready var music_slider = $Control/ColorRect/VBoxContainer/MusicSlider
onready var sound_slider = $Control/ColorRect/VBoxContainer/SoundSlider

#func _process(delta):
#	if get_tree().paused and Input.is_action_just_pressed("ui_pause"):
#		change_visible(false)
#		get_tree().set("paused", false)

func _ready():
	if SoundManager.music_volume == null and SoundManager.sound_volume == null:
		var middle = (music_slider.max_value + music_slider.min_value) / 2
		SoundManager.set_music_volume(middle)
		SoundManager.set_sound_volume(middle)
		music_slider.value = middle
		sound_slider.value = middle
	else:
		music_slider.value = SoundManager.music_volume
		sound_slider.value = SoundManager.sound_volume
	

func _on_MusicSlider_value_changed(value):
	SoundManager.set_music_volume(value)


func _on_SoundSlider_value_changed(value):
	SoundManager.set_sound_volume(value)

func change_visible(show):
	self.visible = show


func _on_Exit_pressed():
	change_visible(false)
	get_tree().set("paused", false)
