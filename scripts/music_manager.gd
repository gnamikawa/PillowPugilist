class_name MusicManager

extends Node

@onready var _anim_player := $AnimationPlayer
@onready var _trackA := $MusicPlayerA
@onready var _trackB := $MusicPlayerB

@export var initialTrack: AudioStream
@export var transitionScalar: float = 1

# If a queue fails, attach a cb to try again.
signal onTransitionFinished;

func _ready():
	print("-- music manager ready --")
	onTransitionFinished.connect(_debugOnTransitionFinished)
	crossfade_to(initialTrack, 9999) # Dont crossfade

func _debugOnTransitionFinished():
	print("-- Transition completed --")
	if _trackA.playing:
		print("Track A playing")
	if _trackB.playing:
		print("Track B playing")

# Crossfades to a new audio stream 
# Returns false on queue failure
func crossfade_to(audio_stream: AudioStream, speed_scale: float = 1) -> void:
	# If both tracks are playing, we're calling the function in the middle of a fade.
	# We queue the transition instead.
	if _trackA.playing and _trackB.playing:
		print("transition");
		return

	# The `playing` property of the stream players tells us which track is active. 
	# If it's track two, we fade to track one, and vice-versa.
	if _trackB.playing:
		_trackA.stream = audio_stream
		_trackA.play()
		_anim_player.speed_scale = speed_scale
		_anim_player.play("FadeToTrackA")
		onTransitionFinished.emit()
	else:
		_trackB.stream = audio_stream
		_trackB.play()
		_anim_player.speed_scale = speed_scale
		_anim_player.play("FadeToTrackB")
		onTransitionFinished.emit()

func crossfade_out(speed_scale: float):
	var empty_audio_stream = AudioStreamWAV.new()
	crossfade_to(empty_audio_stream, speed_scale)
