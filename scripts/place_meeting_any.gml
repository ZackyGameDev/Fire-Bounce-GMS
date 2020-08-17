mask_x = argument0;
mask_y = argument1;
objects_to_check_for = argument2;

var i;
for (i=0; i<array_length_1d(objects_to_check_for); i++) 
{
    if place_meeting(mask_x, mask_y, objects_to_check_for) return true;
}

return false;