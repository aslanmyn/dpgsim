class_name AutoSizeLabel extends Label

export var max_font_size: int = 56
export var padding: int = 0

var custom_font: DynamicFont


func _ready():
	var current_font = theme.default_font
	custom_font = DynamicFont.new()
	custom_font.font_data = current_font.font_data
	add_font_override("font", custom_font)
	clip_text = true
	update_font_size()
	# connect("item_rect_changed", self, "_on_item_rect_changed")


func update_font_size() -> void:
	var font_size = custom_font.get_height()
	print(font_size)

	for i in 20:
		var text_size = custom_font.get_string_size(text)
		if text_size.x + 2 * padding > floor(rect_size.x) || font_size > max_font_size:
			font_size -= 1
		elif font_size < max_font_size:
			font_size += 1
		custom_font.size = font_size

	print(font_size)


func _on_item_rect_changed() -> void:
	update_font_size()
