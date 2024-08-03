use <..\misc\pins.scad>

pinHeight = 4;
placementOffset = 2;

formedPinsOffset = 1.2;
showCan = true;
showPins = true;

pinWidth = 0.7;
pinDepth = 0.2;
pinStep = 2.425;

packWidth = 6.9;
packDepth = 2.5;
packHeight = 4.8;
cutHeight = 4.8-3.6;
cutDepth = 1;

rounding = 0.2;

module pins(){
    squaredPinFormed(pinWidth, pinDepth, pinHeight, -formedPinsOffset, 1/8, placementOffset/pinHeight);
    translate([pinStep,0,0])
        squaredPinFormed(pinWidth, pinDepth, pinHeight, formedPinsOffset, 1/8, placementOffset/pinHeight);
    translate([pinStep * 2,0,0])
        squaredPinFormed(pinWidth, pinDepth, pinHeight, -formedPinsOffset, 1/8, placementOffset/pinHeight);
}

base = [[rounding,rounding], 
        [packWidth - rounding,rounding], 
        [rounding,packDepth - rounding], 
        [packWidth - rounding,packDepth - rounding]];

hat = [[rounding,rounding,packHeight-rounding], 
        [packWidth - rounding,rounding,packHeight-rounding], 
        [rounding,packDepth - rounding,packHeight-cutHeight-rounding], 
        [packWidth - rounding,packDepth - rounding,packHeight-cutHeight-rounding],
        [rounding,packDepth - cutDepth - rounding,packHeight-rounding], 
        [packWidth - rounding,packDepth - cutDepth - rounding,packHeight-rounding]];

module can()  {
    translate([pinStep-packWidth/2,-packDepth/2,0]){
        hull(){
            for( i = base ){
                translate(i)
                    cylinder(rounding,rounding,rounding);
            }
            for( i = hat ){
                translate(i)
                    sphere(rounding);
            }
        }
    }
}

module all(){
    translate([0,formedPinsOffset, pinHeight-placementOffset]){
        if(showCan) can();
        if(showPins) pins();
    }
}

$fn = 100;
all();