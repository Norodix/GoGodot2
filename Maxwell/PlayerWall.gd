extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	self.position.y = get_viewport().get_mouse_position().y


func _on_Area2D_body_entered(body):
	print("Entered: ", body)
	var x = body.position.x
	var dx = x - self.position.x
	var dirx = dx / abs(dx)
	print("Dirx: ", dirx)
	var target = self.position.x - dirx * 35
	print("Target: ", target)
	body.teleporting = true
	body.teleport_target.x = target
	pass # Replace with function body.
