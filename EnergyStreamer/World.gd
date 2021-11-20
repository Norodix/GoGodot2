extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
	
func findEnergyStorage(mousePos : Vector2):
	var space = get_world_2d().direct_space_state
	var collision_objects = space.intersect_point(mousePos, 32, [], 2, true, true)
	if (collision_objects):
		return collision_objects[0]
	else:
		return null


func _process(delta):
	#if Input.is_action_just_pressed("ui_click"):
		
	pass	
	
func _unhandled_input(event):
	if (event is InputEventMouseButton):
		if event.is_pressed():
			#get source if under mouse, set source
			var mousePos = get_global_mouse_position()
			var object = findEnergyStorage(mousePos)
			if ( object ):
				print(object)
		else:
			#if released, get sink if there was a source (and not the same as source)
			#if there is sink connect them
			#else reset source too
			pass

