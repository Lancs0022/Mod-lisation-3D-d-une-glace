// Assemblage des differentes modules de la glace
use<Glace.scad>
use<ConeDeLaGlace.scad>

// Assemblage de la glace
union(){
  Glace_Sommet(height = 30, twist = 180, scale_factor = [0, 0]);
  Glace(height = 20, twist = 180, scale_factor = [1, 1]);
     // Ajout d'éclats de chocolat
  Garniture();
}
// Assemblage du cône
difference() {
  Cone();

  Extrusion_du_cone();
  Spirale_du_cone();
}
