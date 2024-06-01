ArrayList<OwlPosition> owlPositions;
ArrayList<Line> lines;
ArrayList<CircleAnimation> circleAnimations;

void setup() {
size(800, 600);
owlPositions = new ArrayList<>();
lines = new ArrayList<>();
circleAnimations = new ArrayList<>();
}

void draw() {
background(255);

// Displaying lines between owls
for (Line line : lines) {
line.show();
}

// Drawing and showing each owl
for (OwlPosition owl : owlPositions) {
createOwl(owl.x, owl.y);
}

// Animating circles for owl removal
for (int i = circleAnimations.size() - 1; i >= 0; i--) {
CircleAnimation anim = circleAnimations.get(i);
anim.progress();
anim.show();
if (anim.isComplete()) {
circleAnimations.remove(i);
}
}
}

void mousePressed() {
// Add a new owl where clicked
OwlPosition owl = new OwlPosition(mouseX, mouseY);
owlPositions.add(owl);

// Connect new owl with existing owls
for (OwlPosition existingOwl : owlPositions) {
if (existingOwl != owl) {
Line newLine = new Line(owl, existingOwl);
lines.add(newLine);
}
}
}

void keyPressed() {
if (key == 'r') {
// Start circle animation for owl removal
if (owlPositions.size() > 1) {
CircleAnimation newAnim = new CircleAnimation(owlPositions);
circleAnimations.add(newAnim);
}
} else if (key == 's') {
// Increase speed of circle animation
for (CircleAnimation anim : circleAnimations) {
anim.increaseSpeed();
}
} else if (key == 'q') {
// Reset the screen
owlPositions.clear();
lines.clear();
circleAnimations.clear();
}
}

void createOwl(float x, float y) {
pushMatrix();
translate(x, y);
stroke(138, 138, 125);
strokeWeight(25);
line(0, -12.5, 0, -22.5);
noStroke();
fill(255);
ellipse(-6.25, -22.5, 12.5, 12.5);
ellipse(6.25, -22.5, 12.5, 12.5);
arc(0, -22.5, 25, 25, 0, PI);
fill(51, 51, 30);
ellipse(-5, -22.5, 2, 2);
ellipse(5, -22.5, 2, 2);
quad(0, -20.5, 1, -18, 0, -15.5, -1, -18);
popMatrix();
}

class OwlPosition {
float x, y;

OwlPosition(float x, float y) {
this.x = x;
this.y = y;
}
}

class Line {
OwlPosition start, end;

Line(OwlPosition start, OwlPosition end) {
this.start = start;
this.end = end;
}

void show() {
stroke(0);
strokeWeight(1);
line(start.x, start.y, end.x, end.y);
}
}

class CircleAnimation {
ArrayList<OwlPosition> owls;
int index;
float circleX, circleY;
float velocity;

CircleAnimation(ArrayList<OwlPosition> owls) {
this.owls = owls;
index = -1;
circleX = owls.get(0).x;
circleY = owls.get(0).y;
velocity = 3;
}

void progress() {
if (index < owls.size() - 1) {
float targetX = owls.get(index + 1).x;
float targetY = owls.get(index + 1).y;
float dx = targetX - circleX;
float dy = targetY - circleY;
float distance = sqrt(dx * dx + dy * dy);
if (distance > velocity) {
circleX += (dx / distance) * velocity;
circleY += (dy / distance) * velocity;
} else {
index++;
circleX = targetX;
circleY = targetY;
owls.remove(index);
index--;
}
}
}

void show() {
noStroke();
fill(80, 80, 80);
ellipse(circleX, circleY, 58, 58);
}

void increaseSpeed() {
velocity += 2;
}

boolean isComplete() {
return index == owls.size() - 1;
}
}
