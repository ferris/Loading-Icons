float r;

// Angle and angular velocity, accleration
float theta;
float theta_vel;
float theta_acc;
float hdiff;
float t = 0;

void setup() {
  size(400, 400);
  
  // Initialize all values
  r = 26;
  theta = PI/2;
  theta_vel = 2.0/100;
  theta_acc = 0;
  hdiff = 0;
}

void draw() {
  background(0);
  text("dyad", 10, 20);
  
  // Translate the origin point to the center of the screen
  translate(width/2, height/2);
  
  hdiff = 50*sin(t/8);

  // Convert polar to cartesian
  float x1 = r * cos(theta) - hdiff * cos(theta + PI/2);
  float y1 = r * sin(theta) - hdiff * sin(theta + PI/2);

  float x2 = -r * cos(theta) + hdiff * cos(theta + PI/2);
  float y2 = -r * sin(theta) + hdiff * sin(theta + PI/2);
  
  // Draw the ellipse at the cartesian coordinate

  ellipseMode(CENTER);
  noStroke();
  fill(255, 0, 85);
  ellipse(x1, y1, 50, 50);
  fill(255);
  ellipse(x2, y2, 50, 50);

  // Apply acceleration and velocity to angle (r remains static in this example)
  theta_vel += theta_acc;
  theta += theta_vel;
  t += 1;
}