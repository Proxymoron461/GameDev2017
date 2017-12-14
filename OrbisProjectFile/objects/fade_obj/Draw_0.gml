/// determine alpha fading in and out
// code to fade in and out with fade object
alpha = clamp(alpha + (fade * 0.05), 0, 1);

if (alpha == 1) {
	room_goto_next();
	fade = -1;
}

if (alpha == 0 && fade == -1) {
	instance_destroy();
	// global.move_room = false;
	with (player_obj) {
		move_room = false;
	}
}

draw_set_color(c_black);
draw_set_alpha(alpha);
draw_rectangle(0, 0, room_width, room_height, 0);
// draw_rectangle(view_xport[0], view_yport[0], view_xport[0] + view_wport[0], view_yport[0] + view_hport[0], 0)
draw_set_alpha(1);