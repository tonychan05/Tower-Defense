//Some classes place AoE rings on the map. The AoE ring
//hurts all mobs in the ring. The ring only lasts for a 
//short period of time.

class AoE_Ring {
  boolean landed;
  int cd, hp;
  float initialx, initialy, x, y, tx, ty, xdist, ydist, xtotalDist, ytotalDist;
  float distProgress, xdistProgress;

  AoE_Ring (float X, float Y, float TX, float TY) {
    x = initialx = X;
    y = initialy = Y;
    tx = TX;
    ty = TY;
    hp = 1;
    
    xdist = xtotalDist = tx-x;
    ydist = ytotalDist = ty-y;
  }

  void show() {

    display();
    damage();
  }


  void display() {
    strokeWeight(distProgress * 5);
    stroke(255, 0, 0);
    fill(255, 0, 0, xdistProgress * 120);
    circle(x, y, 100 * xdistProgress);
  }
  
  void damage() {
    
    if (mobs.size() != 0) {
      for (int i = 0; i < mobs.size(); i++) {
        Mob myMob = mobs.get(i);
        if (dist(myMob.x, myMob.y, x, y) < 50 && cd % 100 == 0) {
          myMob.hp -= ceil(xdistProgress);
        } else cd++;
      }
    } else {
      cd++;
    }
    
    if (cd == 300) hp = 0; 
  }
  
}
