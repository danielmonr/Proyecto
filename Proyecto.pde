PImage cabz, cejas, ojos, iris, boca, torso, brazos, piernad, piernai;
int cz_x, cz_y, cj_x, cj_y, o_x, o_y, i_x, i_y, b_x, b_y, t_x, t_y, bz_x, bz_y, pd_x, pd_y, pi_x, pi_y;
int cz_w, cz_h, cj_w, cj_h, o_w, o_h, i_w, i_h, b_w, b_h, t_w, t_h, bz_w, bz_h, pd_w, pd_h, pi_w, pi_h;
boolean animacion = false;
int anim_t;

int happy_b_w = 100;
int happy_b_h = 35;

void setup(){
  cabz = loadImage("cabeza_vacia.png");
  cejas = loadImage("cejas.png");
  ojos = loadImage("ojos.png");
  iris = loadImage("irises.png");
  boca = loadImage("boca.png");
  torso = loadImage("torso.png");
  brazos = loadImage("brazos.png");
  piernad = loadImage("p_derecha.png");
  piernai = loadImage("p_izquierda.png");
  size(1000, 1000);
  imageMode(CENTER);
  cz_x = width/2;
  cz_y = 150;
  cz_w = 300;
  cj_x = width/2;
  cj_y = 150;
  cj_w = 150;
  cj_h = 15;
  o_x = width/2;
  o_y = 170;
  o_w = 150;
  o_h = 40;
  i_x = width/2;
  i_y = 170;
  i_w = 125;
  i_h = 13;
  b_x = width/2;
  b_y = 250;
  b_w = 60;
  b_h = 15;
  t_x = (width/2)+2;
  t_y = 383;
  t_w = 140;
  t_h = 200;
  bz_x = width/2;
  bz_y = 378;
  bz_w = 400;
  bz_h = 200;
  pd_x = (width/2)+35;
  pd_y = 570;
  pd_w = 70;
  pd_h = 200;
  pi_x = (width/2)-35;
  pi_y = 570;
  pi_w = 70;
  pi_h = 200;
    println(width);
  println(height);
}

void draw(){
  background(255);
  
  if(animacion){
    if(anim_t == 1){
      happy();
    }
  }
  
  image(cabz, cz_x, cz_y, cz_w, cz_w);
  image(cejas, cj_x, cj_y, cj_w, cj_h);
  image(ojos, o_x, o_y, o_w, o_h);
  image(iris, i_x, i_y, i_w, i_h);
  image(boca, b_x, b_y, b_w, b_h);
  image(torso, t_x, t_y, t_w, t_h);
  image(brazos, bz_x, bz_y, bz_w, bz_h);
  image(piernad, pd_x, pd_y, pd_w, pd_h);
  image(piernai, pi_x, pi_y, pi_w, pi_h);
  
}

void happy(){
  boolean finished = true;
  if(b_w < happy_b_w){
    finished = false;
    b_w = b_w +2;
    //println("activo");
  }
  if (b_h < happy_b_h){
    finished = false;
    b_h = b_h +1;
  }
  
   if (finished){
     setup();
    animacion = false;
  }
}

void keyPressed(){
  if(animacion){
    return;
  }
  if(keyCode == UP){
    println("Se presiono");
    animacion = true;
    anim_t = 1;
  }
}