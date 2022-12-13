//This function draws the GAMEOVER screen.


void gameOver() {
  handleClick();
  background(0);
  fill(white);
  textSize(80);
  text("GAME OVER", 500, 250);
  fill(orange);
  textSize(35);
  text(" Total Cash Earned" + cash , 500, 400);
  text(" Total Waves" + wave, 500, 500);
  gameover.show();
  
  
}
void handleClick(){
   
  if(gameover.clicked) {
  mode = INTRO;

  }
}
