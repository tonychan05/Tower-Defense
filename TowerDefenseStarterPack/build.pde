void build(){
  drawMap();
  Sign();
  animateThing();
  drawBuildInterface();
  handleBuildClicks();
  song.pause();
}
//signs
void Sign(){
  sign2();
}

void sign2(){
  fill(orange);
  textSize(40);
  text("BUILD MODE" , 450,50);
}
/// build interface
void drawBuildInterface(){
   build2();
}
   void build2(){
  stroke(black);
  strokeWeight(10);
  fill(orange);
  rect(900,height/2,200,height);
  playMode.show();
  buyGunTower.show();
  sniperMode.show();
  Aoe.show();
  textSize(30);
   fill(white);
   text("CASH  " + cash, 900, 700);
  }
  
// handle clicks
void handleBuildClicks(){
  if(playMode.clicked){
    mode = PLAY;
  }
  if (buyGunTower.clicked && cash >=10){
    towers.add( new Tower(0));
    cash -= 10;
  }
   if (sniperMode.clicked  && cash >=20){
    towers.add( new Tower(2));
    cash -= 20;
   }
  if (Aoe.clicked && cash >=50){
    towers.add( new Tower(1));
    cash -= 50;
    
  }
}
  
