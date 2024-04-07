class_name BulletBase
extends Area2D

export var bullet_velocity: int = 400 setget set_bullet_velocity, get_bullet_velocity

func set_bullet_velocity(value: int):
	bullet_velocity = value

func get_bullet_velocity():
	return bullet_velocity
