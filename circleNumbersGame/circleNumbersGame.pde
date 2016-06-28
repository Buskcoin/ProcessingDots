int lx;
int ly;
int radius;
int lives=10;
int numberOfYellowCircles;
int numberOfGreenCircles;
float maxNumberOfCircles=2;
int start = millis();
float timeLimit = 10000; //ten seconds
float barLength;
int score = 0;


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
  if (lives > 0) {
    float timer = (millis() - start);
    noFill();
    rect(width/1.5, 10, barLength, 20);
    fill(255, 0, 0);
    rect(width/1.5, 10, timer*(barLength/timeLimit), 20);
    if (timer > timeLimit) {
      lives = 0;
      createDots();
    }
  }
}
void keyPressed() {
  startGame();
  //if points is greater than 0 call the create Dots method otherwise use the text method to draw game over
}

void startGame() {
  if (lives > 0) {
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
      lives--;
    }
    setupScreen();
  } else if (keyCode == LEFT) {
    if (numberOfGreenCircles < numberOfYellowCircles) {
      lives--;
    }
    setupScreen();
  } else {
    println("wrong Key");
  }

 score();
  maxNumberOfCircles++;
  timeLimit-=(timeLimit/20);
}


void score(){
  score+=10;
   fill(0, 0, 0);
  textSize(50);
  text(lives+"", width/2, 50);
  textSize(12);
  text("score: "+score,20,20);

}


void generateCircle(int side, int shift) {
  int rad = (int)random(40)+25;
  lx = (int)random(side - rad*4 )+shift+rad*2;
  ly = (int)random(height -rad*4)+rad*2;     
  ellipse(lx, ly, rad, rad );
  noFill();
}