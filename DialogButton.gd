
#this button needs to be spawn in a  dialog scene Dialog.
extends Button

#access to this scene node
var dialog = preload("res://Dialog.tscn")

#create an instance, set it to null by default, we can keep track when we spawn
# one of these
var instan = null

# to create the dialog as dictionary, which is consist of a key and a value
var dialog_content = {
	# add initial option
	"0": {
		"image" : "NaomiRedesign.png",
		"text" : "Hi, I am Naomi, the leader of debate team.",
		"options" : [
			{"text" : "arguement", "next" : "1"},
			{"text" : "proposition", "next" : "2"},
			{"text" : "Exit", "next" : "-1"}
		]
	},
	
	"1" : {
		"image" : "NaomiRedesign.png",
		"text" : "You choose argement",
		"options" : [
			{"text" : "choice A", "next" : "3"},
			{"text" : "choice B", "next" :"4"},
			{"text" : "choice C", "next" : "5"},
			{"text" : "choice D", "next" :"6"},
		]
	},
	
	"2" : {
		"image" : "NaomiRedesign.png",
		"text" : "You choose proposition",
		"options" : [
			{"text" : "exit", "next": "-1"},
			{"text" : "return to main scene" , "next" : "0"}
		]
		
		
	},
	
	"3" : {
		"image" : "second-member.png",
		"text" : "your answer is A",
		"options" : [
			{"text" : "return to arg opt" , "next" : "1"},
			{"text" : "yes exit", "next" : "-1"}
		]
		
	},
	
	"4" : {
		"image" : "second-member.png",
		"text" : "Your answer is B",
		"options" : [
			{"text":"return to arg opt", "next" : "1"},
			{"text" : "no exit", "next" : "-1"}
		]
		
	},
	"5" : {
		"image" : "second-member.png",
		"text" : "Your answer is C",
		"options" : [
			{"text":"return to arg opt", "next" : "1"},
			{"text" : "no exit", "next" : "-1"}
		]
		
	},
	"6" : {
		"image" : "second-member.png",
		"text" : "Your answer is D",
		"options" : [
			{"text":"return to arg opt", "next" : "1"},
			{"text" : "no exit", "next" : "-1"}
		]
		
	},
} 


var start = "0"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_DialogButton_pressed():
	#if the dialog is already opened, queue free the old one,get rid of the old dialog
	if instan != null:
		instan.queue_free()
	
	# create a new one
	instan = dialog.instance()
	instan.conversation_data = dialog_content
	instan.conversation_start = start
	
	#spawn instance
	get_parent().add_child(instan)
