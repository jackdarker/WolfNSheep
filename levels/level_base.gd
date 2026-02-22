extends Node3D

func _ready():
	Global.coins=20
	Global.score_changed.connect(Callable(self , "checkVictory"))
	Global.score_changed.connect(%Hud.update_score)
	Global.player_death.connect(Callable(self , "player_revive"))
	Global.stamina_changed.connect(%Hud.update_stamina)

func player_revive()->void:
	%player.revive()
	if %player.lives <= 0:
		#get_node("/root/Pack-man/Lives/SprLifecounter0").visible = false
		get_tree().paused = true
		get_node("/root/Level/game_over_screen").visible = true

func checkVictory()->void:
	if(Global.coins<1):
		get_tree().paused=true
		Global.goto_scene("res://scenes/finished_menu.tscn")


func _on_area_3d_body_entered(body: Node3D) -> void:
	Global.player_death.emit()
