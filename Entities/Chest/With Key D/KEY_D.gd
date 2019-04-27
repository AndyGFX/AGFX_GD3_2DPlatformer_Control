extends ItemEntity

func Pickup()-> void:
	self.item_type = "chest_key_d"
	self.item_amount = 1
	self.item_limit = 1
	.Pickup()