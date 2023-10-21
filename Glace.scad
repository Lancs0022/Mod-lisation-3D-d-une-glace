// Module représentant le sommet de la glace
module Glace_Sommet(height = 30, twist = 180, scale_factor = [0, 0]) {
    color("coral")
      translate([0, 0, 20]){
        linear_extrude(height = height, twist = twist,
          scale = scale_factor, center = false) {
          for (i = [1 : abs(1) : 6]) {
            rotate([0, 0, (60 * i)]){
              square([10, 10], center=false);
            }
          }

        }
      }
}

// Module représentant la partie principale de la glace
module Glace(height = 20, twist = 180, scale_factor = [1, 1]) {
  color("crimson") {
     linear_extrude(height = height, twist = twist,
      scale = scale_factor, center = false){
      for (i = [1 : abs(1) : 6]) {
        rotate([0, 0, (60 * i)]){
          square([10, 10], center=false);
        }
      }

    }
  }
}

module EclatDeChocolat(x, y, z) {
    translate([x, y, z]) {
        color("black") {
            cube([2, 2, 2]);
        }
    }
}

module MorceauDeFruit(x, y, z, couleur = [0, 1, 0]) {
    translate([x, y, z]) {
        color(couleur) {
            sphere(2);
        }
    }
}
module Garniture(){
    EclatDeChocolat(5, 5, 30);
    EclatDeChocolat(-7.5, -7.5, 25);
    EclatDeChocolat(11.2, -5, 20);
    EclatDeChocolat(-4.5, 4, 35);
    EclatDeChocolat(0, -5.5, 38);
    
    // Ajout de morceaux de fruits
    MorceauDeFruit(-7.5, 7.5, 25, , "yellow");
    MorceauDeFruit(8, 8, 22, , "orange");
    MorceauDeFruit(-5.5, -5.5, 31, "purple");
    MorceauDeFruit(2, -11, 22, "red");
    MorceauDeFruit(4.5, -4.5, 35, "chocolate");
    MorceauDeFruit(0, 7.5, 32);
}


Glace();
Glace_Sommet();
Garniture();