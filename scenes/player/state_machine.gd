extends Node2D

##################################################
const MOVING_SPEED: float = 400.0
const JUMP_VELOCITY = -600.0
# 상수 값들은 state_machine에서 관리 

var idle_state: Node2D
var run_state: Node2D
var jump_state: Node2D
var crouch_state: Node2D
# 상태 노드들

var current_state: Node2D
# 현재 실시간 상태 값
var direction: float
#현재 실시간 방향 값

##################################################
func _ready() -> void:
	idle_state = $Idle
	run_state = $Run
	jump_state = $Jump
	crouch_state = $Crouch
	# 상태 노드들 설정
	
	current_state = idle_state
	# 현재 실시간 상태 값을 idle_state로 설정

##################################################
func _physics_process(delta: float) -> void:
	if not get_parent().is_on_floor():
	# 바닥에 붙어있지 않으
		get_parent().velocity += get_parent().get_gravity() * delta
		# 중력 적용

##################################################
func _process(delta: float) -> void:
	GM.set_current_state(current_state)
	# HUD 표시를 위해 GM에 current_state 값 전달

##################################################
func change_state(state_value: Node2D) -> void:
# 상태 변경 시
	current_state.exit()
	#  current_state에서 나오고
	current_state = state_value
	# current_state를 새 값으로 설정 후
	current_state.enter()
	# current_state를 들어감
