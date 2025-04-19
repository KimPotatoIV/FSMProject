extends Node2D

##################################################
var anim_sprite_node: AnimatedSprite2D
# 애니메이션 노드
var player: CharacterBody2D
# 플레이어 노드

##################################################
func _ready() -> void:
	anim_sprite_node = $"../../AnimatedSprite2D"
	player = get_parent().get_parent()
	# 각 노드 설정

##################################################
func _physics_process(delta: float) -> void:
	if get_parent().current_state != get_parent().crouch_state:
		return
	# state_machine에서 현재 상태 값이 crouch일 때만 아래 코드를 실행
	
	if Input.is_action_just_released("ui_down") and player.is_on_floor():
		get_parent().change_state(get_parent().idle_state)

	player.move_and_slide()
	# 물리 기반 움직임을 처리하기 위해 모든 상태에서 각각 실행

##################################################
func enter() -> void:
	anim_sprite_node.play("crouch")
# 상태 진입 시 알맞은 애니메이션 실행

##################################################
func exit() -> void:
	pass
# 상태 이탈 시 실행
