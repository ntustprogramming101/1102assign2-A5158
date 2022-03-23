int soldierX;
int soldierY;
int robotX;
int robotY;
int vegX;
int vegY;
int b;

float groundhogX=320;
float groundhogY=80;
float t=0;

final int GAME_START=0;
final int GAME_RUN=1;
final int LIFE2=2;
final int LIFE3=3;
final int LIFE1=4;
final int VEG1=5;
final int VEG0=6;
final int GAME_RESTART=7;
final int R=8;
final int L=9;
final int D=10;
final int I=11;
int gameState=GAME_START;
int life=LIFE2;
int VEG=VEG1;
int move=I;

boolean right=false;
boolean down=false;
boolean left=false;
boolean up=false;

PImage startN;
PImage startH;
PImage restartN;
PImage restartH;
PImage title;
PImage heart; 
PImage sky;
PImage groundhog;
PImage groundhogR;
PImage groundhogL;
PImage groundhogD;
PImage veg;
PImage robot;
PImage soldier;
PImage soil;
PImage over;


//laser
  int laserX;
  int laserA;
void setup() {
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
  robotX=e+f;
  laserX=robotX;
  laserA=laserX;
  size(640, 480, P2D);
  

 
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
}

void draw() {
  switch(gameState){
    case GAME_START:
      title= loadImage("img/title.jpg");
      image(title,0,0,640,480);
      startN= loadImage("img/startNormal.png");
      image(startN,248,360,144,60);
      if (mouseX>248 && mouseY>360 && mouseX<392 && mouseY<420){
        startH= loadImage("img/startHovered.png");
        image(startH,248,360,144,60);}
      if(mouseX>248 && mouseY>360 && mouseX<392 && mouseY<420 && mousePressed){
        gameState=GAME_RUN;}
    break;
    
    case GAME_RUN:
    //bg
    sky=loadImage("img/bg.jpg");
    image(sky,0,0,640,480);
    //grass
    noStroke(); 
    fill(124,402,25);
    rect(0,145,640,15);
    //sun
    noStroke(); 
    fill(255,255,0);
    ellipse(590,50,130,130);
    fill(253,184,19);
    ellipse(590,50,120,120);
    //soil
    soil=loadImage("img/soil.png");
    image(soil,0,160,640,320);
    //groundhog move
    groundhog=loadImage("img/groundhog.png");
    if(move==I){
      image(groundhog,groundhogX,groundhogY,80,80);
    }else{image(groundhog,1000,1000);}

    if(t==15){
      image(groundhog,groundhogX,groundhogY,80,80);
      move=I;
      t=0;
    }
    switch (move){
      case R:
      if(groundhogX>=width-80){groundhogX+=0;
      }else{groundhogX +=80.0/15.0;}
      t++; 
      
      image(groundhogR,groundhogX,groundhogY,80,80);
      if(groundhogY+80>soldierY &&  groundhogY<soldierY+80){
             if(groundhogX-soldierX<80 && groundhogX-soldierX>0){
                t=0;
                move=I;
                break;
             }
             if(groundhogX-soldierX>-80 && groundhogX-soldierX<0){   
                t=0;
                move=I;
                break;
             } 
       }
      break;
      case L:
      if(groundhogX<=0){groundhogX-=0;
      }else{groundhogX -=80.0/15.0;}
      t++;
      image(groundhogL,groundhogX,groundhogY,80,80);
            if(groundhogY+80>soldierY &&  groundhogY<soldierY+80){
             if(groundhogX-soldierX<80 && groundhogX-soldierX>0){
                t=0;
                move=I;
                break;
             }
             if(groundhogX-soldierX>-80 && groundhogX-soldierX<0){
                t=0;
                move=I;
                break;
             } 
       }
      break;
      case D:
      if(groundhogY>=height-80){groundhogY+=0;
      }else{groundhogY +=80.0/15.0;}
      t++;
      image(groundhogD,groundhogX,groundhogY,80,80);
            if(groundhogY+80>soldierY &&  groundhogY<soldierY+80){
             if(groundhogX-soldierX<80 && groundhogX-soldierX>0){
                t=0;
                move=I;
                break;
             }
             if(groundhogX-soldierX>-80 && groundhogX-soldierX<0){
                t=0;
                move=I;
                break;
             } 
       }
      break;
      case I:
      image(groundhog,groundhogX,groundhogY,80,80);
      break;
    }
    switch(VEG){
      case VEG1:
        image(veg,vegX,vegY);
      break;
      case VEG0:
        vegX=1000;vegY=1000;
        image(veg,vegX,vegY);
      break;
         }
    
    switch(life){                  
       case LIFE2:
          //heart
          image(heart,10,10,50,51);
          image(heart,80,10,50,51);
          image(soldier,soldierX+=3,soldierY,80,80);
          if (soldierX>=640){soldierX=-80;}
          image(veg,vegX,vegY,80,80);
          if(groundhogY+40>vegY && groundhogY+40<vegY+80){
             if(groundhogX+40>vegX && groundhogX+40<vegX+80){vegX=1000;vegY=1000;
                image(veg,vegX,vegY);
                life=LIFE3;}else{VEG=VEG1;}
           }
          //lose heart
          if(groundhogY+80>soldierY &&  groundhogY<soldierY+80){
             if(groundhogX-soldierX<80 && groundhogX-soldierX>0){
                groundhogX=320;
                groundhogY=80;
                life=LIFE1;}
                if(groundhogX-soldierX>-80 && groundhogX-soldierX<0){           
                groundhogX=320;
                groundhogY=80;
                life=LIFE1;} }
                
      break;
      case LIFE3:
      //heart
      image(heart,10,10,50,51);
      image(heart,80,10,50,51);
      image(heart,150,10,50,51);
      //soldier move
      if (soldierX>=640){soldierX=-80;}       
      //soildier random place      
      image(soldier,soldierX+=3,soldierY,80,80);
      //robot
      /*robot=loadImage("img/robot.png");
      image(robot,robotX,robotY,80,80);*/
      //laser      
      /*strokeWeight(10);
      stroke(255,0,0);
      line (laserA+25 ,robotY+37,laserX+25,robotY+37);
      laserX=laserX-2;
      laserA=laserA-4;
      if(laserX<=robotX-160){
        laserX=robotX;
        laserA=laserX;}
      if(laserX-laserA>=40){
        laserA=laserX-40;}*/
       //loose heart
       if(groundhogY+80>soldierY &&  groundhogY<soldierY+80){
         if(groundhogX-soldierX<80 && groundhogX-soldierX>0){
            groundhogX=320;
            groundhogY=80;
            life=LIFE2;}
            if(groundhogX-soldierX>-80 && groundhogX-soldierX<0){            
            groundhogX=320;
            groundhogY=80;
            life=LIFE2;} }
            break;

          case LIFE1:
          //heart
            image(heart,10,10,50,51);
            image(soldier,soldierX+=3,soldierY,80,80);
            if (soldierX>=640){soldierX=-80;} 
          //veg
           if(groundhogY+40>vegY && groundhogY+40<vegY+80){
              if(groundhogX+40>vegX && groundhogX+40<vegX+80){
                  vegX=1000;vegY=1000;
                  image(veg,vegX,vegY);
                  life=LIFE2;
                  VEG=VEG0;
            }else{VEG=VEG1;}}
          if(groundhogX==vegX && groundhogY==vegY){VEG=VEG0;}
            //lose heart
            if(groundhogY+80>soldierY &&  groundhogY<soldierY+80){
               if(groundhogX-soldierX<80 && groundhogX-soldierX>0){ 
                  groundhogX=320;
                  groundhogY=80;
                  gameState=GAME_RESTART;}
                  if(groundhogX-soldierX>-80 && groundhogX-soldierX<0){ 
                  groundhogX=320;
                  groundhogY=80;
                  gameState=GAME_RESTART;} }
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
  if(key==CODED){
      switch(keyCode){
      case RIGHT: right=true;break;
      case DOWN: down=true;break;
      case LEFT: left=true;break;
      case UP: up=true;break;
      }
  }
    if(keyPressed){
      image(groundhog,1000,1000);
      if(t==0){
        if(right)move=R;
        else if(left)move=L;
        else if(down)move=D;
      }
    }//else{image(groundhog,groundhogX,groundhogY,80,80);}
    if(groundhogX>=width-80)groundhogX=width-80;
    if(groundhogX<=0)groundhogX=0;
    if(groundhogY>=height-80)groundhogY=height-80;
  }
}

void keyReleased(){
  if(key==CODED){
      switch(keyCode){
      case RIGHT: right=false;break;
      case DOWN: down=false;break;
      case LEFT: left=false;break;
      case UP: up=false;break;
      }
  }
}

void mousePressed(){
  
}
