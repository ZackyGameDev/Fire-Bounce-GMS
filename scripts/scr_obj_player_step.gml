////////////////////////////////////////////////////////////////
// Initialization of some variables
mouse_button_pressed  = mouse_check_button_pressed (mb_any);
mouse_button_held_down = mouse_check_button (mb_any);
mouse_button_released = mouse_check_button_released (mb_any);

////////////////////////////////////////////////////////////////
// Movement and Controls

if (mouse_button_pressed and position_meeting (mouse_x, mouse_y, self)) {

    instance_create (x, y, obj_aim_arrow);

} 

if instance_exists (obj_aim_arrow) {

    if (mouse_button_held_down) {
        
        obj_aim_arrow.x = x;
        obj_aim_arrow.y = y;
        obj_aim_arrow.image_angle = point_direction (mouse_x, mouse_y, self.x, self.y);
    
    } else if (mouse_button_released) {
    
        dir = obj_aim_arrow.image_angle;
        sp = 3;
        hsp = cos(degtorad(dir)) * sp;
        vsp = -(sin(degtorad(dir)) * sp);
        grv = 0.05;
    
        with (obj_aim_arrow) { instance_destroy(); }
    
    }
    
}

////////////////////////////////////////////////////////////////
// Collision and movement

dir = point_direction (x, y, x+hsp, y+vsp);
vsp += grv;

if place_meeting(x+hsp, y, obj_platform1) || place_meeting(x+hsp, y, obj_platform2) || place_meeting(x+hsp, y, obj_platform3) {

    while !place_meeting(x+sign(hsp), y, obj_platform1) && !place_meeting(x+sign(hsp), y, obj_platform2) && !place_meeting(x+sign(hsp), y, obj_platform3){
          
          x += sign(hsp);
    
    }
    
    hsp = 0;
    vsp = 0;
    grv = 0;
    dir = 0;

}

x += hsp;

if place_meeting(x, y+vsp, obj_platform1) || place_meeting(x, y+vsp, obj_platform2) || place_meeting(x, y+vsp, obj_platform3) {

    while !place_meeting(x, y+sign(vsp), obj_platform1) && !place_meeting(x, y+sign(vsp), obj_platform2) && !place_meeting(x, y+sign(vsp), obj_platform3){
    
          y += sign(vsp);
          
    }
    
    hsp = 0;
    vsp = 0;
    grv = 0;
    dir = 0;

}

y += vsp;

////////////////////////////////////////////////////////////////
// Game Over
if place_meeting (x, y, obj_lava) {

    image_alpha = 0;

    if not instance_exists (obj_end_transitioner) instance_create (x, y, obj_end_transitioner);

}

////////////////////////////////////////////////////////////////
// Animation
if (hsp == 0 and vsp == 0) {
    sprite_index = spr_fire;
} else {
    sprite_index = spr_launch;
}
img_angle = dir;
image_speed = 0.1;
