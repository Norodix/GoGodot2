extends KinematicBody2D

var max_speed = 600
var acceleration_time = 0.2
var deceleration_time = 0.1
var jump_height = 64*2.2
var gravity = 3000

#calculated variables
var acceleration
var deceleration
var jump_speed

var velocity = Vector2.ZERO

var freeze = false
var ground


# Called when the node enters the scene tree for the first time.
func _ready():
	acceleration = max_speed / acceleration_time
	deceleration = max_speed / deceleration_time
	jump_speed = - sqrt(2*gravity*jump_height) #mgh = mv^2 / 2 => v = sqrt(2*g*h)
	pass

func field_effect():
	#Get overlapping fields
	var effect = Vector2.ZERO
	var fields = $FieldDetector.get_overlapping_areas()
	
	for field in fields:
		effect += field.FieldEffect
	
	return effect
	
func take_damage():
	get_node("/root/Game").failure()
	pass

func _physics_process(delta):
	var right = false
	var left = false
	var jumping = false
	#Only allow movement when not streaming energy
	if !($EnergyController.is_streaming()):
		right = Input.is_action_pressed("ui_right")
		left = Input.is_action_pressed("ui_left")
		jumping = Input.is_action_pressed("jump")
		
	
	var adv = acceleration*delta # acceleration delta v
	var ddv = deceleration*delta # deceleration delta v
	
	# if just touched ground make leaf explosion
	if (!ground) && is_on_floor() && !$Leaves.emitting:
		#print("dropped")
		$Leaves.restart()
		$Leaves.emitting = true
		$LeafDrop.play()
		
	ground = is_on_floor()
	
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
	var snap = Vector2.DOWN * 32 if is_on_floor() else Vector2.ZERO
	#velocity = move_and_slide(velocity, Vector2.UP)
	if jumping:
		if ground:
			velocity.y = jump_speed
			snap = Vector2.ZERO
	
	velocity += field_effect() * delta
	#Add a very small damping
	velocity *= 0.995
	velocity = move_and_slide_with_snap(velocity, snap, Vector2.UP)
	

func _process(delta):
	#animate the player character
	assign_animation()
		

func _on_DamageDetector_area_entered(area):
	take_damage()
	pass # Replace with function body.


func _on_VisibilityNotifier2D_screen_exited():
	#wait one second to buffer, if still outside reset
	yield(get_tree().create_timer(5.0), "timeout")
	if !$VisibilityNotifier2D.is_on_screen():
		get_node("/root/Game").restart_level()
	pass # Replace with function body.

func assign_animation():
	var epsilon = 0.05
	if velocity.x > epsilon:
		$AnimatedSprite.flip_h = false
		$CastingParticles.position.x = abs($CastingParticles.position.x)
		$CastingParticles.process_material.direction.x = 1
	if velocity.x < -epsilon:
		$AnimatedSprite.flip_h = true
		$CastingParticles.position.x = - abs($CastingParticles.position.x)
		$CastingParticles.process_material.direction.x = - 1
	#$Casting.visible = $EnergyController.is_streaming()
	$CastingParticles.emitting = $EnergyController.is_active()
	if $EnergyController.is_streaming():
		if !$Magic.is_playing():
			$Magic.play()
	else:
		$Magic.stop()

	var anim
	if !is_on_floor():
		#jumping animation
		if velocity.y < 0:
			anim = "Jump"
		else:
			anim = "Fall"
	else:
		if (abs(velocity.x) < 10) :
			anim = "Idle"
		else:
			anim = "Walk"
	
	if $AnimatedSprite.animation != anim:
		$AnimatedSprite.animation = anim
