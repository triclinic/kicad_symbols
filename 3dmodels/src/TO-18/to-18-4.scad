use <..\misc\pins.scad>

formedPinsRadius = 1.27; //2.07;
pinHeight = 6;
numPins = 2;
placementOffset = 2;

showCan = false;
showPins = true;
showInsol = false;

capHeight = 4.83;
capDiameter = 4.70;
baseDiameter = 5.60;
baseThickness = 0.2;
tabLength = 1;
tabWidth = 1;

rounding = 0.7;
insolDepth = 0.2;

module can() {
    union(){
        hull(){
            translate([0,0,capHeight-rounding])
                rotate_extrude()
                translate([capDiameter/2-rounding,0,0])
                circle(rounding);
            translate([0,0,baseThickness])
                cylinder(rounding, d = capDiameter);
        }
        cylinder(baseThickness, d = baseDiameter);
        rotate([0, 0, 135])
            translate([0, -tabWidth/2, 0])
                cube([baseDiameter/2 + tabLength, tabWidth, baseThickness]);
    }
}

module insolator(){
        cylinder(capHeight-rounding-insolDepth, d = capDiameter - 2*baseThickness);
}

module insolatedCan(){
    translate([0, 0, -insolDepth])
    difference(){
        can();
        cylinder(capHeight-rounding, d = capDiameter - 2*baseThickness);
    }
}

module all(){
    translate([formedPinsRadius, 0, pinHeight - placementOffset]) {
        if(showPins){
            if(numPins <= 3) {
                rotaryPinCluster(1.27, 2) 
                    circledPinFormed(0.45, pinHeight, formedPinsRadius - 1.27, 1/8, placementOffset/pinHeight);
                if(numPins == 3) 
                    translate([0,-1.27,0]) 
                        rotate([0,0,180]) 
                    circledPinFormed(0.45, pinHeight, formedPinsRadius - 1.27, 1/8, placementOffset/pinHeight);
            }
            else{
                rotaryPinCluster(1.27, numPins) 
                    circledPinFormed(0.45, pinHeight, formedPinsRadius - 1.27, 1/8, placementOffset/pinHeight);
            }
        }
        if(showCan) insolatedCan();
        if(showInsol) insolator();
    }
}

$fn = 100;

all();