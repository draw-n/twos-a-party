extends Node

var music_volume
var sound_volume

onready var music_player = $MusicPlayer
onready var sound_player = $SoundPlayer

var available_music = {
	"main": preload("res://Audio/Music/MainTheme.wav"),
	"happy": preload("res://Audio/Music/happy.wav")
}

var available_sounds = {
	"key": preload("res://Audio/Sounds/pickupKey.wav"),
	"select": preload("res://Audio/Sounds/blipSelect.wav"),
	"coin": preload("res://Audio/Sounds/pickupCoin.wav"),
	"jump": preload("res://Audio/Sounds/jump.wav")
}

func _ready():
	set_music_volume(-20)
	set_sound_volume(-30)

func play_sound(sound):
	sound_player.stream = available_sounds[sound]
	sound_player.play()

func play_music(music):
	music_player.stream = available_music[music]
	music_player.play()

func set_music_volume(value):
	music_volume = value
	music_player.volume_db = music_volume

func set_sound_volume(value):
	sound_volume = value
	sound_player.volume_db = sound_volume

