extends "res://Prefabs/PowerUps/PowerUp.gd"

	
func Initialize():
	if !self.in_use:
		Globals.powerup_speed_icon.modulate = Color.red
		move_control.SetSpeed(new_value)
		print(new_value)
		timer.start()
		in_use = true
	pass
	
func on_timer_complete():
	GameData.Set("powerup_speed",0)
	move_control.RestoreSpeed()
	Globals.powerup_speed_icon.modulate = Color.white
	Globals.powerup_speed_icon.modulate.a = 0.2
	self.in_use = false
	queue_free()
		