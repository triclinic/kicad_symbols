
module squaredPinSimple(width, depth, length){
    translate([0, 0, -length/2])
        cube([width, depth, length], center = true);
}

module squaredPinDKnee(width, depth, length1, angle1, length2, angle2, length3){
    module jointedLeg(width, depth, length){
        union(){
            translate([0, 0, -length/2])
                cube([width, depth, length], center = true);
            translate([0, 0, -length])
                rotate([0, 90, 0])
                    cylinder(width, depth/2, depth/2, center = true);
        }
    }
    union(){
        jointedLeg(width, depth, length1);
        translate([0, 0, -length1])
            rotate([angle1, 0, 0])
                union(){
                    jointedLeg(width, depth, length2);
                    translate([0, 0, -length2])
                        rotate([angle2, 0, 0,])
                            squaredPinSimple(width, depth, length3);
                }
    }
}

module squaredPinFormed(width, depth, length, deltaR, , upr = 1/3, lowr = 2/7){
    len1 = length * upr;
    len2 = length * lowr;
    h = length - len1 - len2;
    askewedLen = sqrt(h*h + deltaR*deltaR);
    ang = atan(deltaR / h);
    squaredPinDKnee(width, depth, len1, ang, askewedLen, -ang, len2);
}

///////////////////////////////////////////////////////////////////////////////
    
module circledPinSimple(diameter, length){
    translate([0, 0, -length/2])
        cylinder(h = length, d = diameter, center = true);
}

module circledPinDKnee(diameter, length1, angle1, length2, angle2, length3){
    module jointedLeg(diameter, length){
        union(){
            translate([0, 0, -length/2])
                cylinder(h = length, d = diameter, center = true);
            translate([0, 0, -length])
                    sphere(d = diameter);
        }
    }
    union(){
        jointedLeg(diameter, length1);
        translate([0, 0, -length1])
            rotate([angle1, 0, 0])
                union(){
                    jointedLeg(diameter, length2);
                    translate([0, 0, -length2])
                        rotate([angle2, 0, 0,])
                            circledPinSimple(diameter, length3);
                }
    }
}

module circledPinFormed(diameter, length, deltaR, upr = 1/3, lowr = 2/7){
    len1 = length * upr;
    len2 = length * lowr;
    h = length - len1 - len2;
    askewedLen = sqrt(h*h + deltaR*deltaR);
    ang = atan(deltaR / h);
    circledPinDKnee(diameter, len1, ang, askewedLen, -ang, len2);
}



module rotaryPinCluster(radius=4,number=8){
    for (azimuth =[0:360/number:359])
      rotate([0,0,azimuth])    
        translate([radius,0,0])rotate([0,0,-90]) { children(); }
}
