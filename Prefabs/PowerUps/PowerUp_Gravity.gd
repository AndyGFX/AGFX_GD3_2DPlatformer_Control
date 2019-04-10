extends "res://Prefabs/PowerUps/PowerUp.gd"

	
func Initialize():
	if !self.in_use:
		print("Gravity changed ...")
		Globals.powerup_gravity_icon.modulate = Color.red
		move_control.SetGravity(new_value)	
		timer.start()
		self.in_use = true
	pass

func on_timer_complete():
	GameData.Set("powerup_gravity", 0)
	move_control.RestoreGravity()
	Globals.powerup_gravity_icon.modulate = Color.white
	Globals.powerup_gravity_icon.modulate.a = 0.2
	self.in_use = false
	queue_free()
