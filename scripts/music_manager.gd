class_name MusicManager

extends Node

@onready var _anim_player := $AnimationPlayer
@onready var _trackA := $MusicPlayerA
@onready var _trackB := $MusicPlayerB

# If a queue fails, attach a cb to try again.
signal onTransitionFinished;

# Crossfades to a new audio stream 
# Returns false on queue failure
func crossfade_to(audio_stream: AudioStream) -> bool:
	# If both tracks are playing, we're calling the function in the middle of a fade.
	# We return early to avoid jumps in the sound.
	if _trackA.playing and _trackB.playing:
		return false

	# The `playing` property of the stream players tells us which track is active. 
	# If it's track two, we fade to track one, and vice-versa.
	if _trackB.playing:
		_trackA.stream = audio_stream
		_trackA.play()
		_anim_player.play("FadeToTrackA")
		onTransitionFinished.emit()
		return true
	else:
		_trackB.stream = audio_stream
		_trackB.play()
		_anim_player.play("FadeToTrackB")
		onTransitionFinished.emit()
		return true

func crossfade_out():
	var empty_audio_stream = AudioStreamWAV.new()
	var isCrossfadeQueued = crossfade_to(empty_audio_stream)
	if(!isCrossfadeQueued):
		onTransitionFinished.connect(crossfade_out)
