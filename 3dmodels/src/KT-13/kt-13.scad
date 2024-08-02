module pins() {
    color([0.8,0.8,0.8]) {
        translate([-0.1,-0.35,-4])
            cube([0.2,0.7,4]);
        translate([-0.1,-0.35+2.425,-4])
            cube([0.2,0.7,4]);
        translate([-0.1,-0.35-2.425,-4])
            cube([0.2,0.7,4]);
    }
}

width = 6.9;
depth = 2.5;
depth2 = 1;
height = 4.8;
height2 = 3.6;
r=0.2;

module can()  {
    color([1,0.4,0]) {
        $fn = 100;
        hull(){
        translate([depth/2-r,width/2-r])
            cylinder(r,r,r);
        translate([depth/2-r,-(width/2-r)])
            cylinder(r,r,r);
        translate([-(depth/2-r),width/2-r])
            cylinder(r,r,r);
        translate([-(depth/2-r),-(width/2-r)])
            cylinder(r,r,r);
        
        translate([depth/2-r,width/2-r,height-r])
            sphere(r);
        translate([depth/2-r,-(width/2-r),height-r])
            sphere(r);
        translate([-(depth/2-r),width/2-r,height2-r])
            sphere(r);
        translate([-(depth/2-r),-(width/2-r),height2-r])
            sphere(r);
        
        translate([depth/2-r-depth2,width/2-r,height-r])
            sphere(r);
        translate([depth/2-r-depth2,-(width/2-r),height-r])
            sphere(r);
        }
    }
}

pins();
can();