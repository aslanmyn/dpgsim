extends Control

# Dependencies
onready var music = $Music
onready var music_label = $Music/Label
onready var sfx = $SFX
onready var sfx_label = $SFX/Label
onready var back = $Back

signal on_back

func Start():
	music.Start()
	sfx.Start()
	$Back.Start()
	UpdateSettings()

func UpdateSettings():
	music_label.text = trans.local("MUSIC") + ": "
	if global.musicOn:
		music_label.text += trans.local("ON")
	else:
		music_label.text += trans.local("OFF")
	sfx_label.text = trans.local("SFX") + ": "
	if global.sfxOn:
		sfx_label.text += trans.local("ON")
	else:
		sfx_label.text += trans.local("OFF")



func _on_Music_buttonPressed():
	global.musicOn = not global.musicOn
	UpdateSettings()
	global.game.soundManager.MusicOn(global.musicOn)

func _on_SFX_buttonPressed():
	global.sfxOn = not global.sfxOn
	UpdateSettings()
	global.game.soundManager.SfxOn(global.sfxOn)

func _on_Back_buttonPressed():
	visible = false
	emit_signal("on_back")
	# main_menu.ShowMainMenu(true)
