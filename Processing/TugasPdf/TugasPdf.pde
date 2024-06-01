import processing.sound.*;
import processing.pdf.*;

AudioIn mic;
Amplitude amp;
PGraphicsPDF pdf;  // Buat record pdf

void setup() {
  size(440, 440);
  background(0);

  // Audio setup
  mic = new AudioIn(this, 0);
  mic.start();
  amp = new Amplitude(this);
  amp.input(mic);

  int randomNum = int(random(100000)); // Nomor random buat nama file pdf yang digenerate
  String filename = "visualizer-" + randomNum + ".pdf";
  pdf = (PGraphicsPDF)beginRecord(PDF, filename);
}

void draw() {
  noStroke();
  fill(26, 76, 102, 10);
  rect(0, 0, width, height);

  float waveHeight = map(amp.analyze(), 0, 1, 0, height/2);

  // Ngegambar gelombangnya
  stroke(255);
  noFill();
  beginShape();
  for (int x = 0; x <= width; x += 10) {
    float y = height/2 + sin(map(x, 0, width, 0, TWO_PI)) * waveHeight;
    vertex(x, y);
  }
  endShape();

  if (keyPressed && (key == 's' || key == 'S')) {
    endRecord(); 
    println("Visualizer saved to visualizer.pdf");
    exit(); // Exit program
  }
}
