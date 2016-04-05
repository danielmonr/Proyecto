PImage cabz, cejas, ojos, iris, boca, torso, brazod, brazoi ,brazos, piernad, piernai, corazon, fondoEnamorado;
int cz_x, cz_y, cj_x, cj_y, o_x, o_y, i_x, i_y, b_x, b_y, t_x, t_y, bz_x, bz_y, pd_x, pd_y, pi_x, pi_y;
float cz_w, cz_h, cj_w, cj_h, o_w, o_h, i_w, i_h, b_w, b_h, t_w, t_h, bz_w, bz_h, pd_w, pd_h, pi_w, pi_h;
float cor_x, cor_y, cor_h, cor_w, cor2_x, cor2_y, cor2_h, cor2_w;
float t=.5, brinco=-.1, corTam=.5;
int cj_happy = 130;
boolean animacion = false;
int anim_t;

int happy_b_w = 100;
int happy_b_h = 35;
int cambioAngulo=2;
int anguloBrazo=0;
int op=1, op2=0, op3=0;

void setup() {
    pushMatrix();
  cabz = loadImage("cabeza_vacia.png");
  cejas = loadImage("cejas.png");
  ojos = loadImage("ojos.png");
  iris = loadImage("irises.png");
  boca = loadImage("boca.png");
  torso = loadImage("torso.png");
  brazos = loadImage("brazos.png");
  brazod = loadImage("brazo_d.png");
  brazoi = loadImage("brazo_i.png");
  piernad = loadImage("p_derecha.png");
  piernai = loadImage("p_izquierda.png");
  corazon = loadImage("corazon.png");
  fondoEnamorado = loadImage("fondoEnamorado.png");
  size(1000, 1000, P3D);
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
  cor_x= (width/2)-55;
  cor_y= 170;
  cor_h= 11;
  cor_w= 11;
  cor2_x= (width/2)+55;
  cor2_y= 170;
  cor2_h= 11;
  cor2_w= 11;

  /*println(width);
  println(height);
  */
}

void draw() {
  background(255);



  if (animacion) {
        if (anim_t == 1) {
      happy();
    }
    else if (anim_t == 2) {
      image(fondoEnamorado, 500, 400, 1000, 800);
      love();
      //println("Este es el valor de brinco  %f", brinco);
    }
  }

  image(cabz, cz_x, cz_y, cz_w, cz_w);
  image(cejas, cj_x, cj_y, cj_w, cj_h);
  image(ojos, o_x, o_y, o_w, o_h);
  image(iris, i_x, i_y, i_w, i_h);
  image(boca, b_x, b_y, b_w, b_h);
  image(torso, t_x, t_y, t_w, t_h);
  //image(brazos, bz_x, bz_y, bz_w, bz_h);
  if(!animacion || (anim_t != 1  && anim_t != 2)){
    image(brazod, bz_x, bz_y, bz_w, bz_h);
    image(brazoi, bz_x, bz_y, bz_w, bz_h);
  }
  image(piernad, pd_x, pd_y, pd_w, pd_h);
  image(piernai, pi_x, pi_y, pi_w, pi_h);
  if (anim_t == 2)
  {
    image(corazon, cor_x, cor_y, cor_w, cor_w);
    image(corazon, cor2_x, cor2_y, cor2_w, cor2_w);
  }
  
  if (animacion) {
 
  }
} //Cierre de draw


float angulo = 10;
float trans = 0;


void happy() {
  pushMatrix();
  boolean finished = true;
  if (b_w < happy_b_w) {
    finished = false;
    b_w = b_w +2;
    //println("activo");
  }
  if (b_h < happy_b_h) {
    finished = false;
    b_h = b_h +1;
  }
  if (cj_y > cj_happy){
    cj_y = cj_y -2;
    cj_w = cj_w + 1;
  }
  //image(brazod, bz_x, bz_y, bz_w, bz_h);
  //image(brazoi, bz_x, bz_y, bz_w, bz_h);
  translate(bz_x+trans , bz_y + (trans / 2));
  rotate(radians(angulo));
  //println("rotando");
  image(brazod, 0, 0, bz_w, bz_h);
  rotate(-radians(angulo));
  rotate(-radians(angulo));
  translate(-(trans*1.5), trans);
  image(brazoi, 0, 0, bz_w, bz_h);
  angulo = angulo -2;
  trans = trans +2;
  popMatrix();
  

  if (finished) {
    angulo = 10;
    trans = 10;
    setup();
    animacion = false;
  }
}//Cierre de happy

void love()
{
boolean finished = false;
  if (cor_h<10)
  {
  op2=0;
  cor_h= 11;
  cor_w= 11;
  cor2_h= 11;
  cor2_w= 11;
  }
  else if(cor_h>99)
  op2=1;
  

  if (cor_h>10 && op2==0 )
  {
    cor_h+=corTam;
    cor_w+=corTam;
    cor2_h+=corTam;
    cor2_w+=corTam;
  } else if (cor_h>=10 && op2==1)
  {
    cor_h-=corTam; 
    cor_w-=corTam;
    cor2_h-=corTam;
    cor2_w-=corTam;
  }


    if (brinco<=-80)
      op=0;
    else if (brinco>=0)
    {
      op=1;
      brinco= -.1;
    }
  if (brinco > -80 && op==1 )
  {
    brinco= brinco - .2;
    translate(0, brinco);
  
  } else if (brinco<0 && op==0)
  {
    brinco= brinco +.2;
    translate(0, brinco);
  }
  if (brinco>= 0)
  {
   finished = true ;
  }

 pushMatrix();
 if(angulo >= 10)
  op3=1;
  if(angulo <= -45)
  op3=0;
 if (angulo <=10 && op3 == 0)
 {
   angulo = angulo +2;
  trans = trans -2;
  
 }
 else if (angulo <= 10 && op3 == 1)
 {
   angulo = angulo -2;
  trans = trans +2;
 
 }
  
  println("rotando: ", angulo);
 translate(bz_x+trans , bz_y + (trans / 2));
  rotate(radians(angulo));
  //println("rotando");
  image(brazod, 0, 0, bz_w, bz_h);
  rotate(-radians(angulo));
  rotate(-radians(angulo));
  translate(-(trans*1.5), trans);
  image(brazoi, 0, 0, bz_w, bz_h);
  
  

 
 
  popMatrix();
  
  

  if (finished){
   setup();
   animacion = false;
   anim_t = 0;
   angulo = 10;
   trans = 10;
   
   }
   
}//Cierre de love


void keyPressed() {
  if (animacion) {
    return;
  }
  if (keyCode == UP) {
    println("Se presiono");
    animacion = true;
    anim_t = 1;
  } else if (keyCode == DOWN) {
    println("Se presiono ABAJO");
    animacion = true;
    anim_t = 2;
  }
}//Cierre de teclaPresionada