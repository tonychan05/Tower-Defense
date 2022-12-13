//This function draws the PLAY screen

PImage img2;
int wave = 0;
int globalCD = 0;
void play() {
  drawMap();
  animateThings();
  drawPlayInterface();
  handleButtonClicks();
  song.pause();
  nextWave.show();
  buildMode.show();
  back.show();
  ringsAct();
  
  globalCD++;

   if (lives == 0) mode = GAMEOVER;
   textSize(30);
   fill(white);
   text("CASH " + cash, 900, 700);
   text("Wave " +  waveNumber , 900, 730);
  
}
void drawMap() {
  mapLayout2();
}
  
void mapLayout2(){
  background (0);
  image(img2, 500, 400, 1000, 800);

  ///path//
   stroke(orange);
  strokeWeight(18);
  line(0, 400, 200, 400);
  line(200, 400, 200, 200);
  line(200, 200, 400, 200);
  line(400, 200, 400, 600);
  line(400, 600, 300, 600);
  line(300, 600, 300, 500);
  line(300, 500, 500, 500);
  line(500, 500, 500, 400);
  line(500, 400, 790, 400);

  int i=0;
  while (i<8) {
    map1node[i].show();
    i++;
  }
  }
void drawPlayInterface() {
  playSecond();
}

// play options (2)
  void playSecond(){
  stroke(black);
  strokeWeight(5);
  fill(orange);
  rect(900, height/2, 200, height);
  fill(white);
  textSize(22);
  text("Next Wave", 900, 30, black);
  }
// animae things
void animateThings() {
  int i=0;
  while (i <mobs.size()) {
    Mob myMob = mobs.get(i);
    myMob.show();
    myMob.act();
    if (myMob.hp ==0) {
      mobs.remove(i);
    } else {
      i++;
    }
  }
  i = 0;
  while ( i < towers.size()) {
    Tower myTower = towers.get(i);
    println(myTower.cd);
    if (mobs.size() > 0 )myTower.act();
    myTower.show();
    i++;
  }
  i = 0;
  while ( i < bullets.size()) {
    Bullet myBullet = bullets.get(i);
    myBullet.act();
    myBullet.show();
    if (myBullet.hp == 0) {
      bullets.remove(i);
      i--;
    } i++;
  }
}
void ringsAct() {
  for (int i = 0; i < aoeRings.size(); i++) {
    exampleRing = aoeRings.get(i);
    exampleRing.show();
    if (exampleRing.hp <= 0) {
      aoeRings.remove(i);
      i--;
    }
  }
}
void handleButtonClicks() {

  if (nextWave.clicked && mobs.size() == 0) {
    nextWaves();
    wave ++;
     waveNumber = wave -=1;
  }
   if (buildMode.clicked && mobs.size() == 0){
     mode = BUILD;
   }
   if (back.clicked){
     mode = MAPSELECT;
   }
}

void nextWaves() {
 if (mobs.size() == 0) {
    wave++ ;
    for (int i = 0; i < wave; i++) {
      if (wave >= 4 && i == 3){
        mobs.add(new ChubbyMob(-i*50, 400, 1, 0));
      } else if (wave >= 7 && (i == 5|| i == 6)) mobs.add(new SpeedyMob(-i*50,400, 1, 0)); 
      else mobs.add(new Mob(-i*50,400, 1, 0));
    }
  }
}

  
