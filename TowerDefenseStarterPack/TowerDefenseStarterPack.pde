import ddf.minim.*; 
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer song;
//Tower Defense Game
//Tony Tran
//Programming 12

// ================ GLOBAL VARIABLES =================

final int INTRO    = 0;
final int PLAY     = 1;
final int BUILD    = 2;
final int GAMEOVER = 3;
final int MAPSELECT = 4;
final int ICEPLAY = 5;
final int BUILD2 =6;
int mode;
float rotation = 0;
//Tower types
final int GUN =0;
final int AOE = 1;
final int SNIPER = 2;
// Tower costs
final int[] price = {5,25,50};
int cash = 20;
int lives = 1;
int waveNumbers = 0;
//Pallette
color white = #ffffff;
color black = #000000;
color red = #DE2B2B;
color yellow = #FCEC2B;
color green = #50BC1B;
color blue = #177EE8;
color orange = #E8A617;
color purple = #B017E8;
color ice = #92D8FA;
color special=#6EA3F7;
color grey = #817E7E;
//Mouse & Keyboard interaction variables
boolean mouseReleased;
boolean wasPressed;

//Buttons
Button start,nextWave, buildMode, playMode, buyGunTower,sniperMode, map1, map2, back, Aoe, gameover;

//Collections of objects
headline textDisplay;

Node[] map1node, map2node;
AoE_Ring exampleRing;
Tower exampleTower;
ArrayList<Mob> mobs;
ArrayList<Tower> towers;
ArrayList<Bullet> bullets;
ArrayList<AoE_Ring> aoeRings = new ArrayList<AoE_Ring>();
//Images and Gifs
Gif introAnimation;
PImage nextWaveIcon;
PImage mob;
PImage fire, Ice;
//Fonts
PFont pixel;
// levels
int waveNumber;

// ===================== SETUP =========================

void setup() {
  minim = new Minim(this);
  song = minim.loadFile("song.mp3");
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  size(1000, 800);
  initializeModes();
  initializeVariables();
  makeButtons();
  makeNodes();
  textDisplay();
  img = loadImage("bg.jpg");
  img2 = loadImage("map2.jpg");
  
}


void initializeModes() {
  //set up the default mode for things
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = INTRO;
}

void initializeVariables() {
  //Load Images & Gifs
introAnimation = new Gif ("gif/frame_0","_delay-0.1s.gif", 12, 4, width/2,height/2,width,height);
  nextWaveIcon = loadImage("icon.png");
  fire = loadImage("map2.jpg");
  Ice = loadImage("bg.jpg");
    
  //Load Fonts
pixel= createFont("pixel.ttf",30);
textFont (pixel);
  //Create Collections of Objects
  mobs = new ArrayList<Mob>();
  towers = new ArrayList<Tower>();
    bullets= new ArrayList<Bullet>();

}
 
void makeButtons() {
  //INTRO - Start
  start = new Button("START", 500, 500, 150, 60, orange, white);

  //PLAY - Next Wave, To Build Mode
   nextWave = new Button(nextWaveIcon,900,100,170,80, white, grey);
  //BUILD - To play mode, Buy Sniper, Buy Gun, Buy AoE
   playMode = new Button("PLAY", 900, 200, 170,80, white, black);
   buildMode= new Button("BUILD", 900, 200,170,80, white , black);
   buyGunTower = new Button ("GUN", 900,300, 170,80, white , black);
   sniperMode = new Button ("SNIPER" , 900, 400, 170, 80 , white , black);
   Aoe = new Button ("AOE",900, 500, 170, 80, white, black);
   //SELECT MAP
   map1 = new Button (Ice, 300, 400, 350,250, special, ice);
   map2 = new Button (fire , 700, 400, 350,250, red, orange);
   back = new Button (" MAPS" , 900, 300, 170,80,white, black);
  //GAMEOVER - Reset
  gameover = new Button("RESTART",500, 600, 190,80, red, orange);
}
void textDisplay(){
  textDisplay = new headline("Clash of Defense" ,500,400 ,50,100, white);
  
  
}

void makeNodes() {
  //Plot the nodes on the map
  map1node = new Node[8];
  map1node[0] = new Node(200,400,0,-1);
   map1node[1] = new Node(200,200,1,0);
    map1node[2] = new Node(400,200,0,1);
     map1node[3] = new Node(400,600,-1,0);
      map1node[4] = new Node(300,600,0,-1);
       map1node[5] = new Node(300,500,1,0);
        map1node[6] = new Node(500,500,0,-1);
         map1node[7] = new Node(500,400,1,0);
         
}


// ===================== DRAW ===========================

void draw() {

  click();
  if (mode == INTRO) {
    intro();
  } else if (mode == PLAY) {
    play();
  } else if (mode == BUILD) {
    build();
  } else if (mode == GAMEOVER) {
    gameOver();
  } else if ( mode == MAPSELECT){
    mapselect();
  } else if ( mode == ICEPLAY){
    play2();
  } else if ( mode == BUILD2){
    buildFire();
  }
  

}
