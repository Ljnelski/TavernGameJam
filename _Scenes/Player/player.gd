extends CharacterBody3D

@export var speed = 14;

@onready var shooter = $Pivot/Gun/Shooter;

var target_velocity = Vector3.ZERO;

func _physics_process(delta):
	# We create a local variable to store the input direction.
	var direction = Vector3.ZERO
	
	# We check for each move input and update the direction accordingly.
	if Input.is_action_pressed("move_right"):
		direction.x += 1;
	if Input.is_action_pressed("move_left"):
		direction.x -= 1;
	if Input.is_action_pressed("move_back"):
		direction.z += 1;
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1;
		
	if direction != Vector3.ZERO:
		direction = direction.normalized()
			
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed	
	
	# Moving the Character
	velocity = target_velocity * delta;
	move_and_collide(velocity)
	
func on_powerup(power_up: ShooterStats):
	shooter.apply_power_up(power_up);
