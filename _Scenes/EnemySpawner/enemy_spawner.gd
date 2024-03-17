extends Node3D

@export var world_width : float;
@export var spawn_count: float;
@export var spawn_padding: float;

@export var enemy : PackedScene;
@export var spawn_rate: float = 2.0;


var spawn_locations : Array[Node3D];
var cool_down : float;


# Called when the node enters the scene tree for the first time.
func _ready():
	# create spawn locations.
	spawn_locations = [];
	
	var start_pos = position.x - (world_width/2) + spawn_padding;
	var end_pos = position.x + (world_width/2) - spawn_padding;
	
	var distance = abs(end_pos - start_pos) / spawn_count;
	print("world start: %d" % start_pos + ", world end: %d" % end_pos);

	
	for i in spawn_count:
		print("creating spawn");
		var spawn_pos : Vector3 = Vector3(start_pos + (0.5 * distance + i * distance) , position.y, position.z);
		var spawn = Node3D.new()
		add_child(spawn);
		spawn.set_position(spawn_pos);
		spawn_locations.append(spawn);	
	
	print(spawn_locations.size());
	
	for n in spawn_locations:
		print(n.position);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if cool_down <= 0:
		enemy.instantiate()
	pass
