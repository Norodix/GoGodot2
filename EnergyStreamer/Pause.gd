extends Control

var GameNode : Node

func _ready():
	GameNode = get_tree().root.get_child(0)
	
	# Fill hbox with buttons for each level
	for ButtonIndex in GameNode.levels.size():
		var button = Button.new()
		button.text = str(ButtonIndex+1)
		button.connect("pressed", GameNode, "load_level", [ButtonIndex])
		button.connect("pressed", self, "clearPause")
		$HBoxContainerLevels.add_child(button)
		button.size_flags_horizontal = SIZE_EXPAND_FILL
	pass # Replace with function body.

func _input(event):
	if (event.is_action_pressed("ui_pause")):
		togglePause()


func _on_Resume_pressed():
	clearPause()
	pass # Replace with function body.


func _on_Exit_pressed():
	get_tree().quit(0)
	pass # Replace with function body.
	
func togglePause():
	get_tree().paused = !get_tree().paused
	self.visible = get_tree().paused
	
func clearPause():
	get_tree().paused = false
	self.visible = get_tree().paused


func _on_Restart_pressed():
	GameNode.restart_level()
	clearPause()
	pass # Replace with function body.
