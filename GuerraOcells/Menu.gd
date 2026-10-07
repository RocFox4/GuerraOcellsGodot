extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_jugar_pressed():
	set_process_input(false)
	set_process(false)
	hide() 

func _on_sortir_pressed():
	get_tree().quit()

func _on_comptador_timeout():
	set_process_input(true)
	set_process(true)
	show() 
