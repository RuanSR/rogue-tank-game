class_name PlayerBase
extends KinematicBody2D

export var speed_velocity: int = 250 setget set_speed_velocity, get_speed_velocity

func set_speed_velocity(value: int):
	speed_velocity = value

func get_speed_velocity():
	return speed_velocity
