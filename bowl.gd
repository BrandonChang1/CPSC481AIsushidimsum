# todo: make current item tightly coupled with button icon

extends MenuButton

@export var bowl_index:int = 0
@export var current_item:Global.Items = Global.Items.SMALL_SESAME
@export var rotational_position:int = 0

signal food_taken(bowl:int,taken:int,revealed:int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.get_popup().id_pressed.connect(_on_item_menu_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func rotate(degrees: int) -> void:
	self.set_rotation_degrees(self.get_rotation_degrees() + degrees)


func _about_to_popup():
	print("i'm popping up")
	var random_choice:int = randi_range(0, get_item_count() - 1)
	for n in get_item_count():
		get_popup().set_item_text(n, Global.item_string(n))
	get_popup().set_item_text(random_choice, (get_popup().get_item_text(random_choice) + "RANDOM CHOICE"))


func _on_item_menu_pressed(id: int):
	print("Bowl ", bowl_index, " was ", current_item , " now ", id)
	food_taken.emit(bowl_index,current_item,id)
	current_item = id
	match id:
		0:
			set_button_icon(Global.smallsesame_image)
		1:
			set_button_icon(Global.largesesame_image)
		2:
			set_button_icon(Global.chive_image)
		3:
			set_button_icon(Global.egg_image)
		4:
			set_button_icon(Global.shrimp_image)
		5:
			set_button_icon(Global.turnip_image)
		6:
			set_button_icon(Global.shumai_image)
		7:
			set_button_icon(Global.steamed_image)
