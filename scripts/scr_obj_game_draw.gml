draw_sprite(sprite_index, image_index, scrollx - sprite_width, y);
draw_sprite(sprite_index, image_index, scrollx               , y);
draw_sprite(sprite_index, image_index, scrollx + sprite_width, y);

if (scrollx >= sprite_width) scrollx -= sprite_width;

scrollx += 2
dy -= 0.5;
if (dy == ceil(dy)) y = dy // I only increase y if the increased y will be int type

view_yview[0] = y-(room_height/1.2);
