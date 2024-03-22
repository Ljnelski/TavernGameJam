class_name EnemySpawner extends Node3D

@export var config : EnemySpawnerSpawnConfig;

@export var enemy : PackedScene;
@export var spawn_rate: float = 2.0;

var spawn_points : Array[Node3D];
var cool_down : float;

# Called when the node enters the scene tree for the first time.
func _ready():
	# create spawn locations.
	spawn_points = [];	
	create_spawn_points();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if cool_down <= 0:
		enemy.instantiate()
	pass
	
# creates the nodes that will act as spawn points
func create_spawn_points():	
	pass;
	var spawn_positions = config.create_spawn_positions(position);
	
	for pos in spawn_positions:
		var spawn = Node3D.new()
		add_child(spawn);
		spawn.set_position(pos);
		spawn_points.append(spawn);	
