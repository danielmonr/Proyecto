PImage cabz, cejas, ojos, iris, boca, torso, brazod, brazoi ,brazos, piernad, piernai, corazon, fondoEnamorado, gota, fondoTriste, fondoFeliz, charco ;
int cz_x, cz_y, cj_x, cj_y, o_x, o_y, i_x, i_y, b_x, b_y, t_x, t_y, bz_x, bz_y, pd_x, pd_y, pi_x, pi_y, g_x, g_y, g_x2, g_y2, g_x3, g_y3, g_x4, g_y4, ch_x, ch_y;
float cz_w, cz_h, cj_w, cj_h, o_w, o_h, i_w, i_h, b_w, b_h, t_w, t_h, bz_w, bz_h, pd_w, pd_h, pi_w, pi_h,  g_w, g_h, g_w2, g_h2, ch_w, ch_h;
float cor_x, cor_y, cor_h, cor_w, cor2_x, cor2_y, cor2_h, cor2_w;
float t=.5, brinco=-.1, corTam=.5;
int cj_happy = 130;
boolean animacion = false;
int anim_t;

int happy_b_w = 100;
int happy_b_h = 35;
int tristeza_g_y = 700;
int tristeza_ch_w = 700;
int tristeza_ch_h = 250;
int cambioAngulo=2;
int anguloBrazo=0;
int op=1, op2=0, op3=0;
int cont = 0;


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
  fondoFeliz = loadImage("fondoFeliz.jpg");
  fondoTriste = loadImage("fondoTriste.jpg");
  gota = loadImage("gota.png");
  charco = loadImage("charco.png");
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
  g_x = (width/2)-55;
  g_y = 210;
  g_w = 60;
  g_h = 60;
  ch_x = width/2;
  ch_y = 720;
  ch_w = 300;
  ch_h = 80;
  g_x2 = (width/2)+55;
  g_y2 = 210;
  g_w2 = 60;
  g_h2 = 60;
  g_x3 = (width/2)-55;
  g_y3 = 210;
   g_x4 = (width/2)+55;
  g_y4 = 210;

  /*println(width);
  println(height);
  */
}

void draw() {
  background(255);



  if (animacion) {
        if (anim_t == 1) {
          image(fondoFeliz, 500, 400, 1000, 800);
      happy();
    }
    else if (anim_t == 2) {
      image(fondoEnamorado, 500, 400, 1000, 800);
      love();
      //println("Este es el valor de brinco  %f", brinco);
    }
    else if (anim_t == 3){
        image(fondoTriste, 500, 400, 1000, 800);
    }
  }

  image(cabz, cz_x, cz_y, cz_w, cz_w);
  image(cejas, cj_x, cj_y, cj_w, cj_h);
  image(ojos, o_x, o_y, o_w, o_h);
  image(iris, i_x, i_y, i_w, i_h);
  if(!animacion || anim_t != 3){
    image(boca, b_x, b_y, b_w, b_h);
  }
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
      if(anim_t == 3){
        cont++;
        image(gota, g_x, g_y, g_w, g_h);
        if (cont > 230){
        image(charco, ch_x, ch_y, ch_w, ch_h);
        }
        tristeza();
        if (cont > 50){
          image(gota, g_x2, g_y2, g_w2, g_h2);
        }
        if (cont > 100){
          image(gota, g_x3, g_y3, g_w2, g_h2);
        }
        if (cont > 150){
          image(gota, g_x4, g_y4, g_w2, g_h2);
        }
      }
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



void tristeza(){
  
  pushMatrix();
  boolean finished = true;
  translate(b_x, b_y + (b_h/2));
  rotate(PI);
  image(boca,0,0, b_w,b_h);
  
  //////////////////////
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
  
  if (g_y < tristeza_g_y){
    finished = false;
    g_y = g_y +2;
  }
  
  if (cont>230){
  if (ch_w < tristeza_ch_w){
    ch_w = ch_w + 2;
  }
  if (ch_h < tristeza_ch_h){
    ch_h = ch_h +2;
  }
  }
  
  if (cont>50){
  if (g_y2 < tristeza_g_y){
    finished = false;
    g_y2 = g_y2 + 2;
  }
  }
  
    if (cont>100){
  if (g_y3 < tristeza_g_y){
    finished = false;
    g_y3 = g_y3 + 2;
  }
  }
  
    if (cont>150){
  if (g_y4 < tristeza_g_y){
    finished = false;
    g_y4 = g_y4 + 2;
  }
  }
  
  
   if (finished) {
    angulo = 10;
    trans = 10;
    setup();
    animacion = false;
    cont = 0;
  }
  /////////////////////
  
  
  //if (cont>100){
  //  finished=true;
  //  cont =0;
  //}  
    popMatrix();

}// cierra tristeza



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
    else if (keyCode == LEFT){
  animacion=true;
  anim_t = 3;
  }
}//Cierre de teclaPresionada