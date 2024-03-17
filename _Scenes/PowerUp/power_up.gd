extends Node3D


@export var power_up_stats: ShooterStats;

var dimension_manager : DimesionManager;

# Called when the node enters the scene tree for the first time.
func _ready():
	dimension_manager = get_tree().root.get_node("/root/DimensionManager")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_area_3d_body_entered(body):
	print("Power up colliding with " + body.name);
	if body.has_method("on_powerup"):
		body.on_powerup(power_up_stats);
		dimension_manager.change_dimesion();
		queue_free();
