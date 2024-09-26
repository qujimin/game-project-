extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.
# Function to initialize any properties or settings when the node is ready.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    text = "SCORE: " + str(GameManager.score)
# Updates the label text to display the current score from GameManager every frame.
