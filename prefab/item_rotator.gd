extends Node3D

## add this to Node3D/StaticBody3D of collectible items


var initial_y:float

func _ready() -> void:
	initial_y=position.y

func _process(delta: float) -> void:
	# Rotate around and bounce along Y-axis
	rotate_y(deg_to_rad(wrapf(60 * delta,0,360)))
	var bounce=sin(rotation.y)*0.25
	position.y =initial_y+bounce
