//This is rigid body contains coordinates [-47.253  0.000], [10.344 61.829], [45.247  0.000], [-6.106 -36.495]

//body of DRF parameters
dx = 92.5; //total cross length
dx1 = 45.2473; // +x direction (in blue)
dx2 = 47.2527; //-x direction (in green)
dy = 99.69; //total cross length
dy1 = 62.6882; // +y direction (in red)
dy2 = 37.0018; //-y direction (in purple)
axy = 80.5018; //angle between cross lengths

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
dx1_points =[[(dx1+5),5],[(dx1+5),-5],[0,-5],[0,5], [(dx1-5),2],[(dx1-5),-2], [(5),-2], [(5), 2]];
dx2_points =[[-(dx2+5),5],[-(dx2+5),-5],[0,-5],[0,5], [-(dx2-5),2],[-(dx2-5),-2], [-(5),-2], [-(5), 2]];
dy1_points =[[(dy1+5),5],[(dy1+5), -5],[0,-5],[0,5], [(dy1-5),2], [(dy1-5),-2], [5,-2], [5,2]];
dy2_points =[[(dy2+5),5],[(dy2+5), -5],[0,-5],[0,5], [(dy2-5),2], [(dy2-5),-2], [5,-2], [5,2]];
paths =[[0,1,2,3],[4,5,6,7]];

difference(){
    //DRF without clearance holes
    union(){
        color("blue")
        linear_extrude (10)
        polygon(dx1_points, paths);

        color("green")
        linear_extrude (10)
        polygon(dx2_points, paths);

        color ("red")
        rotate ([0,0,axy])
        linear_extrude (10)
        polygon(dy1_points, paths);

        color ("purple")
        rotate ([0,0,-(180-axy)])
        linear_extrude (10)
        polygon(dy2_points, paths);
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

translate([4,10, 8])
rotate([0,0,axy])
linear_extrude(2)
{text("APPLE 10",5, font = "Liberation Sans:style=Bold");}

