extends Node2D

var source
var sink

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

	
func findEnergyStorage(mousePos : Vector2):
	var space = get_world_2d().direct_space_state
	var collision_objects = space.intersect_point(mousePos, 32, [], 2, true, true)
	if (collision_objects):
		return collision_objects[0].collider
	else:
		return null


func _process(delta):
	if (source and not sink):
		$Line2D.visible = true
		$Line2D.points[0] = source.position
		$Line2D.points[1] = get_global_mouse_position()
	elif (source and sink):
		$Line2D.visible = true
		$Line2D.points[0] = source.position
		$Line2D.points[1] = sink.position
	else:
		$Line2D.visible = false
		
	pass	
	
func _unhandled_input(event):
	if (event is InputEventMouseButton):
		#TODO only handle all the following things for left click
		if event.is_pressed():
			print("pressed")
			#get source if under mouse, set source
			var mousePos = get_global_mouse_position()
			var object = findEnergyStorage(mousePos)
			if ( object ):
				sink = null
				source = object
			else:
				source = null
				sink = null
		else:
			print("released")
			#if released, get sink if there was a source (and not the same as source)
			if (source):
				var mousePos = get_global_mouse_position()
				var object = findEnergyStorage(mousePos)
				#if there is sink connect them
				if ( object and (object != source)):
					sink = object
				#else reset source too
				else:
					source = null
					sink = null
			else:
				source = null
				sink = null
		
		print("Sink: ", sink)
		print("Source: ", source)

