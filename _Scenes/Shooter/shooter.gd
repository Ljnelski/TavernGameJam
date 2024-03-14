extends Node3D

@export var stats: ShooterStats;
@export var fire_rate = 1;
@export var damage = 0.5;

@export var shooter_pattern : PackedScene;

var bullet = load("res://_Scenes/Shooter/Bullets/Bullet.tscn");

var instance;
var bullet_spawns;
var cool_down: float = 0;

# Called when the node enters the scene tree for the first time.
func _ready():
	var sp = shooter_pattern.instantiate();
	add_child(sp);
	bullet_spawns = sp.get_children()
	
	print(bullet_spawns);
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("shoot") and cool_down <= 0:
		for n in stats.bullet_count_level - 1:
			print(bullet_spawns[n].name)
			var spawn = bullet_spawns[n];
			instance = bullet.instantiate();		
			# set bullet stats
			instance.set_stats(stats.damage_level, stats.speed_level)	
		
			# set bullet transform
			instance.position = spawn.global_position;
			instance.transform.basis = spawn.global_transform.basis;
			get_tree().root.add_child(instance)		
		
		# reset fireratecooldown
		cool_down = fire_rate / stats.firerate_level;
		
	cool_down -= delta;
	
func apply_power_up(_stats: ShooterStats):
	stats.add(_stats);	
	#print("Stats (%s, " % stats.firerate_level +
	 #"%s, " % stats.damage_level +
	#"%s, " % stats.speed_level + 
	#"%s, " % stats.bullet_count_level + ")"	
	#); 
	

