class_name CondCheckFlag extends CondBase

@export var flagName:String="Key"
@export var flagTarget:int=1

func is_valid(resolve:bool=false)->Result:
	var res=Result.new()
	var flagValue=Global.flags.get(flagName,0)
	
	if(flagTarget!=flagValue):
		res.OK=false
		res.Msg=flagName+" is not "+str(flagTarget)
	return res
