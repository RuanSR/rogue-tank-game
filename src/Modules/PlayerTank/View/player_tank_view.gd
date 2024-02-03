extends KinematicBody2D

const _prefab_bullet: PackedScene = preload("res://src/Modules/PlayerTank/View/TankBullet.tscn")

var _presenter: PlayerPresenter


onready var TankBodyCollisionPoly2D: CollisionPolygon2D = $TankBodyCollisionPoly2D
onready var TankBodySprite: Sprite = $TankBodySprite
onready var TankBarrelNode2D: Node2D = $TankBarrelNode2D
onready var BulletMuzzlePosition2D: Position2D = $TankBarrelNode2D/BulletMuzzlePosition2D
onready var TankBarrelSprite: Sprite = $TankBarrelNode2D/TankBarrelSprite
onready var BulletShotSprite: Sprite = $TankBarrelNode2D/BulletShotSprite
onready var BulletShotAnimationPlayer: AnimationPlayer = $TankBarrelNode2D/BulletShotAnimationPlayer


func _ready():
	_presenter = PlayerPresenter.new(self)
	
	_presenter.set_node_config()
	
	var list_bodies = dynamic_load_skins("res://src/Modules/PlayerTank/@Assets/tank_body/", ".png")
	var list_barrels = dynamic_load_skins("res://src/Modules/PlayerTank/@Assets/barrel/", ".png")
	
	TankBodySprite.texture = load(list_bodies[0])
	TankBarrelSprite.texture = load(list_barrels[3])
	
	
func _process(_delta):
	
	_presenter.on_move()
	_presenter.on_shoot()
	_presenter.look_at_mouse()

func dynamic_load_skins(path: String, file_extension: String) -> Array:
	var base_path = ProjectSettings.globalize_path(path)
	
	var list_of_paths: Array = []
	
	var dir = Directory.new()
	
	if dir.open(base_path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if !dir.current_is_dir() && file_name.ends_with(file_extension):
				list_of_paths.append(base_path+file_name)
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
		
	return list_of_paths

func load_ressource_path(obj, type) -> Dictionary:
	if(typeof(obj) == typeof(type)):
		print("o tipo ", typeof(obj), " eh do mesmo tipo de ", typeof(type))
		return {}
	print("o tipo ", typeof(obj), " nao eh do mesmo tipo de ", typeof(type))
	return {}
