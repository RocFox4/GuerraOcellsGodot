extends Node2D
var contadorPunts = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	$Puntuació.hide()
	$LabelComptador.hide()
	contadorPunts = -1
func _on_jugar_pressed():
	$Comptador.wait_time= GuerraOcells.tempsPartida
	$LabelComptador.show()
	$Puntuació.show()
	$Comptador.start()
	$ÚltimaPuntuació.hide()
	contadorPunts=0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$LabelComptador.set_text("Temps Restant: "+str(round($Comptador.time_left)))
func _on_comptador_timeout():
	$Puntuació.hide()
	$LabelComptador.hide()
	$Comptador.stop()
	$ÚltimaPuntuació.show()
	$ÚltimaPuntuació.set_text("Última Puntuació: "+str(contadorPunts))

func _on_ocell_body_entered(body):
	if body.name == "ocell2": 
		contadorPunts+=1
		$Puntuació.set_text("Punts: "+str(contadorPunts))
