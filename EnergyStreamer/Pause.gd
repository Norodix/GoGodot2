extends Control

func _ready():
	pass # Replace with function body.

func _input(event):
	if (event.is_action_pressed("ui_pause")):
		togglePause()


func _on_Resume_pressed():
	clearPause()
	pass # Replace with function body.


func _on_Exit_pressed():
	print("Cannot exit HAHAHAHAHA")
	pass # Replace with function body.
	
func togglePause():
	get_tree().paused = !get_tree().paused
	self.visible = get_tree().paused
	
func clearPause():
	get_tree().paused = false
	self.visible = get_tree().paused
