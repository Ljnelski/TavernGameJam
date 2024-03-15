extends Node3D

@export var stats: ShooterStats;
@export var shooter_pattern : Node3D;

var bullet = load("res://_Scenes/Shooter/Bullets/Bullet.tscn");
var instance;
var bullet_spawns : Array[Node];

var can_shoot: bool = false;
var cool_down: float = 0;

var fire_rate;
var damage;
var speed;
var bullet_count;

# Called when the node enters the scene tree for the first time.
func _ready():	
	# set up spawn locations
	if shooter_pattern == null:
		bullet_spawns.append(owner)
		push_warning("Shooter WARNING: shooter does not have a pattern assigned, it will only shoot one bullet from its own transform")
	else:
		bullet_spawns = shooter_pattern.get_children();
	
	# Set up shooter stats
	update_stats()
	
	print(fire_rate);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_shoot and cool_down <= 0:
		shoot()
	cool_down -= delta;

func shoot():
	for n in bullet_count:
		print("spawning bullet");
		var bullet_spawn = bullet_spawns[n];
		instance = bullet.instantiate();	
			
		# set bullet stats
		instance.set_stats(damage, speed)	;
	
		# set bullet transform
		instance.position = bullet_spawn.global_position;
		instance.transform.basis = bullet_spawn.global_transform.basis;
		get_tree().root.add_child(instance);
	
	# reset fireratecooldown
	cool_down = fire_rate;	
	
func apply_power_up(_stats: ShooterStats):
	stats.add(_stats);	
	update_stats();

func update_stats():
	fire_rate = stats.get_firerate();
	damage = stats.get_damage();
	speed = stats.get_speed();	
	bullet_count = stats.cap_level(stats.bullet_count_level, bullet_spawns) + 1;
