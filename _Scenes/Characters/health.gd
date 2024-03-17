extends Node3D

signal hurt;
signal death;

@export var starting_health: float = 100;
@export var hit_box : Area3D;

var current_health

# Called when the node enters the scene tree for the firt time.
func _ready():
	if hit_box:
		print("connecting on_body_entered");
		hit_box.area_entered.connect(on_hitbox_area_entered);
	else:
		push_warning("heath WARNING: health does not have a hit box assigned");

func on_hitbox_area_entered(area):
	if area is Bullet:
		on_hurt(area.damage);

func on_hurt(damage):
	print("taking %d damage" % damage);
	hurt.emit(current_health)

func on_death():
	death.emit();
