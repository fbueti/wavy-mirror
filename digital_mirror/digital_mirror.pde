
import processing.video.*; 
Capture camera;

void setup() {
  size(1280, 720);
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    exit();
  } 
  camera = new Capture(this, cameras[0]);
  camera.start();
    
}

void draw() {
  if (camera.available()) {
    background(0);
    camera.read();
    image(camera, 0,0);
    camera.loadPixels(); 
    loadPixels();
    
    for (int j=0; j<1030; j+=50){
      for (int i=0; i<450; i+=50){
        transpose(round(random(j,j+50)), round(random(i,i+50)), 200, 240, mouseX/42);
        updatePixels();
      }
    }
    
}
}

void transpose(int offsetX, int offsetY, int w, int h, int from){
    for(int j=offsetY; j<h+offsetY; j++){
      for(int i=offsetX; i<w+offsetX; i++){
        pixels[i+width*j] = pixels[i+from+width*j];
      }
    }
}