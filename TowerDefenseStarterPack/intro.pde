//This function draws the INTRO screen.

void intro() {
 song.play();
  introAnimation.show();
  start.show();
  variableReset();
   textDisplay.show();
  if (start.clicked){
    mode = MAPSELECT;
  }
}
void variableReset(){
  lives = 1;
  cash = 20;
  waveNumber = 0;
  mobs = new ArrayList<Mob>();
   towers = new ArrayList<Tower>();
    aoeRings = new ArrayList<AoE_Ring>();
    bullets = new ArrayList<Bullet>();
}
 class headline{
  int x;
  int y;
  int w;
  int h;
  String text;
  color normal;
  
 headline(String t, int _x, int _y, int _w, int _h, color norm) {
   text = t ;
    normal = norm;
    x = _x;
    y=_y;
    w = _w;
    h = _h;
  } 
  void show(){
    drawText();
  }
  void drawText(){
    textAlign(CENTER);
    textFont(pixel);
    fill(normal);
    textSize(70);
    text(text, x ,y);
  }
}
