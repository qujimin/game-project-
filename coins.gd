extends Area2D


# Called when the node enters the scene tree for the first time.
func collected():
	pass
	
	GameManager.score += 1


func _on_body_entered(body):
	if body.is_in_group("Player"):
		collected()
		queue_free()
