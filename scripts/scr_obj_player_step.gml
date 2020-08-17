////////////////////////////////////////////////////////////////
// Initialization of some variables
mouse_button_pressed  = mouse_check_button_pressed(mb_any);
mouse_button_held_down = mouse_check_button(mb_any);
mouse_button_released = mouse_check_button_released(mb_any);

////////////////////////////////////////////////////////////////
// Movement and Controls

if (mouse_button_held_down) {

    if !(instance_exists(obj_aim_arrow)) instance_create(x, y, obj_aim_arrow);
    obj_aim_arrow.image_angle = point_direction(mouse_x, mouse_y, self.x, self.y);

} else if (mouse_button_released) {

    speed = 3;
    gravity = 0.05;
    direction = obj_aim_arrow.image_angle;

    with (obj_aim_arrow) { instance_destroy(); }

}

////////////////////////////////////////////////////////////////
// Collision

if place_meeting_any (x+hspeed, y, platforms) {

    while not place_meeting_any (x+hspeed, y, platforms) {

        x += sign(hspeed);

    }

    speed = 0;

}

if place_meeting_any (x, y+vspeed, platforms) {

    while not place_meeting_any (x, y+vspeed, platforms) {

        y += sign(vspeed);

    }

    speed = 0;

}

////////////////////////////////////////////////////////////////
// Game Over
if place_meeting (x, y, obj_lava) {

    image_alpha = 0;

    if not instance_exists (obj_end_transitioner) instance_create(0, 0, obj_end_transitioner);

}

////////////////////////////////////////////////////////////////
// Animation
if (speed == 0) {
    sprite_index = spr_fire;
} else {
    sprite_index = spr_launch;
}
image_speed = 0.1;