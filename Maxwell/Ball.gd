extends RigidBody2D

var teleporting = false
var teleport_target = Vector2(0, 0)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _integrate_forces(state):
	if (teleporting):
		teleporting = false
		#TODO check if ball would overlap there, only move if not
		state.transform.origin.x = teleport_target.x
	pass
