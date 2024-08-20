extends Area2D
@export var flip_time = 1
var direction = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Timer.wait_time = flip_time


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	translate(Vector2.LEFT * direction)
	$AnimatedSprite2D.flip_h = direction > 0
	

func _on_timer_timeout() -> void:
	direction *= -1
