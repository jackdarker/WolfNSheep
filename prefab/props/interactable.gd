class_name Interactable extends Node3D

@export var ID:String="MyName"
@export var Action:String="DoSomething"

@export var Condition:=CondBase.new()

# overide this
func interact()->CondBase.Result:
	return Condition.is_valid(true)

func can_interact()->CondBase.Result:
	return Condition.is_valid(false)
