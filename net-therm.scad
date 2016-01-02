$fn = 10;

//Dimensions
materialThickness = .14;

//Inside Box Dimensions
spaceBetweenParts = .1;
padding = .02;
width = 3.5;
height = 2.7;
tall= 1.7;


//Overhang
overhang=.12;

insideBottomHoles = [
    //Arduino Holes
    [.125/2, 1.34 + .1 + .1, .6],
    [.125/2, 1.34 + .1 + 1.995, .54],
    [.125/2, 1.34 + .1 + .7, 2.6],
    [.125/2, 1.34 + .1 + 1.795, 2.6],
    
    //Ethernet Adapter Holes
    [.125/2, 0 + .123, .16],
    [.125/2, 0 + 1.2, .16],
    [.125/2, 0 + .123, 2.06],
    [.125/2, 0 + 1.2, 2.06]
    
];

insideTopHoles = [

];

panelCutouts = [
    //Power
    [1.34 + .1 + 1.63, .12,.356,.433],
    
    //USB
    [1.34 + .1 + .4,.12,.45,.31]    
];

panelHoles = [    
];

projection(cut=true){
    //bottom
    difference(){
            group(){
                //Make Bottom
                translate(
                    [
                        (width+(materialThickness+overhang+padding)*2)/2,
                        (height+(materialThickness+overhang+padding)*2)/2,
                         0
                    ]){
                    roundedRect(
                        [
                            width + (materialThickness+overhang+padding)*2,
                            height + (materialThickness+overhang+padding)*2,
                            materialThickness
                        ], overhang /2);                        
                }
                
                //Make Top
                translate(
                    [
                        (width + (materialThickness + overhang + padding) * 2 + spaceBetweenParts) + (width+(materialThickness+overhang+padding)*2)/2,
                        (height+(materialThickness+overhang+padding)*2)/2,
                         0
                    ]){
                    roundedRect(
                        [
                            width + (materialThickness+overhang+padding)*2,
                            height + (materialThickness+overhang+padding)*2,
                            materialThickness
                        ], overhang /2);                        
                }
                
            }

            group(){
                //Cut Homes In Top
                translate(
                    [
                        (width + (materialThickness + overhang + padding) * 2 + spaceBetweenParts) +
                        overhang+materialThickness+padding, 
                        overhang+materialThickness+padding
                    ]
                ) {
                    for(hole = insideTopHoles){
                        translate([hole[1], hole[2]]) cylinder(h=materialThickness, r1=hole[0], r2=hole[0]);
                    }
                    
                    translate([width/4, -padding -materialThickness]) 
                        cube([width/2, materialThickness, materialThickness]);
                    translate([width/4, +padding + height])
                        cube([width/2, materialThickness, materialThickness]);                    
                    
                    translate([-padding -materialThickness, height/4]) 
                        cube([materialThickness, height/2, materialThickness]);
                    translate([padding + width, height/4]) 
                        cube([materialThickness, height/2, materialThickness]);                    
                }
                
                //Cut Holes In Bottom
                translate(
                    [
                        overhang+materialThickness+padding, 
                        overhang+materialThickness+padding
                    ]
                ){
                    for(hole = insideBottomHoles){
                        translate([hole[1], hole[2]]) cylinder(h=materialThickness, r1=hole[0], r2=hole[0]);
                    }
                    translate([width/4, -padding -materialThickness]) 
                        cube([width/2, materialThickness, materialThickness]);
                    translate([width/4, +padding +height])
                        cube([width/2, materialThickness, materialThickness]);                    
                    
                    translate([-padding -materialThickness, height/4]) 
                        cube([materialThickness, height/2, materialThickness]);
                    translate([padding + width, height/4]) 
                        cube([materialThickness, height/2, materialThickness]);                 
                }
            }
        }
}

//Make Short Case Sides
     
    projection() translate([0, (height+(materialThickness+overhang+padding)*2) + spaceBetweenParts]){
        difference(){
            cube([width + (padding + materialThickness) * 2, tall + materialThickness*2, materialThickness]);
            group(){
                cube([padding+materialThickness+width/4, materialThickness,materialThickness]);
                translate([padding+materialThickness+(width/4)*3, 0]) cube([padding+materialThickness+width/4, materialThickness,materialThickness]);
                translate([0, materialThickness + tall]){
                    cube([padding+materialThickness+width/4, materialThickness,materialThickness]);
                    translate([padding+materialThickness+(width/4)*3, 0]) cube([padding+materialThickness+width/4, materialThickness,materialThickness]);
                }
                
                translate([0,materialThickness]){
                    cube([materialThickness, tall/4, materialThickness]);
                    translate([0,tall/4*3]) cube([materialThickness, tall/4, materialThickness]);
                }
                
                translate([padding*2+materialThickness+width,materialThickness+tall/4]){
                    
                    cube([materialThickness, tall/2, materialThickness]);
                }
                
                //Put cutouts and holes in panel...
                translate(
                        [
                            materialThickness + padding, 
                            materialThickness
                        ]
                    ){
                    for(cutout = panelCutouts){                        
                        translate([cutout[0], cutout[1]])
                            cube(
                                [
                                    cutout[2],
                                    cutout[3],
                                    materialThickness
                                ]
                            );
                    }
                    
                    
                    for(hole = panelHoles){
                        translate([hole[0], hole[1]])
                            cylinder(h=materialThickness, r1=hole[2], r2=hole[2]);                        
                    }
                }
            }
        }
    }
    
    
    projection() translate([spaceBetweenParts + padding*2 + materialThickness*2 + width, (height+(materialThickness+overhang+padding)*2) + spaceBetweenParts]){
        difference(){
            cube([width + (padding + materialThickness) * 2, tall + materialThickness*2, materialThickness]);
            group(){
                cube([padding+materialThickness+width/4, materialThickness,materialThickness]);
                translate([padding+materialThickness+(width/4)*3, 0]) cube([padding+materialThickness+width/4, materialThickness,materialThickness]);
                translate([0, materialThickness + tall]){
                    cube([padding+materialThickness+width/4, materialThickness,materialThickness]);
                    translate([padding+materialThickness+(width/4)*3, 0]) cube([padding+materialThickness+width/4, materialThickness,materialThickness]);
                }
                
                translate([0,materialThickness]){
                    cube([materialThickness, tall/4, materialThickness]);
                    translate([0,tall/4*3]) cube([materialThickness, tall/4, materialThickness]);
                }
                
                translate([padding*2+materialThickness+width,materialThickness+tall/4]){
                    
                    cube([materialThickness, tall/2, materialThickness]);
                }
            }
        }
    }
    
    //Make Long Sides
        projection() translate([(width+(materialThickness+overhang+padding)*2 + spaceBetweenParts)*2, 0]){
        difference(){
            cube([tall + materialThickness*2, height + (padding + materialThickness) * 2, , materialThickness]);
            group(){
                cube([materialThickness, padding+materialThickness+height/4, materialThickness]);
                translate([0, padding+materialThickness+(height/4)*3])
                    cube(
                        [
                            materialThickness,
                            padding+materialThickness+height/4, 
                            materialThickness
                        ]
                    );
                translate([materialThickness + tall, 0]){
                    cube(
                        [                            
                            materialThickness,
                            padding+materialThickness+height/4, 
                            materialThickness
                        ]
                    );
                    translate([0, padding+materialThickness+(height/4)*3]) 
                        cube(
                            [
                                materialThickness,
                                padding+materialThickness+height/4, 
                                materialThickness
                            ]
                        );
                }
                
                translate([materialThickness, 0]){
                    cube(
                        [
                            tall/4, 
                            materialThickness, 
                            materialThickness
                        ]
                    );
                    
                    translate([tall/4*3, 0]) 
                        cube([tall/4, materialThickness, materialThickness]);
                }
                
                translate([materialThickness+tall/4, padding*2+materialThickness+height]){
                    
                    cube([tall/2, materialThickness, materialThickness]);
                }
            }
        }
    }
    
    
    projection() translate([(width+(materialThickness+overhang+padding)*2 + spaceBetweenParts)*2 + spaceBetweenParts + tall + materialThickness*2, 0]){
        difference(){
            cube([tall + materialThickness*2, height + (padding + materialThickness) * 2, , materialThickness]);
            group(){
                cube([materialThickness, padding+materialThickness+height/4, materialThickness]);
                translate([0, padding+materialThickness+(height/4)*3])
                    cube(
                        [
                            materialThickness,
                            padding+materialThickness+height/4, 
                            materialThickness
                        ]
                    );
                translate([materialThickness + tall, 0]){
                    cube(
                        [                            
                            materialThickness,
                            padding+materialThickness+height/4, 
                            materialThickness
                        ]
                    );
                    translate([0, padding+materialThickness+(height/4)*3]) 
                        cube(
                            [
                                materialThickness,
                                padding+materialThickness+height/4, 
                                materialThickness
                            ]
                        );
                }
                
                translate([materialThickness, 0]){
                    cube(
                        [
                            tall/4, 
                            materialThickness, 
                            materialThickness
                        ]
                    );
                    
                    translate([tall/4*3, 0]) 
                        cube([tall/4, materialThickness, materialThickness]);
                }
                
                translate([materialThickness+tall/4, padding*2+materialThickness+height]){
                    
                    cube([tall/2, materialThickness, materialThickness]);
                }
            }
        }
    }
    

// radius - radius of corners
module roundedRect(size, radius)
{
	x = size[0];
	y = size[1];
	z = size[2];

	linear_extrude(height=z)
	hull()
	{
		// place 4 circles in the corners, with the given radius
		translate([(-x/2)+(radius/2), (-y/2)+(radius/2), 0])
		circle(r=radius);
	
		translate([(x/2)-(radius/2), (-y/2)+(radius/2), 0])
		circle(r=radius);
	
		translate([(-x/2)+(radius/2), (y/2)-(radius/2), 0])
		circle(r=radius);
	
		translate([(x/2)-(radius/2), (y/2)-(radius/2), 0])
		circle(r=radius);
	}
}