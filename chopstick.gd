extends RichTextLabel

var chopsticks_image = preload("res://images/chopsticks.png")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func rotate(degrees: int) -> void:
	self.set_rotation_degrees(self.get_rotation_degrees() + degrees)


func update(count:int) -> void:
	self.clear()
	if count > 0:
		self.add_image(chopsticks_image)
	if count > 1:
		self.add_text(" "+str(count))
