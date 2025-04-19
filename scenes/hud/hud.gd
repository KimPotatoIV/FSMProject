extends CanvasLayer

##################################################
var state_label_node: Label
# 현재 상태를 나타내는 라벨

##################################################
func _ready() -> void:
	state_label_node = $MarginContainer/StateLabel
	# 현재 상태를 나타내는 라벨 설정

##################################################
func _process(delta: float) -> void:
	state_label_node.text = "State: " + str(GM.get_current_state())
	# 현재 상태를 나타내는 라벨에 GM에서 가져온 현재 상태 값을 업데이트
