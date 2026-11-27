
extends CharacterBody2D

@export var speed: float = 90.0
@export var stop_distance: float = 13.0

@onready var slime_animation: AnimatedSprite2D = $slime_animation

var player: Node2D


func _ready() -> void:
	player = get_node("/root/main/player")


func _physics_process(_delta: float) -> void:
	if player == null:
		return

	var distance = global_position.distance_to(player.global_position)

	var direction = global_position.direction_to(player.global_position)

	# Flip sprite depending on player direction
	if direction.x > 0.0:
		slime_animation.flip_h = false
	elif direction.x < 0.0:
		slime_animation.flip_h = true

	# Movement
	if distance > stop_distance:
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO

	move_and_slide()

	# Animation
	if slime_animation.animation != "walk":
		slime_animation.play("walk")
