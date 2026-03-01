extends Node3D

@export var lifetime:float =2

@export var text:String="Hello":
	set(value):
		%Label.text=value

#the player will call queue_free !
func _on_tree_entered() -> void:
	if(lifetime>0):
		%AnimationPlayer.play("floating",-1, 1/lifetime)
