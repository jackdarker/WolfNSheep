class_name CondCheckFlagAndSet extends CondBase

@export var flagName:String="Key"
@export var flagTarget:int=1
@export var flagSet:int=0

func is_valid(resolve:bool=false)->Result:
	var res=Result.new()
	var flagValue=Global.flags.get(flagName,0)
	
	if(flagTarget!=flagValue):
		res.OK=false
		res.Msg=flagName+" is not "+str(flagTarget)
	if(resolve && res.OK):
		Global.flags[flagName]=flagSet
	return res

#TODO wenn man CondAnd hat die auf diegleichen items abfragen wird das nicht rihtig gecheckt:
# CondAnd(CheckFlagAndSet("Key",1,0),CheckFlagAndSet("Key",1,0)) -> is_valid wird true aber bei resolve false
