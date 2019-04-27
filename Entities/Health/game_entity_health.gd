extends ItemEntity

func Pickup()-> void:
	self.item_type = "health"
	self.item_amount = 25
	self.item_limit = 100
	.Pickup()
	