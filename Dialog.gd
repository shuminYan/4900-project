extends Control

#access to nodes in Dialog.tscn
onready var char_image = $VBoxContainer/DialogBox/HBoxContainer/DialogImage
onready var char_text = $VBoxContainer/DialogBox/HBoxContainer/DialogText
onready var player_opts = $VBoxContainer/PlayerOptions/HBoxContainer

#create two vars, one is dictionary, one is zero by default
var conversation_data = {}
var conversation_start = "0"
#var dialog_image = preload("res://images/")

# Called when the node enters the scene tree for the first time.
func _ready():
	#to text the project
	_setup(conversation_start)



#create an internal func with a parameter to set up our entire dialog view.
#whatever currently displayed shoud be done here
#the parameter is used to refers to the section(0,1,2,3...) in DialogButton.gd 
#script.

func _setup(section):
	var content = conversation_data[section]
	
	#access the text in DialogButton.gd script "text" in dictionary
	char_text.text = content.text # or ["text"]
	char_image.texture = load("res://images/" + content.image)
	

	#get rid of options already exist in our list (Dialog scene: such as children
	#in HBoxContainer ) before we spawn a new one
	for child in player_opts.get_children():
		child.queue_free()
		
	#create a new one
	for option in content.options: #options in DialogButton.gd 's dictionary
		var Dbutton = LinkButton.new()
		Dbutton.underline = LinkButton.UNDERLINE_MODE_ON_HOVER
		Dbutton.text = option.text
		
		#connect the button to the func, the last argument is going to be stored
		#inside our connection btwn the button and the func 
		Dbutton.connect("pressed",self,"_on_playerOptionsBtn_pressed",[option.next])
		 
		#add the button to the box
		player_opts.add_child(Dbutton)
		
	#call the func when the button is pressed
func _on_playerOptionsBtn_pressed(next):
		#if next == -1, quit the current dialog,get rid of the entire dialog window
		#otherwise, call _setup func again to specify which section to get data from
	if next == "-1":
		queue_free()
	
	else:
		_setup(next)
			
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
