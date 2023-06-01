extends Node2D


@onready var label = $Label
@onready var timer = $Timer

var current_time = 0

var target_minutes: int =25
var target_seconds: int =0

func _ready():
	current_time = target_minutes*60 + target_seconds

func _on_timer_timeout():
	_update_cronometro()


func _update_cronometro()->void:
	var horas = floor(current_time / 3600);
	var minutos = floor((current_time - (horas * 3600)) / 60);
	var segundos = floor(current_time % 60);
	
	if minutos < 10:
		minutos = str("0",minutos)
	if segundos < 10:
		segundos = str("0",segundos)
	
	label.text = str(minutos, ":", segundos)
	
	current_time -= 1
	if current_time <= 0:
		$timer.stop()

