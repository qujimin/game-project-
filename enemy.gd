extends Area2D

@export var flip_time = 1
var direction = 1
# Sets initial variables and defines a flip time for changing direction.

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.wait_time = flip_time
# Sets the timer's wait time based on the `flip_time` variable.

func die():
	queue_free()
# Frees the node from the scene, effectively removing it.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	translate(Vector2.LEFT * direction)
	$AnimatedSprite2D.flip_h = direction > 0
# Moves the node in the specified direction and flips the sprite based on the direction.

func _on_timer_timeout() -> void:
	direction *= -1
# Reverses the direction of movement when the timer times out.
