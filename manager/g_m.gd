extends Node

##################################################
var current_state: Node2D
# 현재 상태 값

##################################################
func get_current_state() -> Node2D:
	return current_state
# 현재 상태 값 반환

##################################################
func set_current_state(state_value: Node2D) -> void:
	current_state = state_value
# 현재 상태 값 설정
