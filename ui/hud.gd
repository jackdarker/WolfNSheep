extends Node

func update_score():
	%lbl_score.text="coins left: "+str(Global.coins)

func update_stamina(value):
	%bar_stamina.value=value
