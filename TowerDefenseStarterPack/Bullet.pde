//Some towers shoot bullets! If a mob is hit by a bullet,
//it does damage.
PImage bullet;
class Bullet {
   float x ,y, vx , vy,d;
   int hp;
   
  Bullet(float _x, float _y, float _vx, float _vy){
    x = _x;
    y= _y;
    vx = _vx;
    vy= _vy;
    d=15;
    hp = 1;
}
void show(){
  stroke(black);
  strokeWeight(2);
  fill(orange);
  circle(x , y ,d);
  
  
}
void act(){
  x += vx;
  y += vy;
 checkPos();
}
 void checkPos() {
    if (x < 0 || x > width || y < 0 || y > height) hp = 0;
  }
}
