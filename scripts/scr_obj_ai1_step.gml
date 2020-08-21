if self.y >= view_yview[0] {

    self.x = view_wview[0]/4+view_wview[0]/2;

    self.y -= random_range (view_hview[0]/4, view_hview[0]/3);
    self.x  = random_range (view_wview[0]/2, view_wview[0]/1.25);

    instance_create(x, y, obj_ai1);
    switch ceil(random(3)) {

        case 0: instance_create(x, y, obj_platform1); break;
        case 1: instance_create(x, y, obj_platform1); break;
        case 2: instance_create(x, y, obj_platform2); break;
        case 3: instance_create(x, y, obj_platform3); break;

    }

    instance_destroy();

}
