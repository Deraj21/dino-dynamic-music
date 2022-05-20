extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$MixingDesk.quickplay("DinoSynth")
	$MixingDesk.toggle_mute("DinoSynth", "chords")
	$MixingDesk.toggle_mute("DinoSynth", "percussion")
	$MixingDesk.toggle_mute("DinoSynth", "chorus")




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_note_collected(track_name):
	print("note_collected signal received")
	$MixingDesk.toggle_fade("DinoSynth", track_name)
	
	
