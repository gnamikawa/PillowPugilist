class_name GameManager

extends Node2D

@export var soundTrack: AudioStreamWAV;

@onready var musicManager: MusicManager = $MusicManager;

func _ready():
	print('-- game manager ready --')
	musicManager.crossfade_to(soundTrack)
