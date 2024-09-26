extends Area2D

# Called when the item is collected.
func collected():
    pass
    GameManager.score += 1
# Increments the player's score by 1 when the item is collected.

func _on_body_entered(body):
    if body.is_in_group("Player"):
        collected()
        queue_free()
# Detects when a body enters the area; if it's the player, collects the item and removes it from the scene.
