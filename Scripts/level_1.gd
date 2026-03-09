extends Node2D

func check_if_blocks_exist():
	for group in get_children():
		for child in group.get_children():
			if child.name.contains("Block"):
				print("Ainda existe blocos na cena!")
				return true 
	print("nenhum bloco encontrado")
	goto_next_level()
	


func goto_next_level():
	GameManager.started = false
	GameManager.change_level()
