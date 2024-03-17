class_name EnemyChaser extends State

var dimension_manager : DimesionManager;
var switch_state: bool = false;

func enter():	
	if !dimension_manager:
		dimension_manager = get_tree().root.get_node("/root/DimensionManager");	
	dimension_manager.dimesion_changed.connect(queue_switch_state);	
	
func update():
	if switch_state:
		transition.emit(self, "shooter");
	
func physics_update():
	pass;	
	
func queue_switch_state(dimension):
	switch_state = true;
	
func exit():
	switch_state = false;
	dimension_manager.dimesion_changed.disconnect(queue_switch_state);
	
	
	
