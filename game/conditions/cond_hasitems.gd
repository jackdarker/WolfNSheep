class_name CondHasItems extends CondBase

var itemName:String="Key"
var itemCount:int=1

func is_valid()->Result:
	var res=Result.new()
	res.OK=false
	res.Msg=itemName+" is missing "	
	return res


#TODO wenn man CondAnd hat die auf diegleichen items abfragen wird das nicht rihtig gecheckt:
# CondAnd(HasItem("Coin",2),HasItem("Coin",3)) -> true when 4 Coins im Inventory, tatsächlih werden aber 5 benötigt
#Lösung? man merkt sich für jedes item wie viele schon benötigt wurden?
