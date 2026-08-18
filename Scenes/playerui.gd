extends CanvasLayer

@onready var heart_container: HBoxContainer = $HeartContainer
var hearts: Array = []

@onready var score_text: Label = $"../ScoreText"




func _ready() -> void:
	var player = get_parent()
	hearts = heart_container.get_children()
	
	
	player.OnTakeDamage.connect(_update_hearts)
	player.OnUpdateScore.connect(_update_score_text)
	
	_update_score_text(PlayerStats.score)
	_update_hearts(player.health)
	
	


func _update_hearts(health: int):
	for i in len(hearts):
		hearts[i].visible = i < health
	
	
func _update_score_text(score: int):
	score_text.text = "Очки: " + str(score)
	
