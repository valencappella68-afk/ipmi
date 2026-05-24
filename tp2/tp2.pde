int pantalla;
PImage imgCasa;
PImage imgpareja;
PImage corazones;
PImage casa;
PImage estrellas;
PImage reparto;
PImage premios;
PImage lunares;
PImage direccion;
PFont Play;
PFont fuente2;
int contador;
float posX; 
float posY; 
float posY2 = 550;
float textoX; 
float textoY = 550;
float fondoX;
float velFU;
float posXPremios;
float posXdireccion;
String texto1;
String textoPremios;
String textoDireccion;

void setup() {
  size(640,480);
  imgCasa = loadImage("thenotebook.jpg");
  imgpareja = loadImage("foto2.jpg"); 
  corazones = loadImage("corazones.jpg");
  casa = loadImage("house.jpg");
  estrellas = loadImage("estrellas.jpg");
  reparto = loadImage("fotopareja.jpg");
  premios=loadImage("premios.jpg");
  lunares=loadImage("lunares.jpg");
  direccion=loadImage("direccion.jpg");
  Play = loadFont("Fuente1.vlw");
  fuente2=loadFont("fuente2.vlw");
  texto1 = "Ryan Gosling:\nNoah Calhoun (joven)\n\nRachel McAdams:\nAllie Hamilton (joven)\n\nJames Garner:\nNoah Calhoun (anciano)\n\nGena Rowlands:\nAllie Calhoun (anciana)\n\nJames Marsden:\nLon Hammond Jr.\n(prometido de Allie)\n\nJoan Allen:\nAnne Hamilton\n(madre de Allie)\n\nSam Shepard:\nFrank Calhoun\n(padre de Noah)";
textoPremios= "La película Diario de una pasión\n(The Notebook, 2004) ganó más de\n 12 premios y recibió 10 nominaciones,\n destacando principalmente en los géneros\n romántico y juvenil. Sus mayores\n reconocimientos incluyeron 11 premios\n Teen Choice Awards, un MTV Movie Award\nal Mejor Beso, un Satellite Award y un premio\nBMI Film Music.";
 textoDireccion="Dirección: Nick Cassavetes\nGuion: Jeremy Leven y Jan Sardi\nProducción: Lynn Harris y Mark Johnson\nBanda sonora: Aaron Zigman\nFotografía: Robert Fraisse\nMontaje: Alan Heim\nCompañías productoras:\n New Line Cinema, Gran Via y Avery Pix";
  contador = 0; 
  fondoX = 0;
  velFU = 1;
  posX = width;
  posY = -height; 
  textoX = -250;
}

void draw(){

  println(mouseX + "/" + mouseY);

  // PORTADA
  if(pantalla == 0){

    background(175,234,223);
    image(imgCasa,0,0,640,480);

    textAlign(CENTER);
    textFont(Play); 
    textSize(40);
    fill(0);
    text("PLAY",158,378);
    fill(255);
    text("PLAY",160,380);
  }

  // PANTALLA 2
  else if(pantalla == 1){
    contador++;  

    background(17,13,12);
    imageMode(CORNER);
    image(corazones,fondoX,0,width,height);
    image(corazones,fondoX+width,0,width,height);

    fondoX -= velFU;

    if(fondoX <= -width){
      fondoX = 0;
    }

    // MOVIMIENTO IMAGEN
    posY += 6;

    if(posY > 0){
      posY = 0;
    }

    // MOVIMIENTO TEXTO
    if(textoX < width/4){
      textoX += 2;
    }

    fill(255);
    textSize(20);
    textAlign(CENTER);
    text("Diario \nde \nuna pasión", textoX, 50);
    textSize(15);
    text("Es un drama romántico\n de 2004 sobre Noah Calhoun\n y Allie Hamilton,\n dos jóvenes de clases sociales\ndistintas que se enamoran \nintensamente en la década de 1940\n en Carolina del Norte.\n Separados por la guerra \n y las presiones\n familiares, sus vidas toman rumbos\n diferentes hasta que un emotivo \n reencuentro años después \n pone a prueba sus destinos.", textoX, 120);
    image(imgpareja, width/2, posY, width/2, height);

    // CAMBIO PANTALLA
    if(contador >= 60*5){
      pantalla = 2;
      contador = 0;
      posX = 0;
      textoX = -320;
    }
  }

  // PANTALLA 3
  else if(pantalla == 2){

    contador++;

    background(105,167,204);
    imageMode(CORNER);
    image(estrellas,fondoX,0,width,height);
    image(estrellas,fondoX+width,0,width,height);

    fondoX -= velFU;

    if(fondoX <= -width){
      fondoX = 0;
    }

    posX = 0;

    if(textoX < 480){
      textoX += 4;
    }

    textAlign(CENTER);
    textFont(Play);
    textSize(20);
    fill(0);
    text("Quiero una casa blanca\ncon contraventanas azules\ny una habitación con vistas\nal río para poder pintar", textoX, 60);
    textSize(15);
    text("Cuando eran jóvenes\nAllie le contó cómo\nsoñaba su casa ideal\na Noah. Años después, aunque estuvieron\nseparados por mucho tiempo,\nNoah reconstruyó esa vieja casa\nabandonada pensando en ella\ny en la promesa de su amor.", textoX, 190);

    imageMode(CORNER);
    image(casa,posX,0,width/2,height);

    // CAMBIO PANTALLA
    if(contador >= 60*5){
      pantalla = 3;
      contador = 0;
      posY2 = 550;
      textoY = 550;
    }
  
}
  // PANTALLA 4

else if(pantalla ==3){
   contador++;
    background(18,12,12);

    // MOVIMIENTO IMAGEN
    posY2 -= 6;

    if(posY2 <= 0){
      posY2 = 0;
    }

    // MOVIMIENTO TEXTO
    textoY -= 6;

    if(textoY <= 60){
      textoY = 60;
    }

    imageMode(CORNER);
    image(reparto, width/2, posY2, width/2, height);

    textAlign(CENTER);
    textFont(Play);
    textSize(20);
    fill(255);
    text("Reparto",200,textoY-20);
    textSize(15);
    text(texto1,200,textoY);
  
  if(contador >= 60*5){
  pantalla = 4;
  contador = 0;
  posXPremios=width; 
  textoY = 550;
}
}

  // PANTALLA 5 (PREMIOS)
  else if(pantalla == 4){
    contador++;
    background(255);
       imageMode(CORNER);
    image(lunares,fondoX,0,width,height);
    image(lunares,fondoX+width,0,width,height);

    fondoX -= velFU;

    if(fondoX <= -width){
      fondoX = 0;
    }
    
    // mov imagen
    posXPremios -= 6;
    if(posXPremios <= 0){
      posXPremios = 0;
    }
    
    // mov texto
    textoY -= 6;
    if(textoY <= 60){
      textoY = 60;
    }
    
    textAlign(CENTER);
    textFont(Play);
    textSize(20);
    fill(0);
    text("Premios", 480, textoY-20);
    textSize(15);
    text(textoPremios,480,textoY+70);

    imageMode(CORNER);
    image(premios, posXPremios, 0, width/2, height);
    
     if(contador >= 60*5){
  pantalla = 5;
  contador = 0;
  posXdireccion=width; 
  posY=height;
     }
}
//pantalla 6
else if(pantalla == 5){
  contador++;

  background(224, 211, 185);
  imageMode(CORNER);
   posY-=6;;
  if(posY<0){
    posY=0;
  }
  image(direccion,0,posY,width,height);
textoY+=4;
    if(textoY>150){
      textoY=150;
    }
    textAlign(CENTER);
    textFont(fuente2); 
    textSize(40);
    fill(145, 91, 50);
    text("DIRECCION",472,textoY);
    textSize(15);
    text(textoDireccion,472,textoY+80);
    //reinicio
    fill(145, 91, 50);
rect(20, 420, 140, 40);

fill(224, 211, 185);
textFont(fuente2);
textSize(25);
textAlign(CENTER);

text("REINICIO", 90, 448);
    
  
  //mov imagen
   fondoX -= velFU;

    if(fondoX <= -width){
      fondoX = 0;
    }
     // mov texto
   
   
    
    
  }


}


void mousePressed(){
  if(pantalla == 0){
    if(mouseX > 64 && mouseX < 264 && mouseY > 360 && mouseY < 440){
      pantalla = 1;
      posY = -height;
      textoX = -250;
      contador = 0;
    }
  }
      if(pantalla == 5){

  if(mouseX > 20 && mouseX < 160 && mouseY > 420 && mouseY < 460){

    pantalla = 0;

    contador = 0;
    posY = -height;
    posY2 = 550;
    textoX = -250;
    textoY = 550;
    posXPremios = width;
    posX = width;
  }
}
    }  
