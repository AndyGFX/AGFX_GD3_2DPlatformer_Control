extends Area2D


var item_type = "chest_key_d"
var item_amount = 1

	
func _ready():
	pass

# pickup ammo item method which is called from area detector assigned on player
func PickupKey():
	if !GameData: return	
	GameData.Add(item_type,item_amount)
	Utils.Instantiate(Globals.pickup_anim,get_global_position())
	Globals.player_sfx.Play("Pickup")
	queue_free()
	
func PickupControl(state):
	$CollisionShape2D.disabled = !state
