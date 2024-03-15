extends Node3D

signal hurt;
signal death;

@export var starting_health: float = 100;
@export var hit_box : Area3D;

var current_health

# Called when the node enters the scene tree for the first time.
func _ready():
	if hit_box:
		hit_box.body_entered.connect(on_body_entered);
	else:
		push_warning("heath WARNING: health does not have a hit box assigned");

func on_body_entered(body):
	print(body.name);

func on_hurt(body):
	hurt.emit(current_health)

func on_death():
	death.emit();
