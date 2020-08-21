draw_sprite_ext (sprite_index, image_index, x, y, img_xscale, img_yscale, img_angle, c_white, image_alpha);

/////////////////////////////////////////////////////////////////////
// Debug

draw_arrow(x, y, x+hsp*15, y, 3);
draw_arrow(x, y, x, y+vsp*15, 3);
draw_circle (x, y, 50, true);
draw_line_width_color (x, y, x+hsp*15, y+vsp*15, 2, c_green, c_blue);
draw_arrow (x, y, x+hsp*16, y+vsp*16, 8);

/////////////////////////////////////////////////////////////////////
