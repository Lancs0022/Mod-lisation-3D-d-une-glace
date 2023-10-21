// Module représentant le cône de la glace
module Cone(r1 = 13, r2 = 0, h = 40) {
  color("white") {
    mirror([0,0,1]){
      cylinder(r1 = r1, r2 = r2, h = h, center = false);
    }
  }
}

// Ce module représente le trou au mileu de le cône
module Extrusion_du_cone(r = 10, h = 40)  {
  translate([0, 0, 0.01]){
    color([1,0.4,0]) {
      mirror([0,0,1]){
        cylinder(r1 = r, r2 = 0, h = h, center = false);
      }
    }
  }
}

// Module représentant la spirale décorative sur le cône
module Spirale_du_cone(h = 40, twist = 300, scale_factor = [0, 0]) {
  color("orange") {
    mirror([0,0,1]){
      translate([0, 0, 0]){
        linear_extrude(height = h, twist = twist, 
          scale = scale_factor, center = false){
          for (i = [-180 : abs(180) : 90]) {
            rotate([0, 0, (i * 25)]){
              translate([0, 13, 0]){
                circle(r=1.5);
              }
              translate([13, 0, 0]){
                circle(r=1.5);
              }
            }
          }
        }
      }
    }
  }
}

difference() {
  Cone();

  Extrusion_du_cone();
  Spirale_du_cone();
}