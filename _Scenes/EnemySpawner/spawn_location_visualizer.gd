@tool 
extends Node3D

@export var visual_spawns : bool;
@export var config : EnemySpawnerSpawnConfig;

var spawn_flags : Array[MeshInstance3D] = [];
var not_initalized : bool = true;

func _process(_delta):
	if not_initalized:
		print("spawn_visualizer not ready")	
		if config:
			print("connecting draw spawn")
			config.config_changed.connect(draw_spawns);
			draw_spawns();
			not_initalized = false;
			
func clear_flags():
	for flag in spawn_flags:
		flag.queue_free();	
	
func draw_spawns():
	print("draw_spawns called");
	
	if !visual_spawns: return;
	
	var positions = config.create_spawn_positions(position);
	
	clear_flags();
	
	for pos in positions:
		create_spawn_flag(pos);	

func create_spawn_flag(position: Vector3):
	var mesh_instance = MeshInstance3D.new();
	mesh_instance.transform.origin = position;		
		
	var mesh = SphereMesh.new();
	mesh.radius = 1;
	mesh.height = 2;
	mesh_instance.mesh = mesh;
	
	var material = StandardMaterial3D.new();
	material.albedo_color = Color.RED;
	mesh_instance.material_override = material;
	
	add_child(mesh_instance);
	
func _exit_tree():
	config.config_changed.disconnect(draw_spawns);
