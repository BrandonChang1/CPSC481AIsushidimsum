# todo: make current item tightly coupled with button icon

extends MenuButton

@export var bowl_index:int = 0
@export var current_item:Global.Items = Global.Items.SMALL_SESAME

# should these be in the global instead?
var smallsesame_image = preload("res://images/smallsesame.png")
var largesesame_image = preload("res://images/largesesame.png")
var chive_image = preload("res://images/chive.png")
var egg_image = preload("res://images/egg.png")
var shrimp_image = preload("res://images/shrimp.png")
var turnip_image = preload("res://images/turnip.png")
var shumai_image = preload("res://images/shumai.png")
var steamed_image = preload("res://images/steamed.png")


signal food_taken(bowl:int,taken:int,revealed:int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.get_popup().id_pressed.connect(_on_item_menu_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func rotate(degrees: int) -> void:
	self.set_rotation_degrees(self.get_rotation_degrees() + degrees)


func _on_item_menu_pressed(id: int):
	print("Bowl ", bowl_index, " was ", current_item , " now ", id)
	food_taken.emit(bowl_index,current_item,id)
	current_item = id
	match id:
		0:
			set_button_icon(smallsesame_image)
		1:
			set_button_icon(largesesame_image)
		2:
			set_button_icon(chive_image)
		3:
			set_button_icon(egg_image)
		4:
			set_button_icon(shrimp_image)
		5:
			set_button_icon(turnip_image)
		6:
			set_button_icon(shumai_image)
		7:
			set_button_icon(steamed_image)
