extends "res://Prefabs/PowerUps/PowerUp.gd"

	
func Initialize():
	if !self.in_use:
		Globals.powerup_jump_icon.modulate = Color.red
		move_control.SetJumpForce(new_value)
		timer.start()
		in_use = true
	pass
	
func on_timer_complete():
	GameData.Set("powerup_jump",0)
	move_control.RestoreJumpForce()
	Globals.powerup_jump_icon.modulate = Color.white
	Globals.powerup_jump_icon.modulate.a = 0.2
	self.in_use = false
	queue_free()
		