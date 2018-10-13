extends Node

# Movement facing state
enum eFacing { TO_LEFT, TO_RIGHT}

enum eDirection { IDLE = 0,TO_LEFT = -1, TO_RIGHT=1, TO_UP = -1, TO_DOWN = 1 }

# Action state
#enum eActionState { FIRE, THROW, STAB, USE }

# Animation state
enum eAnimState { IDLE, WALK, JUMP, FALL, DIE, HURT, CLIMB, OBSTACLE, CRUNCH, CRUNCHWALK }

# screen transition mode
enum eTransitionMode { NONE,TO_BLACK,TO_TRANSPARENT}

# ---------------------------------------------------------------------------
# GAME data
# ---------------------------------------------------------------------------
var coins = 0;
var health = 0;
var items = {};

# ---------------------------------------------------------------------------
# GAME prefabs 
# ---------------------------------------------------------------------------

# teleport button info

# powerups

# bullet prefab for firing
onready var bullet_prefab = preload("res://Prefabs/Bullet/Bullet.tscn")

# Sound FX player
var player_sfx = null

# ---------------------------------------------------------------------------
# GAME Levels
# ---------------------------------------------------------------------------

