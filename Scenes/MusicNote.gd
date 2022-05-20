extends Area2D

signal note_collected

export(String, "red", "orange", "yellow", "green", "blue", "purple") var color
export(String, "chords", "chorus", "percussion") var track_name

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("note_collected", get_parent(), "_on_note_collected")
	$AnimatedSprite.play(color)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_body_entered(body):
	print("sending 'note_collected'")
	emit_signal("note_collected", track_name)
	$AnimationPlayer.play("fade_out")
	yield($AnimationPlayer, "animation_finished")
	queue_free()
