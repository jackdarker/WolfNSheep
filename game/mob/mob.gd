extends CharacterBody3D

#Note: z- has to be front of mob-skin 
# 

enum STATE {DEAD=0,IDLE=1,FOLLOW=2,SEARCH=3,FLEE=4,ATTACK=5,GOHOME=6}

@export var speed:float = 3
@export var rotation_speed:float = 1
@export var home_pos:Vector3 = Vector3.ZERO
var _player_pos:Vector3
var _target_pos:Vector3	
var _gravity := -30.0
var _state:STATE = STATE.IDLE
var _prev_state:STATE

@export var view_cone:Vector3 = Vector3(2,1,10):
	set(value):
		%view_range.target_position =Vector3(0,0,0)#-1*value.z)
		%view_range.shape.points=[Vector3(value.x,0,-1*value.z),Vector3(-1*value.x,0,-1*value.z),Vector3(0,0,0)]
		view_cone=value

@export var attack_cone:Vector3 = Vector3(1,1,2):
	set(value):
		%attack_range.target_position =Vector3(0,0,-1*value.z)
		%attack_range.shape.points=[Vector3(value.x,0,0),Vector3(-1*value.x,0,0),Vector3(0,0,value.z)]
		attack_cone=value

func _ready() -> void:
	view_cone=view_cone
	#attack_cone=attack_cone
	_state = STATE.IDLE
	home_pos=global_position
	_player_pos=home_pos
	_target_pos=home_pos
	%state_timer.timeout.connect(on_statetimer)

func on_statetimer():
	if(_state==STATE.SEARCH):
		_state=STATE.IDLE
	
func _process(delta: float) -> void:
	_prev_state=_state	
	#attack if in range
	var colliders :Array=%attack_range.collision_result
	for collider in colliders:
		if collider.collider.is_in_group("Player"):
			_player_pos=collider.collider.global_position
			%nav_agent.target_position=_player_pos
			#_state=STATE.ATTACK
	#follow if in view		
	if(_state==STATE.IDLE || _state==STATE.FOLLOW):
		colliders=%view_range.collision_result
		for collider in colliders:
			if collider.collider.is_in_group("Player"):
				_player_pos=collider.collider.global_position
				%nav_agent.target_position=_player_pos
				_state=STATE.FOLLOW
	#search if target missed
	if(_state==STATE.FOLLOW):
		if(%nav_agent.is_navigation_finished()):
			_state=STATE.SEARCH
	
	if(_state==STATE.SEARCH):	#search around point last spotted
		if(_prev_state!=STATE.SEARCH):
			%state_timer.wait_time=5
			%state_timer.start()
			%nav_agent.target_position=_player_pos+Vector3(0,0,5).rotated(Vector3.UP,randf()*PI)
		elif(%nav_agent.is_navigation_finished()):
			%nav_agent.target_position=_player_pos+Vector3(0,0,8).rotated(Vector3.UP,randf()*PI)


func _physics_process(delta):
	var _next:Vector3
	#var direction = (player.global_position - global_position).normalized()
	if(_state==STATE.FOLLOW || _state==STATE.SEARCH):
		#if(!%nav_agent.is_navigation_finished() && !%nav_agent.is_target_reached()):
			_next=%nav_agent.target_position
			_next.y=global_position.y
			_target_pos.y=global_position.y
			_target_pos=_target_pos.lerp(_next,rotation_speed*delta)#.slide(Vector3.UP)#.project(Vector3.UP)
			look_at(_target_pos)
			_target_pos.y=global_position.y
			var direction = (_target_pos-global_position).normalized()
			velocity = direction * speed
			var y_velocity := velocity.y
			velocity.y =  y_velocity+_gravity * delta
	else:
		velocity=Vector3.ZERO
	move_and_slide()
