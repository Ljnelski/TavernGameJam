extends Node3D


@export var power_up_stats: ShooterStats;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_area_3d_body_entered(body):
	print(body.name);
	if body.has_method("on_powerup"):
		body.on_powerup(power_up_stats);
		queue_free();
