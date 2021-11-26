extends Line2D

var beaming = false
var particles = Particles2D.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	particles = get_node("../Particles2D")
	pass # Replace with function body.


func _process(delta):
	particles.emitting = beaming
	if visible:
		#check if there is two points
		if points.size() != 2:
			return
		#get line length and midpoint for emissions
		var startpoint = points[0]
		var length = points[1].distance_to(points[0])
		var angle = (points[1]-points[0]).angle()
		particles.position = startpoint
		particles.rotation = angle
		particles.process_material.initial_velocity = length / particles.lifetime
	pass
