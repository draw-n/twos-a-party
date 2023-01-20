extends Node

onready var music_player = $MusicPlayer
onready var sound_player = $SoundPlayer

var available_music = {
	"november": preload("res://Audio/Music/Kai Engel - November.mp3")
}

var available_sounds = {
	
}

func _ready():
	play_music("november")
	set_music_volume(-80)
	set_sound_volume(-80)

func play_sound(sound):
	sound_player.stream = available_sounds[sound]
	sound_player.play()

func play_music(music):
	music_player.stream = available_music[music]
	music_player.play()

func set_music_volume(value):
	music_player.volume_db = value

func set_sound_volume(value):
	sound_player.volume_db = value
