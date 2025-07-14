extends CharacterBody2D

@export var speed: int = 400
@export var jump_velocity: int = -800
var gravity: int = 2000
asdsad
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0
		
	var is_moving = false
	var isDash = Input.is_key_pressed(KEY_SPACE)
	velocity.x = 0
	var direction = 0
	if Input.is_action_pressed("ui_right"):
		direction = 1
		velocity.x += speed
		is_moving = true
		$Sprite.flip_h = false  # Flip sprite to face right
	elif Input.is_action_pressed("ui_left"):
		direction = -1
		velocity.x -= speed
		is_moving = true
		$Sprite.flip_h = true   # Flip sprite to face left

	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = jump_velocity
		
	velocity.x = direction * speed
		
	if isDash:
		velocity.x += direction * 1000

	move_and_slide()

	# Handle animations
	if isDash:
		$Sprite.play("dash")
	elif not is_on_floor():
		$Sprite.play("jump")
	elif Input.is_key_pressed(KEY_D):
		$Sprite.play("fight-combo")
	elif is_moving:
		$Sprite.play("walk")
	else:
		$Sprite.play("idle")
	
#func _ready():
	#$Sprite.play("idle")
