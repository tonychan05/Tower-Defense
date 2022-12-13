//Mobs are the monsters that the towers defend against.
//Mobs spawn at the start and then move across the map,
//changing direction when they hit a node. If they get
//to the end of the map, they deal damage to the player.
//Once the player has no more health, it's game over!

class Mob {
  float x ,y, vx , vy, d;
  float hp , maxhp;
  int value;
  color fillColor, strokeColor;
  float speed;
  Mob(float _x, float _y, float _vx, float _vy){
    x = _x;
    y= _y;
    vx = _vx;
    vy= _vy;
     d = 35;
     hp= 3;
     speed =2.5;
     fillColor= blue;
     strokeColor = white;
  }
  void show(){
    stroke(strokeColor);
    strokeWeight(5);
    fill(fillColor);
    circle(x,y,d);
  }
  void act(){
    x = x+ vx*speed;
    y = y +vy*speed;
     
     int i =0;
     while(i <map1node.length){
       if(dist(map1node[i].x, map1node[i].y,x,y)<2){
       vx =  map1node[i].dx;
       vy = map1node[i].dy;
   
     }
     i++;
}
i = 0;
while (i < bullets.size()){
  Bullet myBullet = bullets.get(i);
  if ( dist(myBullet.x, myBullet.y, x,y)<d/2 + myBullet.d/2){
    hp--;
    myBullet.hp = 0;
  }
  i++;
}
 if (hp == 0) cash += 5;
damage();
  }
   void damage() {
    if (x > 800) { // If reached the end, lower lives + destroy mob
      lives = 0;
      hp = 0;
    }
  }
}
