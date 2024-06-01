float lineLength = 40;
boolean isResizing = false;

void setup() {
  size(200, 200);
  strokeWeight(8);
}

void draw() {
  background(204);
  float angle = map(mouseX, 0, width, 0, TWO_PI);
  translate(50, 50);
  rotate(angle);
  line(0, 0, lineLength, 0);
}

void mousePressed() {
  // Periksa apakah mouse berada di dekat ujung garis
  float d = dist(mouseX, mouseY, 50, 50);
  if (d < lineLength / 2) {
    isResizing = true;
  }
}

void mouseReleased() {
  isResizing = false;
}

void mouseDragged() {
  if (isResizing) {
    // Jika mouse ditekan dan sedang digerakkan, ubah panjang garis sesuai dengan perubahan posisi mouse
    lineLength = dist(mouseX, mouseY, 50, 50) * 2;
    strokeWeight(lineLength / 20); // Sesuaikan berat garis dengan panjang garis
  }
}
