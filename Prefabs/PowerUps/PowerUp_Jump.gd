extends "res://Prefabs/PowerUps/PowerUp.gd"

	
func Initialize():
	GameData.Set("powerup_jump",1)
	move_control.SetJumpForce(new_value)
	timer.start()
	pass
	
func on_timer_complete():
	GameData.Set("powerup_jump",0)
	move_control.RestoreJumpForce()
	queue_free()
		