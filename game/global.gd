extends Node

var pills:int  #pills required

signal kill_plane_touched(body: PhysicsBody3D)
signal player_death
signal flag_reached
signal score_changed(change) #fired when score is increased


func scoreChange(change):
	pills+=change
	emit_signal("score_changed", change)
