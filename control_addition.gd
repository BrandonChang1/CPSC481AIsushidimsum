extends Control

func rotate(degrees: int) -> void:
	self.set_rotation_degrees(self.get_rotation_degrees() + degrees)
