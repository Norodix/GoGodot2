extends KinematicBody2D

var max_speed = 800
var acceleration_time = 0.1
var deceleration_time = 0.2
var jump_height = 64*2.5
var gravity = 3000

#calculated variables
var acceleration
var deceleration
var jump_speed

var velocity = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	acceleration = max_speed / acceleration_time
	deceleration = max_speed / deceleration_time
	jump_speed = - sqrt(2*gravity*jump_height) #mgh = mv^2 / 2 => v = sqrt(2*g*h)
	pass

func _physics_process(delta):
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	
	var adv = acceleration*delta
	var ddv = deceleration*delta
	var ground = is_on_floor()
	
	if right:
		velocity.x += adv
	if left:
		velocity.x -= adv
	
	if(not right and not left): #slow down
		if (abs(velocity.x) > ddv):
			#slow down by dv
			velocity.x -= sign(velocity.x) * ddv
		else:
			velocity.x = 0
			
	#limit x movespeed
	if (abs(velocity.x) > max_speed):
		velocity.x = sign(velocity.x) * max_speed

	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_pressed("jump"):
		if ground:
			velocity.y = jump_speed
