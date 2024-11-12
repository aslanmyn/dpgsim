extends Node

# Dependencies
onready var start_button = $CenterContainer/Control/Start_Button
onready var settings_button = $CenterContainer/Control/Settings_Button
onready var credits_button = $CenterContainer/Control/Credits_Button
onready var language_radio_button = $CenterContainer/Control/LanguageRadio
onready var credits = $CenterContainer/Control/Credits
onready var settings = $CenterContainer/Control/Settings

func Start():
	start_button.connect("buttonPressed", global.game, "_on_Start_Button_buttonPressed")
	start_button.Start()
	settings_button.Start()
	credits_button.Start()
	language_radio_button.Start()

func _on_Credits_Button_buttonPressed():
	credits.visible = true
	credits.Start()
	ShowMainMenu(false)
	
func ShowMainMenu(show):
	start_button.visible = show
	settings_button.visible = show
	credits_button.visible = show
	language_radio_button.visible = show

func _on_Settings_Button_buttonPressed():
	settings.Start()
	settings.visible = true
	ShowMainMenu(false)
	settings.connect("on_back", self, "_on_Settings_back")

func _on_Settings_back():
	ShowMainMenu(true)
	settings.disconnect("on_back", self, "_on_Settings_back")

