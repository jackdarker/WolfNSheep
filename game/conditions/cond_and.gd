class_name CondAnd extends CondBase

var SubConds:Array[CondBase]=[]

func is_valid()->Result:
	var res=Result.new()
	for item in SubConds:
		res = res.And(item.is_valid())
	return res
