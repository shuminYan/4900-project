extends Control

#declare vars to hold data of player's lives, and set the max lives
var lives = 5 setget set_lives
var max_lives = 5 setget set_max_lives

#declare a var to access the node in this scene
onready var label = $Label

#func set_lives use clamp method set lives never less than zero or greater than max lives
func set_lives(value):
	lives = clamp(value,0,max_lives)

#max value can never less than one
func set_max_lives(value):
	max_lives = max(value,1)

func _ready():
	#max lives should be the player's max lives
	#lives should be the player's lives
	#self.max_lives = PlayerStats.max_lives
	pass
