//This is rigid body contains coordinates [-53.065 0.000], [1.807 56.833], [40.935 0.000], [-0.979 -30.777]

//body of DRF parameters
dx = 94; //total cross length
dx1 = 40.9324; // +x direction (in blue)
dx2 = 53.0676; //-x direction (in green)
dy = 87.66; //total cross length
dy1 = 56.862; // +y direction (in red)
dy2 = 30.798; //-y direction (in purple)
axy = 88.1812; //angle between cross lengths

//insert file location of the mounting post
post = "C:/User/Documents/NDI_mounting_post.stl";

//clearance holes parameters
oh = 10; //central clearance hole depth
or = 2.5; //central clearance hole radius
xh = dx+10; //x-body clearance hole 1 depth
xr = 2; //x-body clearance hole 1 radius
yh = dy+10; //x-body clearance hole 2 depth
yr = xr; //x-body clearance hole 2 radius
g = 5; //z-translation of x-body clearance holes

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
        color("blue")
        translate([dx1, 0, 9.9999])
        import(post);

        color("green")
        linear_extrude (10)
        polygon(dx2_points, paths);
        color("green")
        translate([-dx2, 0, 9.9999])
        import(post);

        color ("red")
        rotate ([0,0,axy])
        linear_extrude (10)
        polygon(dy1_points, paths);
        color("red")
        translate ([(cos(axy)*dy1),(sin(axy)*dy1),9.9999])
        import(post);

        color ("purple")
        rotate ([0,0,-(180-axy)])
        linear_extrude (10)
        polygon(dy2_points, paths);
        color("purple")
        translate([-(cos(axy)*dy2),-(sin(axy)*dy2),9.9999])
        import(post);
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
    }
}

translate([2.8,10, 8])
rotate([0,0,axy])
linear_extrude(2)
{text("DATE 6",5, font = "Liberation Sans:style=Bold");}
