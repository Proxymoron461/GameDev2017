// check for mouse press and fire if true
if attack_button && can_attack {
	// create bullet object, make player unable to attack, set alarm to speed of gun
	instance_create_layer(x, y, "Instances", bullet_obj);
	can_attack = false;
	alarm[0] = 5;
	// assign correct speed and direction to bullet object with has_direction instance variable
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