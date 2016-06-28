int lx;
int ly;
int radius;
int points=10;
int numberOfYellowCircles;
int numberOfGreenCircles;
float maxNumberOfCircles=5;
int start = millis();
float timeLimit = 10000; //ten seconds
float barLength;


void setup() {
  //set the size of your canvas
  size(800, 700);

  //create a method called reset
  setupScreen();
  barLength = 250;
  //call the createDots() method
  createDots();
}

void draw() {
  if (points > 0) {
    float timer = (millis() - start);
    noFill();
    rect(width/1.5, 30, barLength, 20);
    fill(255, 0, 0);
    rect(width/1.5, 30, timer*(barLength/timeLimit), 20);
    if (timer > timeLimit) {
      points = 0;
      createDots();
    }
  }
}
void keyPressed() {
  startGame();
  //if points is greater than 0 call the create Dots method otherwise use the text method to draw game over
}

void startGame() {
  if (points > 0) {
    createDots();
  } else {
    fill(255, 25, 25);
    textSize(50);
    text("Game Over", width/3, height/2);
  }
}

void setupScreen() {
  start = millis();
  fill(255, 255, 255);
  rect(0, 0, width/2, height);
  rect(width/2, 0, width/2, height);
  drawCircles();
}

void drawCircles(){
  numberOfYellowCircles = (int)random(maxNumberOfCircles)+1;
  numberOfGreenCircles = (int)random(maxNumberOfCircles)+1;
  for (int i = 0; i<numberOfGreenCircles; i++) {
    fill(0, 250, 0, 150);
    generateCircle(width/2, 0);
  }
  for (int i = 0; i < numberOfYellowCircles; i++) {
    fill(250, 250, 0, 150);
    generateCircle(width/2, width/2);
  }
}

void createDots() {
  if (keyCode == RIGHT) {

    if (numberOfGreenCircles > numberOfYellowCircles) {
      points--;
    }
    setupScreen();
  } else if (keyCode == LEFT) {
    if (numberOfGreenCircles < numberOfYellowCircles) {
      points--;
    }
    setupScreen();
  } else {
    println("wrong Key");
  }

 
  maxNumberOfCircles++;
  timeLimit-=(timeLimit/20);
}


void score(){
   fill(0, 0, 0);
  textSize(50);
  text(points+"", width/2, 50);

}


void generateCircle(int side, int shift) {
  int rad = (int)random(50)+5;
  lx = (int)random(side - rad*4 )+shift+rad*2;
  ly = (int)random(height -rad*4)+rad*2;     
  ellipse(lx, ly, rad, rad );
  noFill();
}