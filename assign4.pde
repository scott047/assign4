int numFrames=5;
int currentFrame=0;
PImage [] images=new PImage[numFrames];
PImage background1Img;
PImage background2Img;
PImage background3Img;
PImage start1Img;
PImage start2Img;
PImage end1Img;
PImage end2Img;
PImage shipImg;
PImage hpImg;
PImage enemyImg;
PImage treasureImg;
PImage bulletImg;
int Y1,treasureX,treasureY,hpX,hpY,shipX,shipY;
final int FleeA=4,FleeB=5,FleeC=6,GAME_START=1,GAME_RUN=2,GAME_LOSE=3;
 int gameState=7,fleeState=8;
 float backgroundX,backgroundY,backgroundZ,blood;
 int R=shipX,k;
 int F=shipY,i;
boolean upPressed=false;
boolean leftPressed=false;
boolean downPressed=false;
boolean rightPressed=false;
boolean enterPressed=false;
int[] X=new int [5]; //X[0]~X[4] X[i]
int[] Y=new int [5];
int[] Z=new int [5];
int[] P=new int [5];
int[] r=new int [5];
int[] Q=new int [5];
/*
for(int i=0;i<5;i++)
{
  X[i]=80(i+1);
}
for(int i=0;i<5;i++)
{
  image(enemyImage,X[i],enemyY);
  X[i]++;
}
*/
void setup(){
  size(640,480);
  background1Img=loadImage("img/bg1.png");
  background2Img=loadImage("img/bg2.png");
  background3Img=loadImage("img/bg1.png");
  end1Img=loadImage("img/end2.png");
  end2Img=loadImage("img/end1.png");
  start1Img=loadImage("img/start2.png");
  start2Img=loadImage("img/start1.png");
  hpImg=loadImage("img/hp.png");
  enemyImg=loadImage("img/enemy.png");
  treasureImg=loadImage("img/treasure.png");
  shipImg=loadImage("img/fighter.png");
  bulletImg=loadImage("img/shoot.png");
  for(int i=0;i<numFrames;i++){
  images[i]=loadImage("img/flame"+(i+1)+".png");
}
enterPressed=false;
  treasureX=floor(random(20,620));
  treasureY=floor(random(20,200));
  i=10;
  shipX=620;
  shipY=220;
  backgroundX=0;
  hpX=20;
  hpY=20;
  blood=69;
R=shipX;
// F=shipY;
frameRate(10);
  for(int i=0;i<5;i++){
    X[i]=-(80*i);
  }
  Z[4]=600;
  Y[0]=floor(random(0,400));
  gameState=GAME_START;
  }

void draw(){
  switch(gameState){
    case GAME_START:
   image(start1Img,0,0);
   if(mouseX>=200&&mouseX<=440&&mouseY>=380&&mouseY<=420){
   image(start2Img,0,0);
   if(mousePressed){
   gameState=GAME_RUN;
   fleeState=FleeA;
   }
  }
  break;
  case GAME_RUN:
  switch(fleeState){
   case FleeA:


  image(background1Img,backgroundX,0);
  image(background2Img,backgroundY,0);
  image(background3Img,backgroundZ,0);
  fill(220,0,0);
  rectMode(CORNERS);
  rect(30,20,blood,40);
  image(hpImg,hpX,hpY);
  image(treasureImg,treasureX,treasureY);
  image(shipImg,shipX-20,shipY-20);
  if(treasureX+40>=shipX&&shipX+40>=treasureX){
    if(treasureY+40>=shipY&&shipY+40>=treasureY){
    treasureX=floor(random(20,620));
    treasureY=floor(random(20,200));
    blood+=19.5;
    }
  }
  for(int i=0;i<5;i++){
 image(enemyImg,X[i],Y[i]);
  Y[i]=Y[0];
   }   
     if(X[0]>=640&&X[1]>=640&&X[2]>=640&&X[3]>=640&&X[4]>=640){
       for(int i=0;i<5;i++){
    X[i]=-(80*i);
  }
   Y[0]=floor(random(0,40));
   fleeState=FleeB;}

for(int i=0;i<5;i++)
{
  X[i]+=10;
  if(X[i]+40>=shipX&&shipX+40>=X[i]&&Y[i]+40>=shipY&&shipY+40>=Y[i])
  {   
                 X[i]+=0;
      k=(currentFrame++)%5;
      image(images[k],X[i],Y[i]);
    if(k==4){
    X[i]+=640;
    blood-=39;
    }
  } 
          /*frameRate(10);
    int j=(currentFrame++)%5;
      image(images[j],X[i],Y[i]);
      X[i]+=640;
  }frameRate(60);*/
}
  
/*     for(int i=0;i<5;i++){
if(X[i]+40>=shipX&&shipX+40>=X[i]&&Y[i]+40>=shipY&&shipY+40>=Y[i]){
  int j=(i++)%5;
  X[j+1]=X[j];
    X[j]=1000;
  blood-=39;       
  }
     }
     */
/*else
if(X[1]+40>=shipX&&shipX+40>=X[1]&&Y[1]+40>=shipY&&shipY+40>=Y[1]){
  blood-=39;
  }
else
if(X[2]+40>=shipX&&shipX+40>=X[2]&&Y[2]+40>=shipY&&shipY+40>=Y[2]){
  blood-=39;
  }
else
if(X[3]+40>=shipX&&shipX+40>=X[3]&&Y[3]+40>=shipY&&shipY+40>=Y[3]){
  blood-=39;
  }
else
if(X[4]+40>=shipX&&shipX+40>=X[4]&&Y[4]+40>=shipY&&shipY+40>=Y[4]){
  blood-=39;
  }
*/
 
  break;
     case FleeB:
     image(background1Img,backgroundX,0);
  image(background2Img,backgroundY,0);
  image(background3Img,backgroundZ,0);
  fill(220,0,0);
  rectMode(CORNERS);
  rect(30,20,blood,40);
  image(hpImg,hpX,hpY);
  image(treasureImg,treasureX,treasureY);
  image(shipImg,shipX-20,shipY-20);
  if(treasureX+40>=shipX&&shipX+40>=treasureX){
    if(treasureY+40>=shipY&&shipY+40>=treasureY){
    treasureX=floor(random(20,620));
    treasureY=floor(random(20,200));
    blood+=19.5;
    }
  }
     for(int i=0;i<5;i++){
       image(enemyImg,X[i],Y[i]);
     Y[i]=Y[0]+80*i;
     }
     
    if(X[0]>=640&&X[1]>=640&&X[2]>=640&&X[3]>=640&&X[4]>=640){
      for(int i=0;i<5;i++){
    X[i]=-(80*i)-40;
    P[i]=-(80*i)-40;
  }
      Y[0]=floor(random(150,330));
      Z[0]=640;
     fleeState=FleeC;}
for(int i=0;i<5;i++)
{
  X[i]+=10;
  if(X[i]+40>=shipX&&shipX+40>=X[i]&&Y[i]+40>=shipY&&shipY+40>=Y[i])
  {   
                 X[i]+=0;
      k=(currentFrame++)%5;
      image(images[k],X[i],Y[i]);
    if(k==4){
    X[i]+=640;
    blood-=39;
    }
  }
}
    break;
    
    case FleeC:
  image(background1Img,backgroundX,0);
  image(background2Img,backgroundY,0);
  image(background3Img,backgroundZ,0);
  fill(220,0,0);
  rectMode(CORNERS);
  rect(30,20,blood,40);
  image(hpImg,hpX,hpY);
  image(treasureImg,treasureX,treasureY);
  image(shipImg,shipX-20,shipY-20);
  if(treasureX+40>=shipX&&shipX+40>=treasureX){
    if(treasureY+40>=shipY&&shipY+40>=treasureY){
    treasureX=floor(random(20,620));
    treasureY=floor(random(20,200));
    blood+=19.5;
    }
  }
  

for (int i = 0; i < 5; i++) {
      image(enemyImg,X[i],Y[i]);
      Y[4]=Y[0];
      Y[1]=Y[0]+50;
      Y[2]=Y[0]+100;
      Y[3]=Y[0]+50;
}
      for (int i = 0; i < 4; i++) {
      image(enemyImg,P[i],Z[i]);
      Z[1]=Y[1]-100;
      Z[2]=Y[2]-200;
      Z[3]=Y[3]-100;

    }
    
           if(X[0]>=640&&X[1]>=640&&X[2]>=640&&X[3]>=640&&X[4]>=640&&P[0]>=640&&P[1]>=640&&P[2]>=640&&P[3]>=640&&P[4]>=640){
             for(int i=0;i<5;i++){
    X[i]=-(80*i);
  }
             Y[0]=floor(random(0,400));
             fleeState=FleeA;
           }
          for(int i=0;i<5;i++)
{
  X[i]+=10;
  P[i]+=10;
  if(X[i]+40>=shipX&&shipX+40>=X[i]&&Y[i]+40>=shipY&&shipY+40>=Y[i])
  {   
                 X[i]+=0;
      k=(currentFrame++)%5;
      image(images[k],X[i],Y[i]);
    if(k==4){
    X[i]+=640;
    blood-=39;
    }
  } 
   if(P[i]+40>=shipX&&shipX+40>=P[i]&&Z[i]+40>=shipY&&shipY+40>=Z[i])
  {
    P[i]+=0;
      k=(currentFrame++)%5;
      image(images[k],P[i],Z[i]);
    if(k==4){
    P[i]+=640;
    blood-=39;
    }
  }
 
}
   
   
  break;
  
  }


  



 //<>// //<>//
   


  backgroundX+=2;
  backgroundY=backgroundX-640;
  backgroundZ=backgroundY-640;
  backgroundX=backgroundX%1280;
  
//for(int i=0;i<5;i++){
    if(key==32){
      enterPressed=true;
      }
    if(enterPressed){
      r[0]=(R-=20)%640+640;
              if(shipX>(R-=20)%640+640){
      image(bulletImg,r[0],shipY);}
      for(int i=0;i<5;i++){
      if(P[i]+40>=r[0]&&r[0]+40>=P[i]&&Z[i]+40>=shipY&&shipY+40>=Z[i])
  {
    P[i]+=0;
      k=(currentFrame++)%5;
      image(images[k],P[i],Z[i]);
    if(k==4){
    P[i]+=640;
    }
  }
  if(X[i]+40>=r[0]&&r[0]+40>=X[i]&&Y[i]+40>=shipY&&shipY+40>=Y[i])
  {   
      k=(currentFrame++)%5;
      image(images[k],X[i],Y[i]);
    if(k==4){
    X[i]+=640;
    }
  } }
              

  }



 if(upPressed){
   shipY=shipY-i;
 }
 
 if(downPressed){
   shipY=shipY+i;
 }
 
 if(rightPressed){
   shipX=shipX+i;
 }
 
 if(leftPressed){
   shipX=shipX-i;
 }
 if(shipX>=610){
   shipX=610;
 }
 if(shipX<=20){
   shipX=20;
 }
 if(shipY<=20){
   shipY=20;
 }
 if(shipY>=450){
   shipY=450;
 }
 if(blood>=225){
 blood=225;
 }
 if(blood<=30){
    gameState=GAME_LOSE;
  }
break;
    
  case GAME_LOSE:
    image(end1Img,0,0);
   if(mouseX>=200&&mouseX<=440&&mouseY>=300&&mouseY<=360){
   image(end2Img,0,0);
   if(mousePressed){
   gameState=GAME_RUN;
   fleeState=FleeA;
   R=shipX;
   enterPressed=false;
     if(key==32){
      enterPressed=true;
      }
    if(enterPressed){
      r[0]=(R-=20)%640+640;}
              if(shipX>(R-=20)%640+640){
      image(bulletImg,r[0],shipY);}
      for(int i=0;i<5;i++){
      if(P[i]+40>=r[0]&&r[0]+40>=P[i]&&Z[i]+40>=shipY&&shipY+40>=Z[i])
  {
    P[i]+=0;
      k=(currentFrame++)%5;
      image(images[k],P[i],Z[i]);
    if(k==4){
    P[i]+=640;
    }
  }
  if(X[i]+40>=r[0]&&r[0]+40>=X[i]&&Y[i]+40>=shipY&&shipY+40>=Y[i])
  {   
      k=(currentFrame++)%5;
      image(images[k],X[i],Y[i]);
    if(k==4){
    X[i]+=640;
    }
  } }
              
   fill(220,0,0);
   blood=69;
   rectMode(CORNERS);
   rect(30,20,blood,40);
   shipX=610;
   shipY=220;
   Y[0]=floor(random(0,400));
   treasureX=floor(random(20,620));
   treasureY=floor(random(20,200));
    for(int i=0;i<5;i++){
    X[i]=-(80*i);
  }
  Y[0]=floor(random(0,400));
   }
    }
   break;
}

}


 void keyPressed(){
    if(key==CODED){
   switch (keyCode){
   case UP:
       upPressed=true;
       break;
   case DOWN:
       downPressed=true;
       break;
   case RIGHT:
       rightPressed=true;
       break;
   case LEFT:
       leftPressed=true;
       break;

     }
   }
  }


void keyReleased(){
    if(key==CODED){
   switch (keyCode){
   case UP:
       upPressed=false;
       break;
   case DOWN:
       downPressed=false;
       break;
   case RIGHT:
       rightPressed=false;
       break;
   case LEFT:
       leftPressed=false;
       break;
   }
   }
  }
