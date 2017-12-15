/// @description move mouse sprite to mouse position
// set mouse_obj position to follow mouse position within room boundaries
x = clamp(mouse_x, 20, room_width - 20);
y = clamp(mouse_y, 20, room_height - 20);