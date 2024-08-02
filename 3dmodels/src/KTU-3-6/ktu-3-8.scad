d_hat = 8.5;
d_belt = 11.2;
r = 1;
height = 7.4;
belt_h = 2;
d_glass = 1.7;

pin_len = 15;

module pin() {
    $fn=100;
    translate([2.1,0,-pin_len])
    cylinder(pin_len-0.1,0.25,0.25);
    translate([-2.1,0,-pin_len])
    cylinder(pin_len-0.1,0.25,0.25);
    translate([0,2.1,-pin_len])
    cylinder(pin_len,0.25,0.25);
    }

module can() {
    $fn=100;
    color([0.8,0.8,0.8])
    difference(){
    union(){
    hull(){
        translate([0,0,height-r])
        rotate_extrude()
        translate([d_hat/2-r,0,0])
        circle(r);
        cylinder(r/2,d_hat/2,d_hat/2);
    }
    hull(){
        translate([0,0,belt_h])
        rotate_extrude($fn=100)
        translate([d_belt/2-0.3,0,0])
        circle(0.3);
    }
    }
    translate([2.1,0,0])
    cylinder(2,d_glass/2,d_glass/2);
    translate([-2.1,0,0])
    cylinder(2,d_glass/2,d_glass/2);
    }
}

module insol(){
    $fn=100;
    color([0.1,0.1,0.1])
    translate([2.1,0,-0.1])
    cylinder(2.1,d_glass/2,d_glass/2);
    color([0.1,0.1,0.1])
    translate([-2.1,0,-0.1])
    cylinder(2.1,d_glass/2,d_glass/2);
    }

can();
pin();
insol();