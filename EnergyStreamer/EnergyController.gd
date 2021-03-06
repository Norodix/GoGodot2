extends Node2D

var source : Node2D
var sink : Node2D
var transferSpeed = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	$Beam.set_as_toplevel(true) # do not inherit character position
	$Particles2D.set_as_toplevel(true)
	pass # Replace with function body.


func findClosestCollider(objects: Array, reference: Vector2):
	var closestObject = objects[0]
	var dmin = objects[0].collider.position.distance_to(reference)
	for object in objects:
		var d = object.collider.position.distance_to(reference)
		if d < dmin:
			dmin = d
			closestObject = object
	return closestObject.collider

func findEnergyStorage(mousePos : Vector2):
	var space = get_world_2d().direct_space_state
	var collision_objects = space.intersect_point(mousePos, 32, [], 2, true, true)
	if (collision_objects):
		return findClosestCollider(collision_objects, mousePos)
	else:
		return null


func _process(delta):
	if (source and not sink):
		$Beam.visible = true
		$Beam.points[0] = source.global_position
		$Beam.points[1] = get_global_mouse_position()
		$Beam.beaming = false
	elif (source and sink):
		$Beam.visible = true
		$Beam.points[0] = source.global_position
		$Beam.points[1] = sink.global_position
		$Beam.beaming = true
	else:
		$Beam.visible = false
		$Beam.beaming = false
	
	transferEnergy(delta)
	pass	
	
func transferEnergy(delta):
	if !(is_streaming()):
		return
	#Calculate max transferable energy between the two nodes
	var maxTransfer = min(sink.maxE - sink.E, source.E)
	var transferE = min(maxTransfer, transferSpeed*delta)
	#print("TransferE: ", transferE)
	sink.E += transferE
	source.E -= transferE
	if (transferE == 0): #stop streaming energy when done
		source = null
		sink = null
	
func is_streaming():
	if !(source && sink): 
		return false
	if ( (source.get("E") == null) || (sink.get("E") == null) ):
		print("NON ENERGY STORES CONNECTED")
		return false
	return true

func is_active():
	if !(source || sink): 
		return false
	if ( (source.get("E") == null) && (sink.get("E") == null) ):
		print("NON ENERGY STORES CONNECTED")
		return false
	return true
	
func _unhandled_input(event):
	if (event is InputEventMouseButton):
		if (event.button_index == BUTTON_LEFT):
			#print("UNHANDLED LEFT MOUSE")
			if event.is_pressed():
				#print("pressed")
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
				#print("released")
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
			
			#print("Sink: ", sink)
			#print("Source: ", source)

