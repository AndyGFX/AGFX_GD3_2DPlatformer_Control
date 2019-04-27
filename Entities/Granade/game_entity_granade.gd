extends ItemEntity

func Pickup()-> void:
	self.item_type = "granade"
	self.item_amount = 3
	self.item_limit = 12
	.Pickup()
	
	
