extends Area2D
class_name ItemEntity,"res://Scripts/Classes/ItemEntityIcon.png"

var item_type = "undefined"
export var item_amount = 1
export var item_id = 0
export var item_limit = 999

# pickup item method is called from area detector assigned on player
func Pickup()-> void:
	if !GameData: return	
	if GameData.Get(item_type)>=item_limit: return	
	GameData.AddWithLimitCheck(item_type,item_amount,item_limit);	
	Utils.Instantiate(Globals.pickup_anim,get_global_position())
	Globals.player_sfx.Play("Pickup")
	queue_free()
	
# remove collision shape when is item used as item inside chest
# for disable when is chest closed and enabled, when is onened
func PickupControl(state)-> void:
	$CollisionShape2D.disabled = !state
