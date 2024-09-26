extends CanvasLayer

var time = Global.speedrun_time

func _physics_process(delta):
	time = float(time) + delta
	update_ui()
	# Updates the time variable by adding delta to the current time.

func update_ui():
	# Format time with two decimal places
	var formatted_time = str(time)
	var decimal_index = formatted_time.find(".")
	
	if decimal_index > 0:
		formatted_time = formatted_time.left(decimal_index + 3)  # Take only two decimal places
	
	Global.speedrun_time = formatted_time
	$Label.text = formatted_time
	# Formats the time to two decimal places and updates the global variable and the UI label.
