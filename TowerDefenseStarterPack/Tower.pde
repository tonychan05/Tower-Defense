//A Tower is the player's main defense against the mobs.
//Towers are placed on the maps and then automatically
//act. There are 3 kinds of towers (but you can make more!)

//Gun Tower: These towers shoot bullets that fly across
//           the screen and do damage to mobs.

//AoE Tower: These towers place AoE_Rings that deal damage
//           to all mobs in the ring.

//Sniper Tower: These towers automatically target the first
//              mob no matter where they are on the scren.
PImage guntower;
PImage sniperTower;

class towerImg {
  float x;
  float y;
  int w;
  int h;
  towerImg( PImage img, float _x, float _y, int _w, int _h) {
    x = _x;
    y= _y;
    w= _w;
    h = _h;
    guntower = img;
  }
}

class Tower {
  final int PLACING = 0;
  final int PLACED = 1;
  float x, y ;
  int cd, threshold;
  int towerMode;
  int towerType;

  Tower(int type) {
    x = mouseX;
    y = mouseY;
    cd = 0;
    towerMode = PLACING;
    towerType = type;
    if (towerType == GUN) threshold = 30;
    if ( towerType == AOE) threshold = 30;
    if (towerType == SNIPER) threshold = 90;
  }

  void show() {
    if (towerMode == PLACING) {
      x = mouseX;
      y = mouseY;
      if (mousePressed && mouseX <790) {
        towerMode = PLACED;
      }
    }
    if (towerType == GUN) gunShow();
    if (towerType == SNIPER) sniperDisplay();
    if (towerType == AOE) aoeTower();
  }

  void gunShow() {
    guntower = loadImage("canon.png");
    if ( towerMode == PLACED) {
      image(guntower, x, y, 80, 80);
    } else if (towerMode == PLACING) {
      image(guntower, mouseX, mouseY, 80, 80);
      
     if (mouseReleased && boundingBox(width/2, 325, width, 650) && towerMode == PLACING && globalCD > 10 && globalCD2 > 10 && cash >= 10) {
      cd = 0;
        towerMode = PLACED;
         cash -= 10;
        x = mouseX;
        y = mouseY;
      }
    }
  }
  void act() {
      if (towerType == GUN)
        gunAct();
      if (towerType == SNIPER)
        sniperShoot();
       if (towerType == AOE)
       aoeShoot();
  }
  void gunAct() {
     if (mobs.size() != 0) {
      cd++;
      if (cd == threshold) {
        cd = 0;
    bullets.add(new Bullet(x, y, 0, -10));
    bullets.add(new Bullet(x, y, 0, 10));
    bullets.add(new Bullet(x, y, -10, 0));
    bullets.add(new Bullet(x, y, 10, 0));
      }
     }else cd = 0;
  }
  
void sniperShoot() {
    if (mobs.size() != 0) {
      cd++;
      stroke(255*cd/threshold, 0, 0, 255*cd/threshold);
      strokeWeight(3*cd/threshold);
      line(x, y, mobs.get(0).x, mobs.get(0).y);

      if (cd == threshold) {
        mobs.get(0).hp -= 1;
        cd = 0;
      }
    } else cd = 0;
  }
  
  void sniperDisplay() {
     stroke(0);
    strokeWeight(3);
    
    sniperTower = loadImage("sniper.png");
    if (towerMode == PLACED) {
      image(sniperTower,x,y, 80,80);
    } else if (towerMode == PLACING) {
     image(sniperTower,x,y,80,80);
    }

    if (mouseReleased && mouseY < 650 && towerMode == PLACING && globalCD > 10 && globalCD2 >10 && cash >= 15) {
      cd = 0;
     
      towerMode = PLACED;
       cash -= 15;
      x = mouseX;
      y = mouseY;
    }
  }
  void aoeTower() {
    fill(red);
    stroke(black);
    strokeWeight(4);
    if (towerMode == PLACED) circle(x, y, 50);
    else if (towerMode == PLACING) circle(mouseX, mouseY, 50);

    if (mouseReleased && boundingBox(width/2, 325, width, 650) && towerMode == PLACING && globalCD > 10 && globalCD2 > 10 && cash >= 30) {
      cd = 0;
      towerMode = PLACED;
      x = mouseX;
      y = mouseY;
    }
  }
  
  void aoeShoot() {
    if (mobs.size() != 0) {
      cd++;
      if (cd == threshold) {
        int ex = floor(random(mobs.size()));
        Mob myMob = mobs.get(ex);
        aoeRings.add(new AoE_Ring(x, y, myMob.x, myMob.y));
        cd = 0;
      }
    } else cd = 0;
  }

  
}
  
