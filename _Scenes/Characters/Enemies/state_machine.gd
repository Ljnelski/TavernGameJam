extends Node

@export var inital_state : State

var states : Dictionary = {}
var current_state : State;


# Called when the node enters the scene tree for the first time.
func _ready():
	for node in get_children():
		if node is State:
			states[node.name.to_lower()] = node;
			node.Transitioned.connect(on_child_transition);
	
	current_state = inital_state;
	
	current_state.enter();

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	current_state.update();

func _physics_process(delta):
	current_state.physics_update();

func on_child_transition(state, new_state_name):
	if state != current_state:
		return;
	
	var new_state = states.get(new_state_name.to_lower());
	if !new_state_name:
		return;
		
	if current_state:
		current_state.exit();
	
	new_state.enter();
	current_state = new_state;
