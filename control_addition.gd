extends Control

# this isn't working
func rotate(degrees: int) -> void:
	self.set_rotation_degrees(self.get_rotation_degrees() + degrees)
