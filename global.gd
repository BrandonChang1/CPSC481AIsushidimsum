extends Node

enum Items {
	SMALL_SESAME,
	LARGE_SESAME,
	CHIVE,
	EGG,
	SHRIMP,
	TURNIP,
	SHUMAI,
	STEAMED,
	CHOPSTICK
}

enum Players {
	PLAYER1,
	PLAYER2,
	PLAYER3,
	PLAYER4,
	PLAYER5,
	PLAYER6,
	NOBODY
}

var smallsesame_image = preload("res://images/smallsesame.png")
var largesesame_image = preload("res://images/largesesame.png")
var chive_image = preload("res://images/chive.png")
var egg_image = preload("res://images/egg.png")
var shrimp_image = preload("res://images/shrimp.png")
var turnip_image = preload("res://images/turnip.png")
var shumai_image = preload("res://images/shumai.png")
var steamed_image = preload("res://images/steamed.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
