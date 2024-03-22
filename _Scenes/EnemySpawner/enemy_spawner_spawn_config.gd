@tool
class_name EnemySpawnerSpawnConfig extends Resource

@export var world_width : float = 120: set = set_world_width;
@export var spawn_count : float = 3: set = set_spawn_count;
@export var spawn_padding: float = 40: set = set_spawn_padding;

signal config_changed;

func set_world_width(value : float):
	world_width = value;
	config_changed.emit();	
	
func set_spawn_count(value : float):
	print("spawn count changed")
	spawn_count = value;
	config_changed.emit();	
	
func set_spawn_padding(value : float):
	spawn_padding = value;
	config_changed.emit();	

func create_spawn_positions(origin : Vector3):
	var spawn_positions = [];
	
	var start_pos = origin.x - (world_width/2) + spawn_padding;
	var end_pos = origin.x + (world_width/2) - spawn_padding;
	
	var distance = abs(end_pos - start_pos) / spawn_count;
		
	for i in spawn_count:
		var spawn_pos : Vector3 = Vector3(start_pos + (0.5 * distance + i * distance) , origin.y, origin.z);
		spawn_positions.append(spawn_pos)
	
	return spawn_positions;
	
