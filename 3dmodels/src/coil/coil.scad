width = 7.5;
depth = 7.5;
height = 12.5;
r=0.2;
r2 = 2.5;
pin_len = 3.5;

module pins() {
    $fn=100;
    color([0.8,0.8,0.8]) {
        translate([-2.25,-2.25,-pin_len])
            cylinder(pin_len-0.1,0.25,0.25);
        translate([-2.25,2.25,-pin_len])
            cylinder(pin_len-0.1,0.25,0.25);
        translate([2.25,-2.25,-pin_len])
            cylinder(pin_len-0.1,0.25,0.25);
        translate([2.25,2.25,-pin_len])
            cylinder(pin_len-0.1,0.25,0.25);
        translate([0,2.25,-pin_len])
            cylinder(pin_len-0.1,0.25,0.25);
    }
}

module can() {
    $fn = 100;
    color([0.8,0.8,0.8]) {
      difference(){
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
        translate([-(depth/2-r),width/2-r,height-r])
            sphere(r);
        translate([-(depth/2-r),-(width/2-r),height-r])
            sphere(r);
      }
      translate([0,0,height-4])
            cylinder(5,r2,r2);
  }
    }
}

module ferrite(){
    $fn = 100;
    color([0.4,0.4,0.4]) {
    translate([0,0,height-4]){
				difference(){
					cylinder(3,r2-0.3,r2-0.3);
					rotate([0,0,45])
                    translate([-(r2)/2, -0.25, 3-0.5])
						cube([r2, 0.5, 0.6]);
				}
			}
     }
}

module tube(){
    $fn = 100;
    color([0.1,0.8,0.1]) {
        difference(){
        translate([0,0,height-4])
            cylinder(3.5,r2,r2);
        translate([0,0,height-4])
            cylinder(5,r2-0.3,r2-0.3);
        }
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
pins();
tube();
ferrite();