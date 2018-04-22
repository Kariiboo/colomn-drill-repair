/*
File : safetyCoverSupport.scad

Description:
[EN] Colomn drilling machine safety cover support
[FR] Support de carter pour perceuse à colonne

Author: Nicolas Moteau (nicolas.moteau@orange.fr)
Version: 0.0.4
License: [CC-BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0/)
*/

// Precision
$fn = 120; // 1st print at 120.

// Model parameters (in mm)
innerDiam = 40.5;
outterDiam = 82;

bottomHeight = 2; // hauteur du fond

ringThick = 2.5; // épaisseur des bagues
ringHeight = 11; // hauteur des bagues

clampingOpenningWidth = 3; // largeur de la lumière de serrage
halfOpenningWidth = clampingOpenningWidth / 2;

innerReinforcementWidth = 2; // largeur des renforts interieurs

nutCageHeight = ringHeight - 3;
nutCageDiam = 15;
nutCageAngle = 65.66;
nutCageAngles = [/*-nutCageAngle,*/ nutCageAngle]; // negative is on the right, the only one needed is on the left
delta_angle = 8;
nutCageReinforcementAngles = [/*-(nutCageAngle + delta_angle),*/ nutCageAngle + delta_angle];

// 3D Model definition

/** A cube with rounded edged on X & Y */
module roundedCube(x=10, y=10, z=10, r=1, h=0.1) {
  minkowski() {
    cube([x-r, y-r, z]);
    cylinder(r=r,h=h);
  }
}

module smallTongue(x, y, z) {
  difference() {
    // languette à coins arrondis
    roundedCube(x, y, z, r=1, h=0.1);
    // trous pour les ressorts
    union() {
      translate([1, y-2, -1])
        cylinder(h=z+2, d=2);
      translate([x-2, y-2, -1])
        cylinder(h=z+2, d=2);
    }
  }
}

color("red")
difference() {

  union() {
    // bottom surface
    color("yellow") rotate_extrude()
      translate([innerDiam/2, 0])
        square([(outterDiam - innerDiam)/2, bottomHeight]);
    
    // outter ring
    color("blue") rotate_extrude()
      translate([outterDiam/2 - ringThick, 0])
        square([ringThick, ringHeight]);
    
    // inner ring
    color("blue") rotate_extrude()
      translate([innerDiam/2, 0])
        square([ringThick, ringHeight]);
    
    // small tongue as a cube
    x=42; y=12; z=2;
    color("orange")
    translate([-(x-1)/2, outterDiam/2 - y/2, 0])
      smallTongue(x, y, z);
      
    // inner reinforcements
    step = 360 / 6;
    color("red") for (a = [0:step:360]) {
      rotate([0, 0, a])
        translate([-innerReinforcementWidth/2, innerDiam/2 + ringThick/2, 0])
          cube([innerReinforcementWidth, (outterDiam - innerDiam)/2 - ringThick, ringHeight]);
    }
    color("red") for (a = nutCageReinforcementAngles) {
      rotate([0, 0, a])
        translate([0, innerDiam/2 + ringThick/2, 0])
          cube([innerReinforcementWidth, (outterDiam - innerDiam)/2  - ringThick, ringHeight]);
    }
    color("blue") translate([halfOpenningWidth, -outterDiam/2, 0])
      cube([innerReinforcementWidth, (outterDiam - innerDiam)/2, ringHeight]);
    color("blue") translate([-halfOpenningWidth-innerReinforcementWidth, -outterDiam/2, 0])
      cube([innerReinforcementWidth, (outterDiam - innerDiam)/2, ringHeight]);

    // nut M6 cages (cages pour écrou) part 1
    for (a = nutCageAngles) {
      rotate([0, 0, a]) {
        color("green")
          translate([0, outterDiam/2 + nutCageDiam/4 - 1, 0])
            cylinder(h = nutCageHeight, d = nutCageDiam);
      }
    }

    // clamping system screw support
    color("lightblue")
    translate([2, -outterDiam/2 - 20 + 4, 0])
      roundedCube(10, 20, ringHeight, 1, 0.1);
    color("lightblue")
    translate([-10, -outterDiam/2 - 20 + 4, 0])
      roundedCube(10, 20, ringHeight, 1, 0.1);

    // connection axle
    color("lightblue")
    hull() {
      translate([0, outterDiam/2 + 10, 16]) rotate(90, [0, 1, 0]) cylinder(h=15.5, d=8, center=true);
      translate([-15.5/2, outterDiam/2 - 1, 2]) cube([15.5, 7, 8], false);
    }
  }

  // Parts to remove
  union() {
    // clamping system ligth openning
    translate([-halfOpenningWidth, -outterDiam/2 - 13.5, -1])
      cube([clampingOpenningWidth, (outterDiam - innerDiam)/2 + 14, ringHeight + 2]);

    // clamping screw hole
    translate([0, -outterDiam/2 - 7, ringHeight/2])
      rotate(90, [0, 1, 0])
        cylinder(h=25, d=5, center=true);
    // clamping screw's M4 nut cage, prof 3 (e=8.08, https://fr.wikipedia.org/wiki/%C3%89crou_hexagonal)
    translate([-9.5, -outterDiam/2 - 7, ringHeight/2])
      rotate(90, [0, 1, 0])
        cylinder(h=3.5, d=9, center=true, $fn=6);

    // 2 x nut M6 cages (cages pour écrou) part 2: holes
    color("blue") for (a = nutCageAngles) {
      rotate([0, 0, a])
        translate([0, outterDiam/2 + nutCageDiam/4 -1, 0]) {
          translate([0, 0, bottomHeight])
            rotate([0, 0, 25])
            cylinder(h = ringHeight-bottomHeight + 1, d = 12.5, $fn=6); // cage écrou M6 (e=11.54, https://fr.wikipedia.org/wiki/%C3%89crou_hexagonal)
          translate([0, 0, -0.2])
            cylinder(h = bottomHeight + 0.3, d = 6.5); // hole
        }
    }

    // connection axle hole
    translate([0, outterDiam/2 + 10, 16]) rotate(90, [0, 1, 0]) cylinder(h=17, d=5, center=true);
  }
}
