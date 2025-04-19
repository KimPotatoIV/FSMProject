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
	if get_parent().current_state != get_parent().run_state:
		return
	# state_machine에서 현재 상태 값이 run일 때만 아래 코드를 실행
	
	if Input.is_action_just_pressed("ui_accept") and player.is_on_floor():
	# 땅에 붙어있을 때 스페이스 키를 누르면
		player.velocity.y = get_parent().JUMP_VELOCITY
		# 점프 velocity 적용
		get_parent().change_state(get_parent().jump_state)
		# jump 상태로 변경
	
	get_parent().direction = Input.get_axis("ui_left", "ui_right")
	# 좌우 입력 시 direction에 값 업데이트
	if get_parent().direction:
	# 좌우 입력이 있으면
		player.velocity.x = get_parent().direction * get_parent().MOVING_SPEED
		# 물리적으로 움직임 적용
	else:
	# 좌우 입력이 없으면
		player.velocity.x = move_toward(player.velocity.x, 0, get_parent().MOVING_SPEED)
		# 정지할 수 있도록 설정
		get_parent().change_state(get_parent().idle_state)
		# idle 상태로 변경
		
	
	if get_parent().direction < 0:
	# direction이 0보다 작으면
		anim_sprite_node.flip_h = true
		# 스프라이트 좌우 반전 설정
	elif get_parent().direction > 0:
	# direction이 0보다 크면
		anim_sprite_node.flip_h = false
		# 스프라이트 좌우 반전 해제
	
	player.move_and_slide()
	# 물리 기반 움직임을 처리하기 위해 모든 상태에서 각각 실행

##################################################
func enter() -> void:
	anim_sprite_node.play("run")
# 상태 진입 시 알맞은 애니메이션 실행

##################################################
func exit() -> void:
	pass
# 상태 이탈 시 실행
