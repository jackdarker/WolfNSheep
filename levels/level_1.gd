extends Node3D

func _ready():
	Global.score_changed.connect(Callable(self , "checkVictory"))
	Global.player_death.connect(Callable(self , "player_revive"))


func player_revive()->void:
	%player.revive()
	if %player.lives <= 0:
		#get_node("/root/Pack-man/Lives/SprLifecounter0").visible = false
		get_tree().paused = true
		get_node("/root/Level/game_over_screen").visible = true

func checkVictory(_change)->void:
	if(Global.pills<1):
		get_tree().paused=true
		Global.goto_scene("res://scenes/finished_menu.tscn")


func _on_area_3d_body_entered(body: Node3D) -> void:
	Global.player_death.emit()
