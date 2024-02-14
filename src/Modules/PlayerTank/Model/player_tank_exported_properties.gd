class_name PlayerTankExportedProperties
extends KinematicBody2D

export var speed_velocity: int = 250 setget set_speed_velocity, get_speed_velocity
export var bullet_limit_shot: int = 5 setget set_bullet_limit_shot, get_bullet_limit_shot

func set_speed_velocity(value: int):
	speed_velocity = value

func get_speed_velocity():
	return speed_velocity

func set_bullet_limit_shot(value: int):
	bullet_limit_shot = value

func get_bullet_limit_shot():
	return bullet_limit_shot
