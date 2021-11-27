tool
extends Area2D


export(float, 0, 1) var E = 1 #Energy
export(float, 1, 10) var maxE = 1
export(int, 1, 5) var width = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.modulate.g = 0;
	$Sprite.modulate.b = 0;
	pass # Replace with function body.


func _process(delta):
	$Sprite.modulate.r = 0.3 + E * 1.3
	var frozen = E < 0.01
	#Disable damage when the lava is frozen
	$DamageZone/CollisionShape2D.disabled = frozen
	#Enable walking when frozen
	$WalkZone/CollisionShape2D.disabled = !frozen
	if frozen:
		$Sprite.modulate.r = 0
		$Particles2D.emitting = false
	pass
