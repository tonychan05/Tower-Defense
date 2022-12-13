
void mapselect(){
  background( orange);
  fill(white);
  textSize(40);
  text("SELECT MAP", 500, 100, orange, ice);
  mapShow();
  buttonClicked();
  song.pause();
}
void mapShow(){
  map1.show();
  map2.show();
}
void buttonClicked(){
  if ( map1.clicked){
    mode = ICEPLAY;
   cash = 20;
  waveNumber = 0;
   
    
  }
  if (map2.clicked){
   
    mode = PLAY;
    cash = 20;
   waveNumber = 0;
  }
}
