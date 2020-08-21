dy = y;
scrollx = 0;
random_set_seed(current_second+mouse_x+mouse_y);
window_set_cursor(cr_none);
cursor_sprite = spr_cursor;

if os_browser != browser_not_a_browser {

    window_set_size(display_get_width(), display_get_height());

}