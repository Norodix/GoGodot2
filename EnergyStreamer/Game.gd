extends Node

var levels = [
	"res://Levels/Level1.tscn",
	"res://Levels/Level2.tscn", 
	"res://Levels/Level3.tscn",
	"res://Levels/Level4.tscn",
	"res://Levels/Level5.tscn",
	"res://Levels/Level6.tscn",
	"res://Levels/Level7.tscn"
]
var levelindex = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	load_level(0)
	pass # Replace with function body.


func load_level(index: int):
	#Unload the current levels
	var oldlevels = $ActiveLevel.get_children()
	for oldlevel in oldlevels:
		oldlevel.queue_free()
	pass
	
	levelindex = index
	print("load level ", levelindex)
	var newlevel_resource = load(levels[index])
	var newlevel = newlevel_resource.instance()
	$ActiveLevel.call_deferred("add_child", newlevel)

func goal_reached(body):
	#print("Goal reached")
	levelindex += 1
	levelindex = levelindex % levels.size()
	load_level(levelindex)
	pass

func restart_level():
	load_level(levelindex)
	pass
