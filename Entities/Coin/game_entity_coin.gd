extends ItemEntity

func Pickup()-> void:
	self.item_type = "coins"
	self.item_limit = 999999
	.Pickup()
	