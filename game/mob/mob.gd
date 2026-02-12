extends CharacterBody3D

@export var speed:float = 1
var _gravity := -30.0

func _ready() -> void:
	%nav_agent.target_position=Vector3(1,0,0)

func _physics_process(delta):
	var direction = to_local(%nav_agent.get_next_path_position()).normalized()
	velocity = direction * speed
	var y_velocity := velocity.y
	velocity.y =  y_velocity+_gravity * delta
	move_and_slide()
