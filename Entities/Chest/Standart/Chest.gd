extends Area2D

var is_opened:bool = false
var state_open = null
var state_close = null
var enable_use_key:bool = true
var items:Array = [];


export (bool) var need_key
export (String) var key_name = "undefined"



func _ready():
	self.state_open = $OPENED
	self.state_close = $CLOSED
		
	self.items.append($OPENED/ItemsORIGIN/Position2D1)
	self.items.append($OPENED/ItemsORIGIN/Position2D2)
	self.items.append($OPENED/ItemsORIGIN/Position2D3)
	self.items.append($OPENED/ItemsORIGIN/Position2D4)
	
	for i in range(4):
		
		var item_id = randi()%4
		
		var new_item = load(Globals.chestItems[i]).instance()
		new_item.name="Chest_Item_"+String(i)
		self.items[i].add_child(new_item)
		new_item.set_owner(self.items[i])
		new_item.PickupControl(false)
	
	self.set_process(true)
	self.Chest_Close()
	pass


func _process(delta):
	if self.enable_use_key:
		if Input.is_action_just_pressed("key_use"):
			print("USE ...")
			if (self.is_opened):
				self.Chest_Close()
			elif (!self.is_opened):
				self.Chest_Open()
		pass
	pass


func _on_Chest_body_entered(body):
	
	if (body.is_in_group("PLAYER")):
		print("Player ENTER")
		self.enable_use_key = true
	pass # Replace with function body.


func _on_Chest_body_exited(body):
	if (body.is_in_group("PLAYER")):
		print("Player EXIT")
		self.enable_use_key = false
	pass # Replace with function body.


func EnablePickup():
	for i in range(4):
		if self.items[i].get_child_count()>0:
			var children = self.items[i].get_children()		
			children[0].PickupControl(true)

func DisablePickup():
	for i in range(4):
		if self.items[i].get_child_count()>0:
			var children = self.items[i].get_children()		
			children[0].PickupControl(false)
		
func Chest_Open():
	self.state_close.visible = false
	self.state_open.visible = true
	self.is_opened = true
	self.EnablePickup()
	pass
	
func Chest_Close():
	self.state_close.visible = true
	self.state_open.visible = false
	self.is_opened = false
	self.DisablePickup()
	pass	