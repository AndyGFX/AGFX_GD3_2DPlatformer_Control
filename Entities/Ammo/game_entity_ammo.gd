extends ItemEntity

func Pickup() -> void:
	self.item_type = "ammo"
	self.item_limit = 100
	.Pickup()
	