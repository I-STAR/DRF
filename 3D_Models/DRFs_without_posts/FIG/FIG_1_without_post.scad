//This is rigid body contains coordinates [-47.206 0.000], [0.345 44.316], [40.794 0.000], [-0.223 -28.594]

//body of DRF parameters
dx = 88; //total cross length
dx1 = 40.7941; // +x direction (in blue)
dx2 = 47.2059; //-x direction (in green)
dy = 72.912; //total cross length
dy1 = 44.3171; // +y direction (in red)
dy2 = 28.5949; //-y direction (in purple)
axy = 89.5536; //angle between cross lengths

//insert file location of the mounting post

//clearance holes parameters
oh = 10; //central clearance hole depth
or = 2.5; //central clearance hole radius
xh = dx+10; //x-body clearance hole 1 depth
xr = 2; //x-body clearance hole 1 radius
yh = dy+10; //x-body clearance hole 2 depth
yr = xr; //x-body clearance hole 2 radius
g = 2.85; //z-translation of x-body clearance holes

//holes for posts
ph = 5; //post hole depth
pr = 1; //post hole radius

//DRF polygon points
dx1_points_o =[[(dx1+5),5],[(dx1+5),-5],[0,-5],[0,5]];
dx2_points_o =[[-(dx2+5),5],[-(dx2+5),-5],[0,-5],[0,5]];
dy1_points_o =[[(dy1+5),5],[(dy1+5), -5],[0,-5],[0,5]];
dy2_points_o =[[(dy2+5),5],[(dy2+5), -5],[0,-5],[0,5]];
dx1_points_i =[[(dx1-5),2],[(dx1-5),-2], [(5),-2], [(5), 2]];
dx2_points_i =[[-(dx2-5),2],[-(dx2-5),-2], [-(5),-2], [-(5), 2]];
dy1_points_i =[[(dy1-5),2], [(dy1-5),-2], [5,-2], [5,2]];
dy2_points_i =[[(dy2-5),2], [(dy2-5),-2], [5,-2], [5,2]];

difference(){
    //DRF without clearance holes
    union(){
        difference(){
            color("blue")
            linear_extrude (10)
            polygon(dx1_points_o);
            linear_extrude (10)
            polygon(dx1_points_i);
        }

        difference(){
            color("green")
            linear_extrude (10)
            polygon(dx2_points_o);
            linear_extrude (10)
            polygon(dx2_points_i);
        }

        difference(){
            color ("red")
            rotate ([0,0,axy])
            linear_extrude (10)
            polygon(dy1_points_o);
            rotate ([0,0,axy])
            linear_extrude (10)
            polygon(dy1_points_i);
        }

        difference(){
            color ("purple")
            rotate ([0,0,-(180-axy)])
            linear_extrude (10)
            polygon(dy2_points_o);
            rotate ([0,0,-(180-axy)])
            linear_extrude (10)
            polygon(dy2_points_i);
        }
    }

    //clearance holes
    union(){
        //central clearance hole
        cylinder(oh,or,or,$fn=25);
        //x-body clearance hole 1
        rotate([0,-90,0])
        translate([g,0,-(dx1+5)])
        cylinder(xh, xr, xr, $fn=25);
        //x-body clearance hole 2
        rotate([axy,-90,0])
        translate([g,0,-(dy1+5)])
        cylinder(yh, yr, yr, $fn=25);
        //post holes
        translate([dx1, 0, 10-ph])
        cylinder(ph, pr, pr, $fn=25);
        translate([-dx2, 0, 10-ph])
        cylinder(ph, pr, pr, $fn=25);
        translate ([(cos(axy)*dy1),(sin(axy)*dy1), 10-ph])
        cylinder(ph, pr, pr, $fn=25);
        translate([-(cos(axy)*dy2),-(sin(axy)*dy2), 10-ph])
        cylinder(ph, pr, pr, $fn=25);
    }
}

translate([-10,2.3, 8])
rotate([0,0,180])
linear_extrude(2)
{text("FIG 1",5, font = "Liberation Sans:style=Bold");}