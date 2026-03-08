class_name CondBase extends Node

class Result:
	var OK:bool=true
	var Msg:String=""
	
	func And(other:Result)->Result:
		var res = Result.new()
		res.OK = self.OK && other.OK
		res.Msg = self.msg + other.Msg
		return res

## checks if the condition is true
# call with resolve=true to execute the cond.
# f.e. if the condition requires that you handover 20 coin, the resolve should transfer those coin from you to the target
func is_valid(resolve:bool=false)->Result:
	return Result.new()
