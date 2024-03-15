class_name EnemyShooter extends State

@export var fire_rate : float = 0.75;

func enter():
	$"../../Pivot/Gun/Shooter".can_shoot = true;		
	pass
	
func update():
	pass;
	
func physics_update():
	$"../..".velocity = -$"../..".get_global_transform().basis.z;
	$"../..".move_and_slide();
	pass;	


