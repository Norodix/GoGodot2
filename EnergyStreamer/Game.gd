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
	"res://Levels/Level10.tscn",
	"res://Levels/LevelEnd.tscn"
]
var levelindex = 0
var canPause = true

var bgVol_high = -10
var bgVol_low = -30

# Called when the node enters the scene tree for the first time.
func _ready():
	load_level(0)
	#Engine.time_scale = 0.05
	pass # Replace with function body.


func load_level(index: int):
	#Unload the current levels
	var oldlevels = $ActiveLevel.get_children()
	for oldlevel in oldlevels:
		$ActiveLevel.remove_child(oldlevel)
		oldlevel.queue_free()
	pass
	
	levelindex = index
	#print("load level ", levelindex)
	var newlevel_resource = load(levels[index])
	var newlevel = newlevel_resource.instance()
	$ActiveLevel.add_child(newlevel)

func goal_reached(body):
	bgMusicFadeOut()
	var sfx = $Sounds/Success
	get_tree().paused = true
	canPause = false
	sfx.play()
	yield(sfx, "finished")
	get_tree().paused = false
	canPause = true
	levelindex += 1
	if (levelindex == levels.size()):
		#end of game, go back to main menu
		levelindex = 0
		get_tree().change_scene("res://MainMenu.tscn")
		return
	load_level(levelindex)
	bgMusicFadeIn()
	pass
	
func failure():
	bgMusicFadeOut()
	var sfx = $Sounds/Failure
	get_tree().paused = true
	canPause = false
	sfx.play()
	yield(sfx, "finished")
	get_tree().paused = false
	canPause = true
	restart_level()
	bgMusicFadeIn()
	pass

func restart_level():
	load_level(levelindex)
	pass

func bgMusicFadeOut():
	$Sounds/BackgroundLoop/Tween.interpolate_property($Sounds/BackgroundLoop, "volume_db", bgVol_high, bgVol_low, 0.3, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Sounds/BackgroundLoop/Tween.start()
	
func bgMusicFadeIn():
	$Sounds/BackgroundLoop/Tween.interpolate_property($Sounds/BackgroundLoop, "volume_db", bgVol_low, bgVol_high, 2, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	$Sounds/BackgroundLoop/Tween.start()
