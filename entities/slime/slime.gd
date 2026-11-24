extends CharacterBody2D
@onready var slime_animation: AnimatedSprite2D = $"slime animation"


var player
func _ready() -> void:
	player = get_node("/root/main/player")

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 55
	move_and_slide()
	
