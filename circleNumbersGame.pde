int lx;
int ly;
int radius;
int points=10;
int numberOfYellowCircles;
int numberOfGreenCircles;
float maxNumberOfCircles=5;

void setup(){
  //set the size of your canvas
  size(800,700);
  
  //create a method called reset
  resets();
  createDotsOnKeyPress(); 
}
void draw(){
}

void keyPressed() {
  
  //if points is greater than 0 call the create Dots method otherwise use the text method to draw game over
  if(points > 0){
       createDotsOnKeyPress();   
  } else {
    fill(255,25,25);
  textSize(50);
text("Game Over", width/3,height/2);
  }
}

void resets(){
  fill(255,255,255);
  rect(0, 0, width/2, height);
  rect(width/2, 0, width/2, height);
  numberOfYellowCircles = (int)random(maxNumberOfCircles);
  numberOfGreenCircles = (int)random(maxNumberOfCircles);
  for(int i = 0; i<numberOfGreenCircles; i++){
    fill(0,250,0,150);
    drawCircles(width/2, 0);
  }
  for(int i = 0; i < numberOfYellowCircles; i++){
      fill(250,250,0,150);
    drawCircles(width/2, width/2);
}
}

void createDotsOnKeyPress(){
if (keyCode == RIGHT) {
      
      if(numberOfGreenCircles > numberOfYellowCircles){
        points--;
        
      }
      resets();
    } else if (keyCode == LEFT) {
      if(numberOfGreenCircles < numberOfYellowCircles){
        points--;
      }
       resets();
    } else{
    println("worng Key");  
  }
  println("number of yellow cirlcle: " + numberOfYellowCircles);
    println("number of green cirlcle: " + numberOfGreenCircles);
  fill(0,0,0);
  textSize(50);
  text(points+"", width/2,50);
  maxNumberOfCircles++;
}




void drawCircles(int side, int shift){
      int rad = (int)random(50)+5;
      lx = (int)random(side - rad*4 )+shift+rad*2;
      ly = (int)random(height -rad*4)+rad*2;     
      ellipse(lx, ly, rad,rad );
      noFill();
}