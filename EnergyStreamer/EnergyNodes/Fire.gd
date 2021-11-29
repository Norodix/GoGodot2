#tool
extends Area2D


export(float, 1, 10) var maxE = 1
export(float, 0, 10) var E = 1 #Energy

var sfx_db = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	sfx_db = $AudioStreamPlayer.volume_db
	pass # Replace with function body.


func _process(delta):
	var s = max(E/maxE, 0.01)
	$AnimatedSprite.scale = Vector2(s, s)
	$AnimatedSprite.position.y = (1-s) * 32
	$AudioStreamPlayer.volume_db = log(E / maxE) * 20 + sfx_db
	
	var burtout = (s < 0.2)
	$Particles2D.emitting = burtout
	$AnimatedSprite/DamageZone.monitoring = !burtout
	$AnimatedSprite/DamageZone.monitorable = !burtout
	
	pass
