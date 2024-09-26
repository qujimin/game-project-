extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Initial setup when the button node is added to the scene.

func _pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
# Changes the current scene to the menu scene when the button is pressed.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass # This function is called every frame but currently has no behavior.

func _on_button_2_pressed() -> void:
	pass # Placeholder function for an additional button press event.
