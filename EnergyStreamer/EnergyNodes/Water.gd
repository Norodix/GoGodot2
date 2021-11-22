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
	var s = max(E, 0.1) #Dont let it disappear
	$Sprite.scale = Vector2(s, s)
	FieldEffect = Vector2(0, - Uplift * E)
	var h = Height * E / 2
	$CollisionShape2D.shape.extents.y = h
	$CollisionShape2D.transform.origin.y = - h
	pass
