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

var square_items:Array[Resource] = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	square_items.append(preload("res://images/smallsesame_sq.png"))
	square_items.append(preload("res://images/largesesame_sq.png"))
	square_items.append(preload("res://images/chive_sq.png"))
	square_items.append(preload("res://images/egg_sq.png"))
	square_items.append(preload("res://images/shrimp_sq.png"))
	square_items.append(preload("res://images/turnip_sq.png"))
	square_items.append(preload("res://images/shumai_sq.png"))
	square_items.append(preload("res://images/steamed_sq.png"))
	square_items.append(preload("res://images/chopsticks_sq.png"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func player_string(player:Players) -> String:
	match player:
		Players.PLAYER1:
			return "Player One"
		Players.PLAYER2:
			return "Player Two"
		Players.PLAYER3:
			return "Player Three"
		Players.PLAYER4:
			return "Player Four"
		Players.PLAYER5:
			return "Player Five"
		Players.PLAYER6:
			return "Player Six"
		_:
			return "BIGPROBLEM"
