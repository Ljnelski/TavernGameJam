extends Node3D

var speed: float = 14.0;
var damage: float;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_stats(_damage, _speed):
	damage = _damage;
	speed *= _speed;
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += transform.basis * Vector3(0,0, -speed) * delta;
