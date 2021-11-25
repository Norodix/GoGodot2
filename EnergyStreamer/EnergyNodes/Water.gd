tool
extends Area2D


export(float, 0, 1) var E = 1 #Energy
export(float, 1, 10) var maxE = 1
#Uplift field effect added to acceleration as a vector at unit E
export(int, 0, 6000) var Uplift = 2000
#Height of the field at unit E
export(int, 0, 600) var Height = 600


var FieldEffect : Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	var upliftON = E > 0.3
	FieldEffect = Vector2(0, - Uplift * E) if upliftON else Vector2.ZERO
	var h = Height * E / 2
	$CollisionShape2D.shape.extents.y = h
	$CollisionShape2D.transform.origin.y = - h
	
	$Particles2D.process_material.set("initial_velocity", h/$Particles2D.lifetime * 2)
	$Particles2D.emitting = upliftON
	pass
