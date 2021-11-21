extends Node2D

var source : Node2D
var sink : Node2D
var transferSpeed = 0.35

# Called when the node enters the scene tree for the first time.
func _ready():
	$Line2D.set_as_toplevel(true) # do not inherit character position
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
		$Line2D.points[0] = source.global_position
		$Line2D.points[1] = get_global_mouse_position()
	elif (source and sink):
		$Line2D.visible = true
		$Line2D.points[0] = source.global_position
		$Line2D.points[1] = sink.global_position
	else:
		$Line2D.visible = false
	
	transferEnergy(delta)
	pass	
	
func transferEnergy(delta):
	if !(source && sink): 
		return
	if ( (source.get("E") == null) || (sink.get("E") == null) ):
		print("NON ENERGY STORES CONNECTED")
		return
	#Calculate max transferable energy between the two nodes
	var maxTransfer = min(sink.maxE - sink.E, source.E)
	var transferE = min(maxTransfer, transferSpeed*delta)
	print("TransferE: ", transferE)
	sink.E += transferE
	source.E -= transferE
	
	
	
func _unhandled_input(event):
	if (event is InputEventMouseButton):
		if (event.button_index == BUTTON_LEFT):
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

