/// @description code for player_obj normal state (game loop)
// get player inputs and assign to instance variables
get_inputs();

// assign player speeds with move_* variables
hspeed = 3 * (move_right - move_left);
vspeed = 3 * (move_down - move_up);

// fire bullet if mouse pressed
fire_bullet();