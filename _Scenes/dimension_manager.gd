class_name DimesionManager extends Node

@export var starting_dimesion : dimension;

enum dimension {
	POST_WAR,
	SPACE
}

signal dimesion_changed;
var current_dimesion : dimension;

func _ready():
	current_dimesion = starting_dimesion;

func change_dimesion():
	
	match current_dimesion:
		dimension.POST_WAR:
			current_dimesion = dimension.SPACE;
		dimension.SPACE:
			current_dimesion = dimension.POST_WAR;	
			
	print("Changing Dimension to: %d" % current_dimesion);
	dimesion_changed.emit(current_dimesion)
	
