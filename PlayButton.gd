extends Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    pass # Replace with function body.
# Function to initialize the button or set up any necessary properties when the node is ready.

func _pressed():
    get_tree().change_scene_to_file("res://world.tscn")
# Changes the current scene to "world.tscn" when the button is pressed.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
    pass
# Function that is called every frame, can be used to update button behavior if needed.

func _on_button_2_pressed() -> void:
    pass # Replace with function body.
# Placeholder function for handling a specific button press action; functionality needs to be implemented.

