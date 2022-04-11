int soldierX,soldierY,robotX,robotY,vegX,vegY;
int b;

float groundhogX=320;
float groundhogY=80;
float t=0;

final int GAME_START=0,GAME_RUN=1,LIFE2=2,LIFE3=3,LIFE1=4,VEG1=5,VEG0=6,GAME_RESTART=7;
final int R=8,L=9,D=10,I=11;
int gameState=GAME_START;
int life=LIFE2;
int VEG=VEG1;
int move=I;

boolean right=false;
boolean down=false;
boolean left=false;
boolean up=false;

PImage startN,startH,restartN,restartH,title,heart,sky,groundhog,groundhogR,groundhogL,groundhogD;
PImage veg,robot,soldier,soil,over;

void setup() {
  size(640, 480, P2D);
    //soildier random place
  int b = floor(random(4))*80;
  soldierY=160+b;
  soldierX=0;  
  int c;
  c=160;
  int d=floor(random(4))*80;
  robotY=c+d;
  int e;
  e=160;
  int f=floor(random(6))*80;
  int g=floor(random(6))*80;
  int h=160+floor(random(4))*80;
  vegX=g;
  vegY=h;
  //soil image
  soil=loadImage("img/soil.png");
  image(soil,0,160,640,320);
  //grounghog image
  groundhogR= loadImage("img/groundhogRight.png");
  groundhogL= loadImage("img/groundhogLeft.png");
  groundhogD= loadImage("img/groundhogDown.png");
  //restart
  restartN= loadImage("img/restartNormal.png");
  restartH= loadImage("img/restartHovered.png");
  //gameover
  over= loadImage("img/gameover.jpg");
  heart= loadImage("img/life.png");
  soldier=loadImage("img/soldier.png");
  veg= loadImage("img/cabbage.png");
  b = floor(random(4))*80;
  soldierY=160+b;
  soldierX=0;
  //veg random
  vegX=g;
  vegY=h;
  title= loadImage("img/title.jpg");
  startN= loadImage("img/startNormal.png");
  startH= loadImage("img/startHovered.png");
  soil=loadImage("img/soil.png");
  groundhog=loadImage("img/groundhogIdle.png");
  sky=loadImage("img/bg.jpg");
}

void draw(){
  switch(gameState){
    case GAME_START:
      image(title,0,0,640,480);
      image(startN,248,360,144,60);
      if (mouseX>248 && mouseY>360 && mouseX<392 && mouseY<420){
        image(startH,248,360,144,60);}
      if(mouseX>248 && mouseY>360 && mouseX<392 && mouseY<420 && mousePressed){
        gameState=GAME_RUN;}
    break;
    
    case GAME_RUN:
    //bg
    image(sky,0,0,640,480);
    //grass
    noStroke(); 
    fill(124,204,25);
    rect(0,145,640,15);
    //sun
    noStroke(); 
    fill(255,255,0);
    ellipse(590,50,130,130);
    fill(253,184,19);
    ellipse(590,50,120,120);
    //soil
    image(soil,0,160,640,320);
    switch(VEG){
      case VEG1:
      image(veg,vegX,vegY,80,80);
      break;
      case VEG0:
      vegX=1000;vegY=1000;
      image(veg,vegX,vegY);
      break;
    }
    //soldier move
    if (soldierX>=640){soldierX=-80;}       
    //soildier random place      
    image(soldier,soldierX+=3,soldierY,80,80); 
        //losing life soldier
    if(groundhogY+80>soldierY &&  groundhogY<soldierY+80){
      if(groundhogX-soldierX<80 && groundhogX-soldierX>0){
         groundhogX=320;
         groundhogY=80;
         move=I;
         t=0;
         if(life==LIFE1)gameState=GAME_RESTART;
         if(life==LIFE2)life=LIFE1;
         if(life==LIFE3)life=LIFE2;         
      }
      if(groundhogX-soldierX>-80 && groundhogX-soldierX<0){           
         groundhogX=320;
         groundhogY=80;
         move=I;
         t=0;
         if(life==LIFE1)gameState=GAME_RESTART;
         if(life==LIFE2)life=LIFE1;
         if(life==LIFE3)life=LIFE2;
       } 
    }
    //groundhog move
    if(move==I){
      image(groundhog,groundhogX,groundhogY,80,80);
    }else{image(groundhog,1000,1000);}
    if(groundhogX>=width-80)groundhogX=width-80;
    if(groundhogX<=0)groundhogX=0;
    if(groundhogY>=height-80)groundhogY=height-80;
    switch (move){
      case R:
      if(groundhogX>=width-80){
        groundhogX+=0;
      }else{groundhogX +=80.0/15.0;}
      t++;
      image(groundhogR,groundhogX,groundhogY,80,80);
      break;
      
      case L:
      if(groundhogX<=0){groundhogX-=0;
      }else{groundhogX -=80.0/15.0;}
      t++;
      image(groundhogL,groundhogX,groundhogY,80,80);       
      break;
      
      case D:
      if(groundhogY<=height){groundhogY +=80.0/15.0;}
      if(t<=15)t++;
      image(groundhogD,groundhogX,groundhogY,80,80);       
      break;
      
      case I:
      image(groundhog,groundhogX,groundhogY,80,80);
      break;
    }
    if(t==15){
      if(groundhogY%80<40){
        groundhogY=groundhogY-groundhogY%80;
      }else{
        groundhogY=groundhogY-(groundhogY%80)+80;
      }
      if(groundhogX%80<40){
        groundhogX=groundhogX-groundhogX%80;
      }else{
        groundhogX=groundhogX-(groundhogX%80)+80;
      }
      image(groundhog,groundhogX,groundhogY,80,80);
      move=I;
      t=0;
    }
    //eating veg          
    if(groundhogY+40>vegY && groundhogY+40<vegY+80){
      if(groundhogX+40>vegX && groundhogX+40<vegX+80){vegX=1000;vegY=1000;
        image(veg,vegX,vegY);
        if(life==LIFE2)life=LIFE3;
        if(life==LIFE1)life=LIFE2;
        VEG=VEG0;
      }else{VEG=VEG1;}
    }
    switch(life){                  
      case LIFE2:
        //heart
        image(heart,10,10,50,51);
        image(heart,80,10,50,51);
      break;
      case LIFE3:
        //heart
        image(heart,10,10,50,51);
        image(heart,80,10,50,51);
        image(heart,150,10,50,51);
      break;
      case LIFE1:
        //heart
        image(heart,10,10,50,51);
      break;}
   
     break;
       
       case GAME_RESTART:
        image(over,0,0);
        image(restartN,248,360,144,60);
        if (mouseX>248 && mouseY>360 && mouseX<392 && mouseY<420){
          image(restartH,248,360,144,60);}
        if(mouseX>248 && mouseY>360 && mouseX<392 && mouseY<420 && mousePressed){
          gameState=GAME_RUN;
          life=LIFE2;
          VEG=VEG1;
          int g=floor(random(6))*80;
          int h=160+floor(random(4))*80;
          vegX=g; vegY=h;
          b = floor(random(4))*80;
          soldierY=160+b;
          soldierX=0;}
        break;
       
  }
}
void keyPressed(){
  if(gameState==GAME_RUN){
      switch(keyCode){
      case RIGHT: right=true;break;
      case DOWN: down=true;break;
      case LEFT: left=true;break;
      case UP: up=true;break;
      }
      if(right)move=R;
      else if(left)move=L;
      else if(down)move=D;

  }
}

void keyReleased(){
 
      switch(keyCode){
      case RIGHT: right=false;break;
      case DOWN: down=false;break;
      case LEFT: left=false;break;
      case UP: up=false;break;
      }
  
}
