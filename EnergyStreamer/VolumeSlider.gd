extends HSlider


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var busindex = AudioServer.get_bus_index("Master")
	self.value = AudioServer.get_bus_volume_db(busindex)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


	
func _on_VolumeSlider_value_changed(value):
	var busindex = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(busindex, value)
	if value == self.min_value:
		AudioServer.set_bus_mute(busindex, true)
	else:
		AudioServer.set_bus_mute(busindex, false)
	pass # Replace with function body.
	pass # Replace with function body.

