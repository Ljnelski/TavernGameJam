class_name ShooterStats extends Resource

@export var firerate_level: int;
@export var damage_level : int;
@export var speed_level : int;
@export var bullet_count_level: int;

#@export var firerate_level_values: Array;
#@export var damage_level_values : Array;
#@export var speed_level_values: Array;
#@export var bullet_count_level_patterns: Array;

func add(additionalStats : ShooterStats):
	firerate_level += additionalStats.firerate_level;
	damage_level += additionalStats.damage_level;
	speed_level += additionalStats.speed_level;
	bullet_count_level += additionalStats.bullet_count_level;
