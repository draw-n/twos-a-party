extends Control

onready var music_slider = $MusicSlider
onready var sound_slider = $SoundSlider

func _ready():
	var middle = (music_slider.max_value + music_slider.min_value) / 2
	SoundManager.set_music_volume(middle)
	SoundManager.set_sound_volume(middle)
	music_slider.value = middle
	sound_slider.value = middle
	

func _on_MusicSlider_value_changed(value):
	SoundManager.set_music_volume(value)


func _on_SoundSlider_value_changed(value):
	SoundManager.set_sound_volume(value)
