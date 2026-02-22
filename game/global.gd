extends Node

var coins:int  #pills required

signal kill_plane_touched(body: PhysicsBody3D)
signal player_death
signal flag_reached
signal score_changed() #fired when score is increased
signal health_changed(newvalue)
signal stamina_changed(newvalue)

func scoreChange(change):
	coins+=change
	score_changed.emit()
