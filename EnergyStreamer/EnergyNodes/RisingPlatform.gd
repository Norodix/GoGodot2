extends KinematicBody2D

#Current energy level of the node
export(float, 0, 1) var E = 0 #Energy
#Maximum energy level of the node
export(float, 1, 10) var maxE = 1
#Rising of the node in pixels/E
export(int, 0, 600) var Rising = 64
var rootPos : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	rootPos = self.position
	pass # Replace with function body.


func _process(delta):
	self.position = rootPos +  -Vector2(0, E*Rising)
	pass
