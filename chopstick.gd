extends RichTextLabel

@export var bowl:int = 0
@export var chopsticks:int = 0

var chopsticks_image = preload("res://images/chopsticks_sq.png")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update()


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
	ending_text()

func starting_text() -> void:
	self.append_text("[center]B" + str(bowl) + "\n")

func ending_text() -> void:
	pass
	#if chopsticks > 1:
		#self.append_text("[/center]")
