extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_process(true);
	set_process_input(true);
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func _input(event):
	if(event.type == InputEvent.MOUSE_BUTTON):
		if(event.button_index == BUTTON_RIGHT):
			var name = get_node("/root/GLOBAL_SYS").getPlayerName();
			print(name);
			var power = Globals.get("MAX_POWER_LEVEL");
			print(power);
			get_tree().set_input_as_handled()
	pass
		
func _process(delta):
	_effectCheck()
	
	if(Input.is_key_pressed(KEY_Z)):
		get_node("/root/GLOBAL_SYS").currentScene = get_tree().get_root().get_child(get_tree().get_root().get_child_count()-1);
		
		get_node("/root/GLOBAL_SYS").setScene("res://stages/main_menu.tscn");
			
	get_node("/root/GLOBAL_INPUT").quitGame();
	pass

func _effectCheck():
	GLOBAL_INPUT.changeEffect();
	
	if(GLOBAL_SYS.effect == 0):
		get_node("overlay").hide()
	else:
		get_node("overlay").show()