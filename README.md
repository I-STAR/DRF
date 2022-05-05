# Open Source Library of Dynamic Reference Frames


It can be difficult to find commercially available dynamic reference frames (DRFs) for surgical tracking/navigation with a large diversity of designs permitting simultaneous tracking. As a result, many researchers resort to building their own custom-built tools. The purpose of this open-source library is to provide a variety of sets of mutually-compatible DRFs ready for 3D printing and freely available to the research community.

Please enjoy the fruits of our labor with this library of 10 sets:

- APPLE
- BANANA
- CHERRY
- DATE
- EGGFRUIT
- FIG
- GUAVA
- HONEYDEW
- JUJUBE
- KIWI

of mutually compatible dynamic reference frames (DRFs) with passive, retro-reflective markers. The APPLE set contains 10 tools, while the others contain 6. The first tool in each of the sets is the same, similar to NDI reference tool (#8700339).


The library was designed and validated at I-STAR Lab at Johns Hopkins University. All DRFs were constructed and validated using Northern Digital Inc. (NDI) geometry specifications.




# Usage Instructions

Below is a step-by-step guide to tracking DRFs with any NDI tracking system (such as Polaris Vicra or Spectra).

**STEP 1**: Download a DRF set(s) of your choosing along with the mounting post.

**STEP 2**: If you wish to modify the DRF in any way (e.g., change name, add/remove a clearance hole), use the [OpenSCAD][scad] program to open and edit the .scad file. Save by clicking “render” and then “export as STL.”

**STEP 3**: Once you have the STLs of all your desired DRFs, import them into a 3D slicing application like [Cura][cura] and print them on a 3D printer. 

**STEP 4**:  Once all the tools have been printed, attach them to the instruments you want to track using the clearance holes. Attach reflective spheres (available for purchase from NDI – and potentially other commercial sources). You can use the mounting posts as intrinsic to the CAD files, or you can order your own (metal) mounting posts from a manufacturer and attach them to the DRF. The mounting posts intrinsic to the CAD files are modeled after the NDI mounting posts (#XXX). See below for further details using built-in or separate mounting posts.

**STEP 5**: In order for the tracking system to recognize the DRF, import the tool definition file (.rom) into the tracking software. If the tracking system does not use .rom, manually create a tool definition file using the tracking system’s user guide. Manually inputting the DRF coordinates (in Coordinates section) into the tool definition file generator (e. g., 6DArchitect by NDI) will assure full compatibility of a set of DRFs.


### File Types

**STL**: This CAD file can be readily imported into any 3D printing slicing application (Cura, MakerBot Print, Slic3r, etc) and 3D printed. An .stl file can also be imported into most if not all 3D rendering software (SolidWorks, OpenSCAD, Sketchup, etc) where the DRF can be edited as well.

**SCAD**: This is an OpenSCAD file. OpenSCAD is a free software application for generating 3D computer-aided design (CAD) files. All of the available DRFs were generated using OpenSCAD. Any DRF can be modified using this program (e. g., change the DRF name, the location and sizes of the clearance holes). The posts were generated in SolidWorks and imported into OpenSCAD. For proper import, update the file location of the posts in the .scad file. 

**ROM**: This is the [tool definition file][rom] which allows any NDI tracking systems to recognize the DRF. The coordinates of the DRF is inputted manually (engineering data) in order to ensure tool compatibility. The tool definition file also specifies the origin of the tool to be at the center clearance hole. If any users require a different file type for their tool definition file or wish to specify a different origin, the coordinates for every tool are specified below under “Coordinates.”


### Modifications

If you are using a tracking system and wish to check if geometric tool specifications and compatibility are the same, please refer to the "Definitions and Tool Specifications" section.

**MOUNTING POSTS**: Currently, the DRFs are available with and without posts. The mounting posts were generated in [SolidWorks][sw] based on NDI spherical mounting posts (#XXX). The screw insertion holes for the unmounted option is non-threaded and 2 mm in diameter for NDI spherical mounting posts. The advantage of using your own mounting posts (ordered from the manufacturer) is that metal mounting posts tend to be significantly more durable than the 3D printed posts. Although not currently available, the DRF configurations are also suitable for active DRFs as well. 

**CLEARANCE HOLES**: There are three clearance holes in each DRF design. Two run through the cross body of the DRF and are 4 mm in diameter while the center clearance hole is 5 mm in diameter. The diameter can be modified in either OpenSCAD as a .scad file or in any other 3D rendering software using the .stl file. 

**ATTACHMENTS**: Custom attachments could also be added to the DRF either in 3D rendering software or physically after 3D printing using any of the available clearance holes. For the validation experiments reported in the [journal paper][manu], the tools were attached to a 3 mm diameter and 60 mm length carbon fiber rod by inserting the rod through one of the clearance holes on the cross body and securing the DRF by inserting a 10/24 set screw through the center which pushed against the rod until the attachment was stable. 


## Printing
**PRINTER**: All the validated DRFs were printed using a Lulzbot TAZ 6 but other 3D printers are also acceptable. Some families (APPLE, CHERRY, DATE, EGGFRUIT, JUJUBE) can even be printed on the Makerbot Mini which has a build plate of 100x100 mm.

**ORIENTATION**: The recommended printing orientation is flat such that the DRF has the most contact with the printer bed. The advantage of this orientation is a shorter print time with no overhang, and best quality print overall. A disadvantage is that the mounting posts are more susceptible to breaking off, but as long as the DRFs are well cared for and excessive force is not applied to the posts, they should stay intact.  

**PRINTER MATERIAL**: The two most common 3D printer filaments are ABS and PLA. [ABS has high strength and flexibility, is scratch and heat resistant, non-hygroscopic, and can be polished with acetone. Disadvantages of ABS include strong fumes during production and temperature-dependent shrinkage. ABS+ shares the same qualities as ABS but is better suited for printing large objects due to improved thermal stability. The DRFs used in this work were printed using PLA, which prints at a lower temperature and thereby minimizes shrinkage and warping. PLA+ has the qualities of PLA but is stronger, smoother, and crack resistant. Possible disadvantages of PLA are that it can become brittle when exposed to sunlight / ultraviolet light and is more reactive with water than ABS. Such effects should be negligible, if the tools are kept in a dry environment and not exposed to extended periods of direct sunlight. Overall PLA or PLA+ is recommended in order to create DRF with a minimal tracking error due to printer error.][manu]


## Definitions and Tool Specifications:

A tool length is the length between the centers of any two spheres on a DRF. Each DRF is valid in that the minimum tool length is greater than or equal to 52 mm and the differences between all tool lengths in a single DRF are larger than 5 mm. The largest tool length on any given DRF is at most 100 mm.
A tool angle is the angle between any two tool lengths on a single DRF. Similar tool lengths are two tools lengths on different DRFs which have a difference of less than 5 mm. The sets/groups available are compatible because for any pair of similar tool lengths, their angle difference is larger than 2°. 





# References
[scad] openscad.org

[cura] https://www.lulzbot.com/cura

[sw] solidworks.com

[rom] NDI 6D Architect User Guide, Northern Digital Inc. (2004).

[manu] A. Brown, A. Uneri, T. De Silva, A. Manbachi, J. H. Siewerdsen, "Design and validation of an open-source library of dynamic reference frames for research and education in optical tracking," J. Med. Imag., Special Issue on Image-Guided Procedures, Robotic Interventions, and Modeling (accepted, Sept. 2017).

## Coordinates

APPLE 01 		[-47.206 0.000], [0.345 44.316], [40.794 0.000], [-0.223 -28.594]
APPLE 02		[-56.210 0.000], [8.711 53.305], [42.291 0.000], [-3.902 -23.879]
APPLE 03		[-40.183 0.000], [4.781 51.676], [40.817 0.000], [-3.4010 -36.757]
APPLE 04		[-48.843 0.000], [1.866 50.407], [39.657 0.000], [-1.191 -32.179]
APPLE 05		[-47.289  0.000], [9.320 43.680], [46.711  0.000], [-7.017 -32.897]
APPLE 06		[-48.565  0.000], [17.490 60.390], [35.435  0.000], [-10.150 -35.047]
APPLE 07		[-46.685 0.000], [6.482 58.432], [46.815  0.000], [-3.156 -28.446]
APPLE 08		[-45.583  0.000], [19.141 50.346], [46.9171  0.000], [-16.350 -43.005]
APPLE 09		[-55.142  0.000], [-1.280 55.026], [28.358  0.000], [1.029 -44.239]
APPLE 10		[-47.253  0.000], [10.344 61.829], [45.247  0.000], [-6.106 -36.495]

BANANA 01		[-47.206 0.000], [0.345 44.316], [40.794 0.000], [-0.223 -28.594]
BANANA 02		[-47.364 0.000], [5.849 59.891], [44.636 0.000], [-5.891 -37.630]
BANANA 03		[-49.161 0.000], [5.849 66.754], [50.839 0.000], [-2.255 -25.730]
BANANA 04		[-49.267 0.000], [11.533 44.762], [50.733 0.000], [-9.107 -35.347]
BANANA 05		[-41.148 0.000], [7.134 56.736], [38.852 0.000], [-5.050 -40.161]
BANANA 06		[-53.637 0.000], [16.569 55.510], [46.363 0.000], [-6.648 -22.272]

CHERRY 01		[-47.206 0.000], [0.345 44.316], [40.794 0.000], [-0.223 -28.594]
CHERRY 02		[-48.299 0.000], [8.177 64.193], [50.700 0.000], [-3.325 -26.101]
CHERRY 03		[-45.932 0.000], [4.892 51.000], [47.568 0.000], [-3.162 -32.965]
CHERRY 04		[-54.204 0.000], [1.046 55.765], [45.796 0.000], [-0.725 -38.678]
CHERRY 05		[-48.726 0.000], [-1.422 60.756], [36.274 0.000], [0.908 -38.801]
CHERRY 06		[-52.230 0.000], [12.991 53.726], [47.770 0.000], [-5.530 -22.872]

DATE 01		[-47.206 0.000], [0.345 44.316], [40.794 0.000], [-0.223 -28.594]
DATE 02		[-42.219 0.000], [7.314 58.298], [43.281 0.000], [-4.896 -39.025]
DATE 03		[-62.726 0.000], [1.499 55.679], [28.773 0.000], [-1.177 -43.726]
DATE 04		[-49.429 0.000], [8.629 57.907], [50.571 0.000], [-5.248 -35.217]
DATE 05		[-49.935 0.000], [15.685 49.173], [50.065 0.000], [-11.359 -35.611]
DATE 06		[-53.065 0.000], [1.807 56.833], [40.935 0.000], [-0.979 -30.777]

EGGFRUIT 01	[-47.206 0.000], [0.345 44.316], [40.794 0.000], [-0.223 -28.594]
EGGFRUIT 02	[-47.287 0.000], [7.238 52.222], [49.213 0.000], [-3.992 -28.801]
EGGFRUIT 03	[-44.685 0.000], [7.858 62.954], [44.815 0.000], [-4.393 -35.197]
EGGFRUIT 04	[-55.203 0.000], [3.550 58.627], [41.797 0.000], [-1.919 -31.700]
EGGFRUIT 05	[-49.611 0.000], [16.949 50.418], [50.389 0.000], [-12.475 -37.110]
EGGFRUIT 06	[-49.340 0.000], [0.776 53.079], [41.660 0.000], [-0.470 -32.156]

FIG 01			[-47.206 0.000], [0.345 44.316], [40.794 0.000], [-0.223 -28.594]
FIG 02			[-49.976 0.000], [8.240 59.859], [50.024 0.000], [-4.036 -29.322]
FIG 03			[-49.135 0.000], [11.081 46.369], [48.365 0.000], [-7.981 -33.397]
FIG 04			[-43.086 0.000], [7.062 55.769], [41.414 0.000], [-4.400 -34.747]
FIG 05			[-59.391 0.000], [10.734 57.996], [26.109 0.000], [-7.365 -39.793]
FIG 06			[-70.717 0.000], [4.222 46.132], [29.283 0.000], [-4.326 -47.270]

GUAVA 01		[-47.206 0.000], [0.345 44.316], [40.794 0.000], [-0.223 -28.594]
GUAVA 02		[-48.219 0.000], [10.894 61.079], [51.781 0.000], [-5.626 -31.540]
GUAVA 03		[-51.467 0.000], [1.118 58.284], [42.533 0.000], [-0.796 -41.505]
GUAVA 04		[-57.834 0.000], [11.006 58.748], [42.166 0.000], [-4.504 -24.045]
GUAVA 05		[-39.422 0.000], [7.529 56.550], [39.578 0.000], [-5.214 -39.165]
GUAVA 06		[-49.745 0.000], [16.174 48.772], [50.255 0.000], [-11.786 -35.541]

HONEYDEW 01	[-47.206 0.000], [0.345 44.316], [40.794 0.000], [-0.223 -28.594]
HONEYDEW 02	[-46.624 0.000], [6.236 58.035], [45.376 0.000], [-4.256 -39.610]
HONEYDEW 03	[-55.806 0.000], [1.894 58.264], [44.194 0.000], [-1.175 -36.134]
HONEYDEW 04	[-40.249 0.000], [4.987 56.656], [40.751 0.000], [-3.738 -42.461]
HONEYDEW 05	[-58.581 0.000], [11.373 58.202], [41.419 0.000], [-4.696 -24.029]
HONEYDEW 06	[-48.507 0.000], [13.733 51.053], [51.493 0.000], [-9.138 -33.972]

JUJUBE 01		[-47.206 0.000], [0.345 44.316], [40.794 0.000], [-0.223 -28.594]
JUJUBE 02		[-49.487 0.000], [6.156 56.078], [50.513 0.000], [-3.274 -29.821]
JUJUBE 03		[-44.643 0.000], [9.278 55.667], [40.857 0.000], [-5.753 -34.519]
JUJUBE 04		[-51.564 0.000], [0.892 67.518], [40.936 0.000], [-0.427 -32.331]
JUJUBE 05		[-50.753 0.000], [-0.213 60.067], [34.747 0.000], [0.138 -38.809]
JUJUBE 06		[-46.589 0.000], [17.508 56.585], [47.411 0.000], [-12.020 -38.846]

KIWI 01		[-47.206 0.000], [0.345 44.316], [40.794 0.000], [-0.223 -28.594]
KIWI 02		[-48.249 0.000], [10.239 60.293], [42.751 0.000], [-6.300 -37.098]
KIWI 03		[-62.232 0.000], [-0.022 54.944], [29.768 0.000], [0.018 -44.466]
KIWI 04		[-48.380 0.000], [5.539 52.849], [49.120 0.000], [-3.613 -34.470]
KIWI 05		[-44.942 0.000], [0.420 59.097], [35.058 0.000], [-0.290 -40.823]
KIWI 06		[-52.797 0.000], [15.028 57.626], [47.203 0.000], [-5.808 -22.272]



