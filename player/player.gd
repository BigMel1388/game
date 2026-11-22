extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	animated_sprite_2d.play("idle")
	if Input.is_action_pressed("move_left"):
		animated_sprite_2d.flip_h = true
	elif Input.is_action_just_pressed("move_right"):
		animated_sprite_2d.flip_h = false
	move_and_slide()
	
