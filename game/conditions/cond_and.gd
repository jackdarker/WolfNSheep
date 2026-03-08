class_name CondAnd extends CondBase

@export var SubConds:Array[CondBase]=[]

func is_valid(resolve:bool=false)->Result:
	var res=Result.new()
	for item in SubConds:
		res = res.And(item.is_valid())
	return res
