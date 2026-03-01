extends Interactable

var disabled:=false

func interact():
	$AnimationPlayer.play("use")

func cb_post_use():
	pass

func can_interact()->bool:
	return !disabled

func why_cant_interact()->String:
	return ""
