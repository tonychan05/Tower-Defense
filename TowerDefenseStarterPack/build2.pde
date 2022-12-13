
void buildFire(){
  drawMaps();
  Signs();
  animateThings();
  drawBuildInterfaces();
  handleBuildClick();
  song.pause();
}
//signs
void Signs(){
  sign1();
}
  void sign1(){
  fill(blue);
  textSize(40);
  text("BUILD MODE" , 450,50);
}

/// build interface
void drawBuildInterfaces(){
  stroke(white);
  strokeWeight(10);
  fill(special);
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
void handleBuildClick(){
  if(playMode.clicked){
    mode = ICEPLAY;
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
