//Nodes are invisible objects that we place on the map
//to direct the flow of mobs. When a mob collides with
//a node object, it will change direction according to 
//the node's instructions. 

class Node {
  float x,y,dx,dy;
  Node(float _x, float _y, float _dx, float _dy){
    x = _x;
    y= _y;
    dx= _dx;
    dy = _dy;
}
void show(){
  node2();
}
  void node1(){
  fill(blue);
  stroke(blue);
  circle(x,y,10);
  line(x,y,x+dx*15, y+dy*15);
  }
  void node2(){
  fill(red);
  stroke(red);
  circle(x,y,10);
  line(x,y,x+dx*15, y+dy*15);
  }
  
}
