extends KinematicBody2D

#Current energy level of the node
export(float, 0, 1) var E = 1 #Energy
#Maximum energy level of the node
export(float, 1, 10) var maxE = 1
#Rising of the node in pixels/E
export(int, 0, 600) var Amplitude = 64
#Frequency at unit energy state
export(float, 0, 5) var Freqency = 1
#Direction of bouncing
export(int, "Direction_X", "Direction_Y") var BounceDirection = 1

var rootPos : Vector2
var phase = 0 #0-1 for full rotation

# Called when the node enters the scene tree for the first time.
func _ready():
	rootPos = self.position
	pass # Replace with function body.


func _process(delta):
	phase += delta*Freqency
	phase -= int(phase)
	if (BounceDirection == 0):
		self.position = rootPos + Vector2(sin(phase*2*PI), 0) * Amplitude * E
	else:
		self.position = rootPos + Vector2(0, sin(phase*2*PI)) * Amplitude * E
	pass
