// valentina cappella com 1 leg 125541/6
https://youtu.be/Dn7_UPBg_zE?si=Wt644uz-Mdro4pOh
PImage imgreferencia;
int columnas;
int filas;
float tam;
float posX;
float posY;
float giroAzar;
float distancia;
float movimiento;
float centroR;
float centroV;
float centroA;
float fondoR;
float fondoV;
float fondoA;
boolean movimientoActivo;

void setup() {
  size(800, 400);
  imgreferencia = loadImage("imagentp3.jpg");
  columnas = 15;
  filas = 15;
  movimientoActivo= false;
  giroAzar= 0;
  centroR=205;
  centroV=45;
  centroA=25;
  fondoR=99;
  fondoV=145;
  fondoA=141;

  tam = 400.0 / columnas;
}

void draw() {
  background(fondoR, fondoV, fondoA);
  image(imgreferencia,0,0,400,400);

 //octogonos

  for (int x =0; x<columnas;x++) {
    for (int y=0; y<filas;y++) {
      posX =400+x*tam +tam/2;
      posY =y*tam +tam/2;
      if (x >=5&& x<=9 && y>= 5&&y<=9) {
        octogono(posX,posY,tam,true);

      } else{
        octogono(posX,posY,tam,false);
      }
    }
  }

  // diagonales

  for (int x = 0;x <=columnas;x++) {
    for (int y = 0;y<=filas;y++) {
      posX = 400+x*tam;
      posY = y*tam;
      distancia= dist (mouseX, mouseY,posX,posY);

      if (movimientoActivo==true){
        movimiento= calcular(distancia);
      }else{
        movimiento=0;
      }

      if (x >= 5&& x<=10 &&y>= 5&&y<=10) {
        diagonal(posX,posY,tam,true,movimiento);

      } else {
        diagonal(posX,posY,tam,false,movimiento);
      }
    }
  }
}

// funcion propia dibuja modulo

void octogono(float x, float y,float medida,boolean rojo){
  pushMatrix();
  translate(x, y);

  if(rojo==true){
    fill(centroR,centroV,centroA);
  }else{
    fill(fondoR,fondoV,fondoA);
  }

  stroke(0);
  strokeWeight(4);
  beginShape();

  vertex(-medida*0.30,-medida*0.50);
  vertex( medida*0.30,-medida*0.50);

  vertex(medida*0.50,-medida*0.30);
  vertex(medida*0.50,medida*0.30);

  vertex(medida*0.30,medida*0.50);
  vertex(-medida*0.30,medida*0.50);

  vertex(-medida*0.50,medida*0.30);
  vertex(-medida*0.50,-medida*0.30);

  endShape(CLOSE);

  popMatrix();
}

void diagonal(float x, float y, float medida, boolean roja,float rotacion){
  pushMatrix();
  translate(x, y);

  // octogono sobresale

  noStroke();
  fill(0);
  beginShape();

  vertex(-medida*0.10,-medida*0.28);
  vertex(medida*0.10,-medida*0.28);

  vertex(medida*0.28,-medida*0.10);
  vertex(medida*0.28,medida*0.10);

  vertex(medida*0.10,medida*0.28);
  vertex(-medida*0.10,medida*0.28);

  vertex(-medida*0.28,medida*0.10);
  vertex(-medida*0.28,-medida*0.10);

  endShape(CLOSE);

  // linea blanca dentro del octogono

  pushMatrix();
  rotate(rotacion+giroAzar);
  stroke(255);
  strokeWeight(4);

  if (roja==true){
    line(-medida*0.16,-medida*0.16,medida*0.16,medida*0.16);
  } else {
    line(-medida*0.16,medida*0.16,medida*0.16,-medida*0.16);
  }

  popMatrix();
  popMatrix();
}

float calcular(float d){
  float resultado;
  resultado = map(d, 0, 180, 0.78, 0);
  return resultado;
} //teclado
void keyPressed(){
// activa y desac movimiento
if(key== ' '){
  movimientoActivo = !movimientoActivo;
}

//C cambia colores random
if(key=='c'||key=='C'){
  centroR=random(0,255);
  centroV=random(0,255);
  centroA=random(0,255);

  fondoR=random(0,255);
  fondoV=random(0,255);
  fondoA=random(0,255);
}

//R reinicia
if(key=='r'|| key== 'R'){
  reiniciar();

}
}

//mouse
void mousePressed(){
  //c/click suma giro
  giroAzar= giroAzar+0.26;

}

//reinicio
void reiniciar(){
  movimientoActivo= false;
  giroAzar=0;
  movimiento=0;
  centroR=205;
  centroV=45;
  centroA=25;

  fondoR=99;
  fondoV=145;
  fondoA=141;
}
