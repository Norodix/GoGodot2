extends Area2D


func _ready():
#	print(get_tree().root.get_child(0))
#	print(get_node("/root/Game"))
	self.connect("body_entered", get_node("/root/Game"), "goal_reached")
	pass # Replace with function body.

