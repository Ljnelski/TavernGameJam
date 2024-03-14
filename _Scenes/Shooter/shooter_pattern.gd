@tool
extends Node3D

var bullet_spawns : Array;
		

# Called when the node enters the scene tree for the first time.
func _ready():
	bullet_spawns = $get_children();
