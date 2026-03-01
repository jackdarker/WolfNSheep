class_name Interactable extends Node3D

@export var ID:String="MyName"
@export var Action:String="DoSomething"

@export var Condition:CondHasItems =CondHasItems.new()

# overide this
func interact():
	pass

func can_interact()->bool:
	return true

func why_cant_interact()->String:
	return ""
