extends Area2D


export(float, 0, 1) var E = 1 #Energy

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	var s = max(E, 0.1) #Dont let it disappear
	$Sprite.scale = Vector2(s, s)
	pass
