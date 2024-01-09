extends RigidBody2D

var reset_state = false

var force_air_on = false

func _integrate_forces(state):
	if reset_state:
		state.transform = Transform2D(0.0, Vector2(self.position.x, 60))
		
		
		reset_state = false
		
	if force_air_on:
		### FD = 0.5 * ro * v^2 * Cd * A
		### going to use CD and Area = 0.001
		### FD = 0.5 * ro * v^2
		### ro of air is air density 1.293 kg m^-3
		
		var v = linear_velocity.y
		var FD = 0.5 * 1.293 * v * v * 0.001
		
		apply_central_force(Vector2(0, -FD))
		

