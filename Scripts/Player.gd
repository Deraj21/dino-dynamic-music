extends KinematicBody2D

export var speed: = Vector2(15000.0, 3000.0)
export var gravity: = 3000.0
var jump_force: = -1000.0
var velocity: = Vector2(0.0, -10.0)
var x_dir: = 1.0
var up: = Vector2(0, -1)

# Called when the node enters the scene tree for the first time.
func _ready():
#	$AnimatedSprite.play('idle')
	pass

func _physics_process(delta):
	#	INPUTS
	if Input.is_action_pressed("player_right"):
		x_dir = 1.0
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("player_left"):
		x_dir = -1.0
		$AnimatedSprite.flip_h = true
	else:
		x_dir = 0

	if Input.is_action_pressed("player_right") && Input.is_action_pressed("player_left"):
		x_dir = 0
		
#	handle jump
	if Input.is_action_pressed("player_jump") and is_on_floor():
		velocity.y += jump_force

#	update velocity
	velocity.x = speed.x * x_dir * delta
	velocity.y += gravity * delta
	velocity.y = min(velocity.y, speed.y)
	
	velocity = move_and_slide(velocity, up)

#	animations
	if Input.is_action_pressed("player_crouch"):
		if abs(x_dir) > 0.0:
			$AnimatedSprite.play('crouch-run')
		else:
			$AnimatedSprite.play('crouch-idle')
	else:
		if abs(x_dir) > 0.0:
			$AnimatedSprite.play('run')
		else:
			$AnimatedSprite.play('idle')


