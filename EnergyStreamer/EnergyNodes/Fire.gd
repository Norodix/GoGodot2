#tool
extends Area2D


export(float, 1, 10) var maxE = 1
export(float, 0, 10) var E = 1 #Energy

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	var s = max(E/maxE, 0.1) #Dont let it disappear
	$Sprite.scale = Vector2(s, s)
	$AudioStreamPlayer.volume_db = log(E / maxE) * 20
	pass
