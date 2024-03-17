class_name EnemyShooter extends State

@export var fire_rate : float = 0.75;

var shooter
var dimension_manager : DimesionManager;
var switch_state: bool = false;

func enter():
	if !shooter:
		shooter = $"../../Pivot/Gun/Shooter";
	if !dimension_manager:
		dimension_manager = get_tree().root.get_node("/root/DimensionManager");
	
	dimension_manager.dimesion_changed.connect(queue_switch_state);
	
	shooter.can_shoot = true;		
	pass
	
func update():
	if switch_state:
		transition.emit(self, "chaser");
	
func physics_update():
	$"../..".velocity = -$"../..".get_global_transform().basis.z;
	$"../..".move_and_slide();
	pass;	
	
func queue_switch_state(dimension):
	switch_state = true;
	
func exit():
	switch_state = false;
	shooter.can_shoot = false;
	dimension_manager.dimesion_changed.disconnect(queue_switch_state);
	
	


