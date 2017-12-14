// variables for directions
right_key = keyboard_check(ord("D"));
// right_arrow = keyboard_check(vk_right);
left_key = keyboard_check(ord("A"));
// left_arrow = keyboard_check(vk_left);
up_key = keyboard_check(ord("W"));
// up_arrow = keyboard_check(vk_up);
down_key = keyboard_check(ord("S"));
// down_arrow = keyboard_check(vk_down);
// distance = point_distance(x, y, global.target_x, global.target_y);
space_bar = keyboard_check_pressed(vk_space);
mouse_press = mouse_check_button_pressed(mb_left);
wall_collision_right = place_meeting(x + player_speed, y, wall_obj);
wall_collision_left = place_meeting(x - player_speed, y, wall_obj);
wall_collision_up = place_meeting(x, y - player_speed, wall_obj);
wall_collision_down = place_meeting(x, y + player_speed, wall_obj);

// variables for mouse input and position change when mouse clicked
if (mouse_press or space_bar) {
    if (global.allow_dash and !global.dash_press) {
        global.dash_press = true;
        global.allow_dash = false;
        // global.target_x = mouse_obj.x;
        // global.target_y = mouse_obj.y;
        // position_obj.x = global.target_x;
        // position_obj.y = global.target_y;
        // position_obj.visible = true;
        // direction = point_direction(x, y, global.target_x, global.target_y);
        speed = 15;
		alarm[1] = room_speed / 4;
        // distance = clamp(distance, 15, 700);
    }
}

/*
// move player position if mouse has been pressed
if (global.dash_press and speed > 1) {
    // check for collision with wall, change speed if collision happens
	if (collision_line(xprevious, yprevious, x, y, wall_obj, false, true)) {
		speed = 1;
		x = xprevious;
		y = yprevious;
	}
	// code to implement gradual stop
    speed = round(speed * 0.7);
    // distance = round(distance * 0.2) + 1;
    // move_towards_point(global.target_x, global.target_y, distance);
} else if (global.dash_press) {
    speed = 0;
    global.dash_press = false;
    alarm[0] = room_speed;
    mouse_obj.image_angle += room_speed + 15;
    // position_obj.visible = false;
}
*/

// move in direction depending on input
if (not global.dash_press) {
    if (right_key and !wall_collision_right) {
        x += player_speed;
        direction = 0;
    }
    if (left_key and !wall_collision_left) {
        x -= player_speed;
        direction = 180;
    }
    if (up_key and !wall_collision_up) {
        y -= player_speed;
        direction = 90;
    }
    if (down_key and !wall_collision_down) {
        y += player_speed;
        direction = 270;
    }
    if (up_key and right_key and !(wall_collision_up or wall_collision_right)) {
        direction = 45;
    }
    if (up_key and left_key and !(wall_collision_up or wall_collision_left)) {
        direction = 135;
    }
    if (down_key and left_key and !(wall_collision_down or wall_collision_left)) {
        direction = 225;
    }
    if (down_key and right_key and !(wall_collision_down or wall_collision_right)) {
        direction = 315;
    }
}

// keep player within room boundaries
x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);

// player feedback on when they can dash, rotating mouse object
with (mouse_obj) {
	if (!global.allow_dash) {
	    image_angle -= 1;
	} else {
	    image_angle = 0;
	}

	}
	
// move to next room if colliding with stairs
if (place_meeting(x, y, stairs_obj) and !move_room) {
	// currently, move to next room in list - will implement proper system later (including fade out)
	instance_create_depth(0, 0, -10, fade_obj);
	// global.move_room = true;
	move_room = true;
	// room_goto_next();
}