extends RichTextLabel

@export var bowl:int = 0
@export var chopsticks:int = 0

var chopsticks_image = preload("res://images/chopsticks_sq.png")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	starting_text()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func rotate(degrees: int) -> void:
	self.set_rotation_degrees(self.get_rotation_degrees() + degrees)


func update() -> void:
	self.clear()
	starting_text()
	if chopsticks > 0:
		self.add_image(chopsticks_image)
	if chopsticks > 1:
		self.add_text(" x"+str(chopsticks))

func starting_text() -> void:
	self.add_text("B" + str(bowl) + " ")
