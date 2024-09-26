extends CharacterBody2D

@export var speed = 250.0
@export var jump_velocity = -300.0
@export var acceleration: float = 25.0
@export var jumps = 1

enum state {IDLE, RUNNING, JUMPUP, JUMPDOWN, HURT}

var anim_state = state.IDLE

@onready var animator = $AnimatedSprite2D
@onready var animation_player = $AnimationPlayer

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var start_pos = global_position

func rest():
	global_position = start_pos
	set_physics_process(true)
	anim_state = state.IDLE
# Resets the player's position and state when called.

func update_state(): 
	if anim_state == state.HURT:
		get_tree().change_scene_to_file("res://DEATHNOTE.tscn")
	if is_on_floor():
		if velocity == Vector2.ZERO:
			anim_state = state.IDLE
		elif velocity.x != 0:
			anim_state = state.RUNNING
	else:
		if velocity.y < 0:
			anim_state = state.JUMPUP
		else:
			anim_state = state.JUMPDOWN
# Updates the player's state based on movement and velocity.

func update_animation(direction):
	if direction > 0:
		animator.flip_h = false
	elif direction < 0:
		animator.flip_h = true
	match anim_state:
		state.IDLE:
			animation_player.play("idle")
		state.RUNNING:
			animation_player.play("run")
		state.JUMPUP:
			animation_player.play("jump_up")
		state.JUMPDOWN:
			animation_player.play("jump_down")
		state.HURT:
			animation_player.play("hurt")
# Updates the animation based on the player's state and movement direction.

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * speed, acceleration)
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		
	update_state()
	update_animation(direction)
	move_and_slide()
# Handles the player's movement, gravity, and animation updates in the physics process.

func enemy_checker(enemy):
	if enemy.is_in_group("Enemy") and velocity.y > 0:
		enemy.die()
		velocity.y = jump_velocity
	elif enemy.is_in_group("Hurt"):
		anim_state = state.HURT
# Checks collision with enemies and handles interactions based on velocity and enemy group.

func _on_hit_box_area_entered(area: Area2D) -> void:
	enemy_checker(area)
# Called when another area enters the player's hitbox, checks enemy interactions.

func _on_hit_box_body_entered(body: Node2D) -> void:
	enemy_checker(body)
# Called when a body enters the player's hitbox, checks enemy interactions.

func _on_area_2d_area_entered(area: Area2D) -> void:
	get_tree().change_scene_to_file("res://winscreen.tscn")
# Changes the scene to the win screen when the player enters a designated area.
