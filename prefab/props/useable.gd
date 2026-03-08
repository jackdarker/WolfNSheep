extends Interactable

# call by Animation player
func cb_post_use():
	pass
	
func interact()->CondBase.Result:
	var res=Condition.is_valid(true)
	if(res.OK):
		$AnimationPlayer.play("toggle")
	return res

func can_interact()->CondBase.Result:
	return Condition.is_valid(false)
