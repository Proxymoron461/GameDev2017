/// @description general player code
// take player inputs and move sprite accordingly
move_left = keyboard_check(ord("A"));
move_right = keyboard_check(ord("D"));
move_up = keyboard_check(ord("W"));
move_down = keyboard_check(ord("S"));
attack_button = mouse_check_button(mb_left);

if move_left {
	hspeed = -3;
} else if move_right {
	hspeed = 3;
} else {
	hspeed = 0;
}

if move_up {
	vspeed = -3;
} else if move_down {
	vspeed = 3;
} else {
	vspeed = 0;
}

// check for mouse press and fire if true
if attack_button {
	instance_create_layer(x, y, "Instances", bullet_obj);
	with bullet_obj {
		if !has_direction {
			correct_direction = point_direction(x, y, mouse_obj.x, mouse_obj.y);
			direction = correct_direction;
			speed = 10;
			image_angle = correct_direction;
			has_direction = true;
		}
	}
}