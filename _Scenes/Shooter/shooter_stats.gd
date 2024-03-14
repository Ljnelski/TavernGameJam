class_name ShooterStats extends Resource

@export var firerate_level: int;
@export var damage_level : int;
@export var speed_level : int;
@export var bullet_count_level: int;

@export var firerate_level_values: Array[float];
@export var damage_level_values : Array[float];
@export var speed_level_values: Array[float];

func get_firerate():
	var level_capped = cap_level(firerate_level, firerate_level_values);
	return firerate_level_values[level_capped];
	
func get_damage():
	var level_capped = cap_level(damage_level, damage_level_values);
	return damage_level_values[level_capped];

func get_speed():
	var level_capped = cap_level(speed_level, speed_level_values);
	return speed_level_values[level_capped];

# makes sure that a level entered will be clamped to the size of the array;
func cap_level(level, level_values):
	return minf(level, level_values.size());
	
func add(additionalStats : ShooterStats):
	firerate_level += additionalStats.firerate_level;
	damage_level += additionalStats.damage_level;
	speed_level += additionalStats.speed_level;
	bullet_count_level += additionalStats.bullet_count_level;
