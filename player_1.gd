extends CharacterBody2D

var SPEED = 300
var direction
var jump_vel = -500


func _physics_process(delta):
	apply_grav(delta)
	player_movenment(delta)
	move_and_slide()
	jumping()
		

func player_movenment(_delta):
	direction = Input.get_axis("left","right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x,0,SPEED)
		
		
func apply_grav(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

func jumping():
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jump_vel
		


		
