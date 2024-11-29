extends TextureRect

var smallsesame_image = preload("res://images/smallsesame.png")
var largesesame_image = preload("res://images/largesesame.png")
var chive_image = preload("res://images/chive.png")
var egg_image = preload("res://images/egg.png")
var shrimp_image = preload("res://images/shrimp.png")
var turnip_image = preload("res://images/turnip.png")
var shumai_image = preload("res://images/shumai.png")
var steamed_image = preload("res://images/steamed.png")

var chopstick = preload("res://chopstick.gd")

var moving:bool = false
var target:Vector2

signal move_complete()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if moving == true:
		self.position = self.position.move_toward(target, delta * 4000)
		if self.position == target:
			done_moving()


# https://docs.godotengine.org/en/stable/tutorials/2d/2d_movement.html click and move

func done_moving() -> void:
	self.visible = false
	moving = false
	move_complete.emit()

# this doesn't account for rotation, so it will always start from a starting point if the rotation is not accounted for.
func move_item(item:int, start:Vector2, end:Vector2) -> void:
	self.set_position(start)
	self.visible = true
	target = end
	match item:
		0:
			set_texture(Global.smallsesame_image)
		1:
			set_texture(largesesame_image)
		2:
			set_texture(chive_image)
		3:
			set_texture(egg_image)
		4:
			set_texture(shrimp_image)
		5:
			set_texture(turnip_image)
		6:
			set_texture(shumai_image)
		7:
			set_texture(steamed_image)
		Global.Items.CHOPSTICK:
			set_texture(chopstick)
	moving = true
	
	
