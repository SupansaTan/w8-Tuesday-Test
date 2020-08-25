color blue = color(20, 80, 255);
color pink = color(255, 100, 150);
color orange = color(255, 150, 80);
color white = color(255);

color[] colors = {blue, pink, orange};

float sum;
boolean check;
Ball[] balls;
Ball[] deleteBall;

class Ball {
  float position_x, position_y;
  int size;
  int shade;
  
  Ball(float tempx, float tempy, int tempSize, int tempColor) {
    position_x = tempx;
    position_y = tempy;
    size = tempSize;
    shade = tempColor;
  }

  void draw() {
    fill(colors[shade]);
    ellipse(position_x, position_y, size, size);
  }

  float getArea() {
    float area = 22/7 * (size/2) * (size/2);
    return area;
  }
  
  void undoClick(){
    for(int i=0; i < deleteBall.length; i++){
      int index = balls.length;
      balls[index] = deleteBall[i];
    }
  }
}

void setup() {
  size(400, 400);
  
  balls = new Ball[int(random(10))];
  deleteBall = new Ball[balls.length];
  
  for (int j = 0; j < balls.length; j++) {
    int tempColor = int(random(colors.length));
    balls[j] = new Ball(int(random(width/2)), int(random(height/2)), int(random(20,100)), tempColor);
  }
}

void draw() {
  delay(100);
  for (Ball ball : balls) {
    ball.draw();
  }
  
  // add button for undo
  fill(white);
  rect(180,320,80,30);
  fill(0);
  text("Undo",210,340);
}

void mouseClicked() {
  Ball[] lsball1;
  Ball[] lsball2;
  check = true;
  
  for (int i = balls.length-1; i>=0; i--) {
    float distance_ball = dist(mouseX, mouseY, balls[i].position_x, balls[i].position_y);
    if (distance_ball < (balls[i].size)/2) {
      sum -= balls[i].getArea();
      deleteBall[i] = balls[i];  //store balls that clicked in array deleteBall
      lsball1 = (Ball[])subset(balls,0,i);
      lsball2 = (Ball[])subset(balls,i+1);
      balls =  (Ball[])concat(lsball1,lsball2);
      
      check = false;
      break;
    }
  }
  
}
