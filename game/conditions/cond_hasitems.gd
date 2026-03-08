class_name CondHasItems extends CondBase

@export var itemName:String="Key"
@export var itemCount:int=1

func is_valid(resolve:bool=false)->Result:
	var res=Result.new()
	var inStock=Global.player.items[itemName] | 0
	
	if(itemCount>inStock):
		res.OK=false
		res.Msg=itemName+" is missing "
	if(resolve && res.OK):
		Global.player.items[itemName]-=itemCount
	return res

#TODO wenn man CondAnd hat die auf diegleichen items abfragen wird das nicht rihtig gecheckt:
# CondAnd(HasItem("Coin",2),HasItem("Coin",3)) -> true when 4 Coins im Inventory, tatsächlih werden aber 5 benötigt
#Lösung? man merkt sich für jedes item wie viele schon benötigt wurden?
