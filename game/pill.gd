extends Node3D

func pickup()->void:
	self.visible=false
	set_deferred("process_mode",Node.PROCESS_MODE_DISABLED)
	#$SoundPickup.play()
	Global.scoreChange(-1)

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		pickup()
