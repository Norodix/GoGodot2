extends Node2D


var width = 1024
var height = 600
var v = 400 #starting velocity
var ballCount = 1
var balls = []


# Called when the node enters the scene tree for the first time.
func _ready():
	# create many balls
	var ball = preload("res://Ball.tscn")
	for i in ballCount:
		balls.append(ball.instance())
		self.add_child(balls[i])
		balls[i].position = Vector2 ( randi() % 1024, randi() % 600 )
		var angle = deg2rad(randi() % 360)
		balls[i].linear_velocity = Vector2 ( cos(angle), sin(angle) ) * v
		
		pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
