extends Node

const GAMEDATA_PATH = "res://gamedata.json"


var items = {}

# ---------------------------------------------------------
# Save game data data
# ---------------------------------------------------------
func Save():

	Utils.SaveJSON(GAMEDATA_PATH,items,true)
	print("Game data saved.")

# ---------------------------------------------------------
# Load saved game data data
# ---------------------------------------------------------
func Load():

	items = Utils.LoadJSON(GAMEDATA_PATH)
	print("Game data loaded.")

# ---------------------------------------------------------
#  Add item to dictionary and set value+=val
# ---------------------------------------------------------
func Add(itemName,val):
	if !items.has(itemName):
		items[itemName]=val
	items[itemName]+=val

# ---------------------------------------------------------
# Add item to dicionary when not exist and set value += vale,
# then if new value is > as limit set limit to value
# ---------------------------------------------------------
func AddWithLimitCheck(itemName,val,limit):
	if !items.has(itemName):
		items[itemName]=val
	items[itemName]+=val
	if items[itemName]>limit:
		items[itemName] = limit

# ---------------------------------------------------------
# Delete item from dictionary
# ---------------------------------------------------------
func Del(itemName):
	if items.has(itemName):
		items.erase(itemName)

# ---------------------------------------------------------
# Set item in dictionary to defined value (overwrite previous)
# ---------------------------------------------------------
func Set(itemName,val):
	items[itemName] = val

# ---------------------------------------------------------
# Get item value from dictionary 
# ---------------------------------------------------------
func Get(itemName,default=0):
	if !items.has(itemName):
		items[itemName] = default
	return items[itemName]
	
# ---------------------------------------------------------
# Check if exist item in dictionary
# ---------------------------------------------------------
func HasItem(itemName,val):
	if items[itemName] == val:
		return true
	return false