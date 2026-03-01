class_name CondBase extends Node

class Result:
	var OK:bool=true
	var Msg:String=""
	
	func And(other:Result)->Result:
		var res = Result.new()
		res.OK = self.OK && other.OK
		res.Msg = self.msg + other.Msg
		return res
	
func is_valid()->Result:
	return Result.new()
