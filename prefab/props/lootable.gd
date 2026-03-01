extends Interactable

var looted:=false

func interact():
	$AnimationPlayer.play("open")

func cb_post_loot():
	Global.scoreChange(-1)
	looted=true

func can_interact()->bool:
	return !looted
