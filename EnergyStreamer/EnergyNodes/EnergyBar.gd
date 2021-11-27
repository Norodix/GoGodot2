tool
extends Node2D

var parent
var fullSize = 30


# Called when the node enters the scene tree for the first time.
func _ready():
	parent = get_parent()
	if parent.get("E") == null:
		parent = null
	pass # Replace with function body.

func _process(delta):
	if parent != null:
		var size = fullSize * parent.E / parent.maxE
		$fg.rect_size = Vector2(size, 6)
		pass
