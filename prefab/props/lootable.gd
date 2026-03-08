extends Interactable

var looted:=false

func interact()->CondBase.Result:
	var res=Condition.is_valid(true)
	if(res.OK):
		$AnimationPlayer.play("open")
	return res

func cb_post_loot():
	Global.scoreChange(-1)
	looted=true

func can_interact()->CondBase.Result:
	return Condition.is_valid(false)
