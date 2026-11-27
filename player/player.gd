extends CharacterBody2D

@export var speed: float = 150.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(_delta: float) -> void:
	var input_vector := Input.get_vector("move_left", "move_right", "move_up", "move_down")

	velocity = input_vector * speed
	move_and_slide()
	_update_animation(input_vector)


func _update_animation(input_vector: Vector2) -> void:
	if input_vector.x > 0.0:
		animated_sprite.flip_h = false
	elif input_vector.x < 0.0:
		animated_sprite.flip_h = true

	if input_vector.length() > 0.0:
		if animated_sprite.animation != "run":
			animated_sprite.play("run")
	else:
		if animated_sprite.animation != "idle":
			animated_sprite.play("idle")
