extends Node

var levels = [
	"res://Levels/Level1.tscn",
	"res://Levels/Level2.tscn", 
	"res://Levels/Level3.tscn",
	"res://Levels/Level4.tscn",
	"res://Levels/Level5.tscn",
	"res://Levels/Level6.tscn",
	"res://Levels/Level7.tscn",
	"res://Levels/Level8.tscn",
	"res://Levels/Level9.tscn",
	"res://Levels/Level10.tscn"
]
var levelindex = 0
var canPause = true

# Called when the node enters the scene tree for the first time.
func _ready():
	load_level(0)
	pass # Replace with function body.


func load_level(index: int):
	#Unload the current levels
	var oldlevels = $ActiveLevel.get_children()
	for oldlevel in oldlevels:
		$ActiveLevel.remove_child(oldlevel)
		oldlevel.queue_free()
	pass
	
	levelindex = index
	print("load level ", levelindex)
	var newlevel_resource = load(levels[index])
	var newlevel = newlevel_resource.instance()
	$ActiveLevel.add_child(newlevel)

func goal_reached(body):
	$Sounds/BackgroundLoop/AnimationPlayer.play("RampDown")
	var sfx = $Sounds/Success
	get_tree().paused = true
	canPause = false
	sfx.play()
	yield(sfx, "finished")
	get_tree().paused = false
	canPause = true
	levelindex += 1
	levelindex = levelindex % levels.size()
	load_level(levelindex)
	$Sounds/BackgroundLoop/AnimationPlayer.play("RampUp")
	pass
	
func failure():
	$Sounds/BackgroundLoop/AnimationPlayer.play("RampDown")
	var sfx = $Sounds/Failure
	get_tree().paused = true
	canPause = false
	sfx.play()
	yield(sfx, "finished")
	get_tree().paused = false
	canPause = true
	restart_level()
	$Sounds/BackgroundLoop/AnimationPlayer.play("RampUp")
	pass

func restart_level():
	load_level(levelindex)
	pass
