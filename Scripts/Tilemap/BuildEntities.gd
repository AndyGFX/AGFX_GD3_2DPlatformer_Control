extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var root_entities

var file_name = "res://TMX_Map/TiledObjectTypes/objecttypes.tiled"
var objectTypes


func Initialize_ObjectTypes():
	
	# load TMX objecttypes 
	print("ObjectTypes data loaded.")
	
	self.objectTypes = Utils.LoadJSON(file_name) 
	
#	for obj in self.objectTypes.objecttypes.objecttype:	
#		print("   | "+obj.name)
#

# Called when the node enters the scene tree for the first time.
func _ready():

	self.Initialize_ObjectTypes()

	self.root_entities = Utils.FindNode("Entities")

	print("Post-process: build entities in scene at runtime ... ")
	var scene = Utils.FindNode(self.name)
	
	for node in scene.get_children():
		if node is Node2D:
			print("TMX: scan objects ...")
			
			for object in node.get_children():
				object.hide()
				if object.has_meta("Type"):
					var type = object.get_meta("Type")
					#print(type)

					match type:
						"Health":
							Create_health(object)
						"Ammo": 
							Create_ammo(object)
						"Granade":
							Create_granade(object)
						"Coin":
							Create_coin(object)
						"PlayerStart":
							Create_PlayerStart(object)
						"InfoPanel":
							Create_InfoPanel(object)
						"Hazard U": Create_Hazard(object)
						"Hazard R": Create_Hazard(object)
						"Hazard D": Create_Hazard(object)
						"Hazard L": Create_Hazard(object)
						"Enemy H": Create_Hazard(object)
						"Enemy V": Create_Enemy(object)
						"Teleport": Create_Teleport(object)
						"PU_Speed": Create_PowerUp_Speed(object)
						"PU_Gravity": Create_PowerUp_Gravity(object)
						"PU_Jump": Create_PowerUp_Jump(object)
						"Chest key A": Create_ChestKey(object)
						"Chest key B": Create_ChestKey(object)
						"Chest key C": Create_ChestKey(object)
						"Chest key D": Create_ChestKey(object)
						"Chest": Create_Chest(object)
						"ChestWithKeyA": Create_Chest(object)
						"ChestWithKeyB": Create_Chest(object)
						"ChestWithKeyC": Create_Chest(object)
						"ChestWithKeyD": Create_Chest(object)

				pass

# ------------------------------------------------------------------
# HELPERS for read properties definition and return default value if
# is not defined on tile object  
# ------------------------------------------------------------------

func GetObjectTypeFor(object_type_name):
	
	for object_properties in self.objectTypes.objecttypes.objecttype:
		if object_properties.name == object_type_name:
			return object_properties.property
	pass
	
func GetObjectPropertyFor(object_properties, property_name):
	for property in object_properties:
		if property.name == property_name:
			match property.type:
				"int": return int(property.default)
				"float": return float(property.default)
				"string": return property.default
				"boolean": return bool(property.default)
	return null
	
func CreateInstance(object,name,pos):
	
	var _instance = object.instance()
	_instance.name = name
	_instance.set_position(pos + Vector2(8, -8))	
	self.root_entities.add_child(_instance)
	_instance.set_owner(self.root_entities)
	return _instance
	
func CreateEntity(obj,entity_name,prefab_name,add_number=true):
	
	var entity_prefab = load(prefab_name)	
	var entity_pos = obj.get_position()
	
	if add_number:
		return CreateInstance(entity_prefab,entity_name+"("+obj.name+")",entity_pos)
	else:
		return CreateInstance(entity_prefab,entity_name,entity_pos)

func GetObjectProperty(obj, property_name):
	print(obj.get_meta_list())
	if obj.has_meta(property_name):
		return obj.get_meta(property_name)

	var obj_type = self.GetObjectTypeFor(obj.get_meta("Type"))
	return self.GetObjectPropertyFor(obj_type,property_name)
	
	pass


# ------------------------------------------------------------------
# ITEM: HEALTH
# ------------------------------------------------------------------
func Create_health(obj):

	var prefabName = self.GetObjectProperty(obj,"PrefabName")
	var entityName = self.GetObjectProperty(obj,"Name")
	var entity = CreateEntity(obj,entityName,prefabName)

	entity.item_amount = self.GetObjectProperty(obj,"Amount")

# ------------------------------------------------------------------
# ITEM: AMMO
# ------------------------------------------------------------------
func Create_ammo(obj):

	var prefabName = self.GetObjectProperty(obj,"PrefabName")
	var entityName = self.GetObjectProperty(obj,"Name")
	var entity = CreateEntity(obj,entityName,prefabName)

	entity.item_amount = self.GetObjectProperty(obj,"Amount")
	
	pass

# ------------------------------------------------------------------
# ITEM: GRANADE
# ------------------------------------------------------------------
func Create_granade(obj):

	var prefabName = self.GetObjectProperty(obj,"PrefabName")
	var entityName = self.GetObjectProperty(obj,"Name")
	var entity = CreateEntity(obj,entityName,prefabName)

	entity.item_amount = self.GetObjectProperty(obj,"Amount")
	
	pass

# ------------------------------------------------------------------
# ITEM: COIN
# ------------------------------------------------------------------
func Create_coin(obj):

	var prefabName = self.GetObjectProperty(obj,"PrefabName")
	var entityName = self.GetObjectProperty(obj,"Name")
	var entity = CreateEntity(obj,entityName,prefabName)

	entity.item_amount = self.GetObjectProperty(obj,"Amount")
	
	pass
	
# ------------------------------------------------------------------
# SCENE: PLAYER START POSITION
# ------------------------------------------------------------------
func Create_PlayerStart(obj):

	var prefabName = self.GetObjectProperty(obj,"PrefabName")
	var entityName = self.GetObjectProperty(obj,"Name")
	var entity = CreateEntity(obj,entityName,prefabName)
	entity.name="StartPoint"
	print("Create_PlayerStart()")
	entity.Respawn(Globals.player)
	pass
	
# ------------------------------------------------------------------
# SCENE: INFO PANEL
# ------------------------------------------------------------------
func Create_InfoPanel(obj):

	var prefabName = self.GetObjectProperty(obj,"PrefabName")
	var entityName = self.GetObjectProperty(obj,"Name")
	var entity = CreateEntity(obj,entityName,prefabName)
	
	
	entity.info_text = self.GetObjectProperty(obj,"Text")
	var ox = self.GetObjectProperty(obj,"Offset_x")
	var oy = self.GetObjectProperty(obj,"Offset_y")
	entity.panel_offset = Vector2(ox,oy)
	
	pass

# ------------------------------------------------------------------
# SCENE: HAZARD
# ------------------------------------------------------------------
func Create_Hazard(obj):

	var prefabName = self.GetObjectProperty(obj,"PrefabName")
	var entityName = self.GetObjectProperty(obj,"Name")
	var entity = CreateEntity(obj,entityName,prefabName)
	
	entity.damage = self.GetObjectProperty(obj,"Damage")
	
	
	pass
	
# ------------------------------------------------------------------
# SCENE: ENEMY
# ------------------------------------------------------------------
func Create_Enemy(obj):

	var prefabName = self.GetObjectProperty(obj,"PrefabName")
	var entityName = self.GetObjectProperty(obj,"Name")
	var entity = CreateEntity(obj,entityName,prefabName)
	
	entity.damage = self.GetObjectProperty(obj,"Damage")
	entity.armor = self.GetObjectProperty(obj,"Armor")
	entity.speed = self.GetObjectProperty(obj,"Speed")
	
	
	pass
	
# ------------------------------------------------------------------
# SCENE: TELEPORT
# ------------------------------------------------------------------
func Create_Teleport(obj):

	var prefabName = self.GetObjectProperty(obj,"PrefabName")
	var entityName = self.GetObjectProperty(obj,"Name")
	var entity = CreateEntity(obj,entityName,prefabName,false)
	
	
	entity.source_name = self.GetObjectProperty(obj,"SourceName")	
	entity.target_name = self.GetObjectProperty(obj,"TargetName")
	entity.need_key_item = self.GetObjectProperty(obj,"NeedKey")
	entity.key_item_name = self.GetObjectProperty(obj,"KeyName")
	
	
	pass
	
# ------------------------------------------------------------------
# SCENE: POWERUP - GRAVITY
# ------------------------------------------------------------------
func Create_PowerUp_Gravity(obj):

	var prefabName = self.GetObjectProperty(obj,"PrefabName")
	var entityName = self.GetObjectProperty(obj,"Name")
	var entity = CreateEntity(obj,entityName,prefabName)
	
	entity.time_to_off = self.GetObjectProperty(obj,"Time")
	var gy = self.GetObjectProperty(obj,"Gravity")
	entity.new_gravity.y = gy
	entity.new_gravity.x = 0
	
	pass
	
# ------------------------------------------------------------------
# SCENE: POWERUP - SPEED
# ------------------------------------------------------------------
func Create_PowerUp_Speed(obj):

	
	var prefabName = self.GetObjectProperty(obj,"PrefabName")
	var entityName = self.GetObjectProperty(obj,"Name")
	var entity = CreateEntity(obj,entityName,prefabName)
	
	entity.time_to_off = self.GetObjectProperty(obj,"Time")
	entity.new_speed = self.GetObjectProperty(obj,"Speed")
	
	pass
	
# ------------------------------------------------------------------
# SCENE: POWERUP - JUMP
# ------------------------------------------------------------------
func Create_PowerUp_Jump(obj):

	var prefabName = self.GetObjectProperty(obj,"PrefabName")
	var entityName = self.GetObjectProperty(obj,"Name")
	var entity = CreateEntity(obj,entityName,prefabName)
	
	entity.time_to_off = self.GetObjectProperty(obj,"Time")
	entity.new_jump_force = self.GetObjectProperty(obj,"Force")
	pass

# ------------------------------------------------------------------
# SCENE: ITEM - CHEST KEYs
# ------------------------------------------------------------------
func Create_ChestKey(obj):
	
	var prefabName = self.GetObjectProperty(obj,"PrefabName")
	var entityName = self.GetObjectProperty(obj,"Name")
	var entity = CreateEntity(obj,entityName,prefabName)
	
	entity.item_amount = self.GetObjectProperty(obj,"Amount")
	
	pass

# ------------------------------------------------------------------
# SCENE: CHEST - NO KEY
# ------------------------------------------------------------------
func Create_Chest(obj):
	
	var prefabName = self.GetObjectProperty(obj,"PrefabName")
	var entityName = self.GetObjectProperty(obj,"Name")
	var entity = CreateEntity(obj,entityName,prefabName)
	
	entity.need_key = self.GetObjectProperty(obj,"NeedKey")
	entity.key_name = self.GetObjectProperty(obj,"KeyName")
	
	pass
