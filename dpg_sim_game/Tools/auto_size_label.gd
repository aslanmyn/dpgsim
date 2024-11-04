class_name AutoSizeLabel extends Label

export var max_font_size: int = 32
export var padding: int = 0

var custom_font: DynamicFont
var previous_text_length: int

signal text_changed

func _ready():
	var current_font = get_font("font", theme_type_variation)
	custom_font = DynamicFont.new()
	custom_font.font_data = current_font.font_data
	add_font_override("font", custom_font)
	clip_text = true
	update_font_size()
	connect("text_changed", self, "update_font_size")


# TODO: This is naive approach. Not optimized
func _process(_delta):
	var current_text_length = len(text)
	if (current_text_length != previous_text_length):
		emit_signal("text_changed")
		previous_text_length = current_text_length



func update_font_size() -> void:
	var font_size = custom_font.get_height()

	for i in 30:
		var text_size = custom_font.get_string_size(text)
		if text_size.x + 2 * padding > floor(rect_size.x) || font_size > max_font_size:
			font_size -= 1
		elif font_size < max_font_size:
			font_size += 1
		custom_font.size = font_size


func _on_item_rect_changed() -> void:
	update_font_size()
