import java.awt.Robot;
Robot rbt;

PImage Map;
PImage BirchPlanks;
PImage BirchLogSide;
PImage Sand;
PImage CutSandstone;
PImage SmoothStone;
PImage StrippedAcaciaLog;
PImage diamond;
PImage Glass;
PImage Gold;
PImage SpruceLog;
PImage Glowstone;
PImage Andesite;
PImage Stone;
PImage Cobblestone;

color White = #FFFFFF;

float RotateX = 0;
float RotateY = 0;

int StartPosition = -2000;
int EndPosition = 2000;
int GridSize = 100;
int GridHeight = 800;

float LeftRightRotate = 3*PI/2;
float UpDownRotate = 0;

float EyeX = width/2;
float EyeY = height/2;
float EyeZ = height/2;
float FocusX = EyeX;
float FocusY = EyeY;
float FocusZ = EyeZ;
float UpX = 0;
float UpY = 1;
float UpZ= 0;

int GridSizeBlocks = 100;

boolean KeyW = false;
boolean KeyS = false;
boolean KeyA = false;
boolean KeyD = false;
boolean MovementUpDown = true;
boolean CanMoveForward = true;


void setup() {
  //size(displayWidth,displayHeight,P3D);
  fullScreen(P3D);
  //size(1440,800,P3D);
  //noCursor();
  //if (frameCount <= 1) rbt.mouseMove(width/2,height/2);

  Map = loadImage("map.png");
  BirchPlanks = loadImage("BirchPlanks.png");
  BirchLogSide = loadImage("BirchLogSide.png");
  Sand = loadImage("Sand.png");
  CutSandstone = loadImage("CutSandstone.png");
  SmoothStone = loadImage("SmoothStone.png");
  StrippedAcaciaLog = loadImage("StrippedAcaciaLog.png");
  diamond = loadImage("diamond.png");
  Glass = loadImage("Glass.png");
  Gold = loadImage("Gold.png");
  SpruceLog = loadImage("SpruceLog.png");
  Glowstone = loadImage("Glowstone.png");
  Andesite = loadImage("Andesite.png");
  Stone = loadImage("Stone.png");
  Cobblestone = loadImage("Cobblestone.png");
  textureMode(NORMAL);

  try {
    rbt = new Robot();
  }
  catch (Exception e) {
    e.printStackTrace();
  }
}
//===================================================================================================
 
void draw() {
  lights();
  background(10);
  
  camera(EyeX, EyeY, EyeZ, FocusX, FocusY, FocusZ, UpX, UpY, UpZ);
  pointLight(255,255,255,0,100,0); 
  //pointLight(255,255,255,0,0,0);   
  //directionalLight(255,255,255, FocusX, FocusY, FocusZ); 
  //ambientLight(255,255,255);
  
  stroke(255, 0, 0);
  strokeWeight(6);
  line(0, 0, 0, 0, -height*4, 0);// X Y Z 
  line(0, 0, 0, 400, 0, 0);
  
  //stroke(0,0,255);
  //line(0,height/2,0, 800,height/2,0);
  //stroke(255,0,0);
  //line(0,-height,0, 800,-height,0);

  //line(FocusX,FocusY-5,FocusZ, FocusX+0,FocusY+5,FocusZ);
  //line(FocusX-5,FocusY,FocusZ, FocusX+5,FocusY,FocusZ);

  DrawMap();

  DrawFloor(-4000, 4000, 100, -GridSize*10, #00FFFF); // Ceiling
  //DrawFloor(-4000, 4000, 100, 0, #FFFF00); // Floor

  Movement();
  
  //textAlign(CORNER,CORNER);
  //fill(#00B474);
  //textSize(18);
  //text("fps:",10,23);
  //text(frameRate,40,24);

  //println(UpDownRotate);
  //println(EyeY);
  //println(height);
}
//===================================================================================================
void DrawMap() {
  for (int x = 0; x < Map.width; x++) {
    for (int y = 0; y < Map.height; y++) {
      color C = Map.get(x, y);
      if (C == #FFFFFF || C == #B83DBA || C == #733909 || C == #00A8F3 || C == #FFF200 || C == #0ED145 || C == #3F48CC){// Floor
        //translate(-6000, 6000, 100);
        //TexturedBlocks(x*GridSize-3000, 200-GridSize, y*GridSize-3000, BirchPlanks,GridSize);
        //TexturedBlocks(x*GridSize-3000, 200-2*GridSize, y*GridSize-3000, BirchPlanks,GridSize);
        //TexturedBlocks(x*GridSize-3000, 200-3*GridSize, y*GridSize-3000, BirchPlanks,GridSize)
        //DrawFloor(-4000, 4000, 100, -GridSize*6, #00FFFF);    
        if (x%2 == 0) {
          TexturedBlocks(x*GridSize-4000, 200, y*GridSize-4000, BirchPlanks, GridSize, false);// BrichPlank Floor
        } 
        else if (x%2 == 1) {
          TexturedBlocks(x*GridSize-4000, 200, y*GridSize-4000, BirchLogSide, GridSize, false);// BirchLog Floor
        }
      }      
      if (C == #FFFFFF || C == #B83DBA || C == #733909 || C == #00A8F3 || C == #FFF200 || C == #0ED145){// Ceiling
        TexturedBlocks(x*GridSize-4000, 200-100*6, y*GridSize-4000, SmoothStone, GridSize, false);
      }
      if (C == #000000) {
        TexturedBlocks(x*GridSize-4000, 200, y*GridSize-4000, Sand, GridSize, false);// Sand Outside
      }
      for (int i = 0; i < 6; i++){
        if (C == #B83DBA) {// Outside Wall
          TexturedBlocks(x*GridSize-4000, 200-100*i, y*GridSize-4000, CutSandstone, GridSize, true);                    
        }
        if (C == #733909) {
          TexturedBlocks(x*GridSize-4000, 200-100*i, y*GridSize-4000, StrippedAcaciaLog, GridSize, false);
        }
        if (C == #00A8F3){// Glass
          TexturedBlocks(x*GridSize-4000, 100-100*i, y*GridSize-4000, Glass, GridSize, false);  
        }
        if (C == #FFF200){// Gold
          TexturedBlocks(x*GridSize-4000, 100-100*i, y*GridSize-4000, Gold, GridSize, false);  
        }
        if (C == #0ED145){// Spruce
          TexturedBlocks(x*GridSize-4000, 100-100*i, y*GridSize-4000, SpruceLog, GridSize, false);
        }
      }
      if (C == #3F48CC){// Ceiling Glowstone Glass
        TexturedBlocks(x*GridSize-4000, 200-100*7, y*GridSize-4000, Glowstone, GridSize, false);
      }
    }
  }
}
//===================================================================================================

void Movement() {
  if (KeyW && CanMoveForward()) {
    EyeX += cos(LeftRightRotate)*30;// Plus
    EyeZ += sin(LeftRightRotate)*30; 
    if (MovementUpDown){
      EyeY+=16;
      if (EyeY >= 80) MovementUpDown = false;
    }
    else{
      EyeY-=16;
      if (EyeY <= 0) MovementUpDown = true;
    }
  }
  
  if (KeyA && CanMoveLeft()) {
    EyeX += cos(LeftRightRotate - PI/2)*30;// Minus 90
    EyeZ += sin(LeftRightRotate - PI/2)*30;
  }
  
  if (KeyS && CanMoveBackward()) {
    EyeX -= cos(LeftRightRotate)*30;// Minus
    EyeZ -= sin(LeftRightRotate)*30; 
    if (MovementUpDown){
      EyeY+=16;
      if (EyeY >= 80) MovementUpDown = false;
    }
    else{
      EyeY-=16;
      if (EyeY <= 0) MovementUpDown = true;
    }
  }

  if (KeyD && CanMoveRight()) {
    EyeX += cos(LeftRightRotate + PI/2)*30;// Add 90
    EyeZ += sin(LeftRightRotate + PI/2)*30;
  } 
  //FocusX = EyeX;
  //FocusY = EyeY;
  //FocusZ = EyeZ-100;

  FocusX = EyeX + cos(LeftRightRotate)*300;
  FocusY = EyeY + tan(UpDownRotate)*300;
  FocusZ = EyeZ + sin(LeftRightRotate)*300;

  LeftRightRotate = LeftRightRotate + (mouseX - pmouseX)*0.006;
  UpDownRotate = UpDownRotate + (mouseY - pmouseY)*0.006;

  if (UpDownRotate < -PI/2) {
    UpDownRotate = -PI/2+0.001;
  }
  if (UpDownRotate > PI/2) {
    UpDownRotate = PI/2-0.001;
  }


  if (mouseX > width-2) rbt.mouseMove(1, mouseY);

  if (mouseX < 1) rbt.mouseMove(width-2, mouseY);

  if (mouseY > height-1) rbt.mouseMove(mouseX, height-1);

  if (mouseY < 1) rbt.mouseMove(mouseX, 1);
  
}
//===================================================================================================
boolean CanMoveForward(){
  float ForwardX = EyeX + cos(LeftRightRotate)*150;
  float ForwardY = EyeY;
  float ForwardZ = EyeZ + sin(LeftRightRotate)*150;
  int MapX;
  int MapY;
  
  MapX = (int) (ForwardX+4000)/ GridSize;
  MapY = (int) (ForwardZ+4000)/ GridSize;
  
  if (Map.get(MapX,MapY) == #FFFFFF || Map.get(MapX,MapY) == #3F48CC || Map.get(MapX,MapY) == #000000){
    return true;
  }
  else {
    return false;
  }

}
//===================================================================================================
boolean CanMoveBackward(){
  float ForwardX = EyeX + cos(LeftRightRotate + PI)*150;
  float ForwardY = EyeY;
  float ForwardZ = EyeZ + sin(LeftRightRotate + PI)*150;
  int MapX;
  int MapY;
  
  MapX = (int) (ForwardX+4000)/ GridSize;
  MapY = (int) (ForwardZ+4000)/ GridSize;
  
  if (Map.get(MapX,MapY) == #FFFFFF || Map.get(MapX,MapY) == #3F48CC || Map.get(MapX,MapY) == #000000){
    return true;
  }
  else {
    return false;
  }

}
//===================================================================================================
boolean CanMoveLeft(){
  float ForwardX = EyeX + cos(LeftRightRotate - PI/2)*150;
  float ForwardY = EyeY;
  float ForwardZ = EyeZ + sin(LeftRightRotate - PI/2)*150;
  int MapX;
  int MapY;
  
  MapX = (int) (ForwardX+4000)/ GridSize;
  MapY = (int) (ForwardZ+4000)/ GridSize;
  
  if (Map.get(MapX,MapY) == #FFFFFF || Map.get(MapX,MapY) == #3F48CC || Map.get(MapX,MapY) == #000000){
    return true;
  }
  else {
    return false;
  }

}
//===================================================================================================
boolean CanMoveRight(){
  float ForwardX = EyeX + cos(LeftRightRotate + PI/2)*150;
  float ForwardY = EyeY;
  float ForwardZ = EyeZ + sin(LeftRightRotate + PI/2)*150;
  int MapX;
  int MapY;
  
  MapX = (int) (ForwardX+4000)/ GridSize;
  MapY = (int) (ForwardZ+4000)/ GridSize;
  
  if (Map.get(MapX,MapY) == #FFFFFF || Map.get(MapX,MapY) == #3F48CC || Map.get(MapX,MapY) == #000000){
    return true;
  }
  else {
    return false;
  }

}
//===================================================================================================
void DrawFloor(int StartPosition, int EndPosition, int GridSize, int GridHeight, int Stroke) {
  pushMatrix();
  translate(0, 200);
  rotate(RotateX);
  rotate(RotateY);
  strokeWeight(1);

  //for (int LineVar = StartPosition; LineVar <= 4000; LineVar+= GridSize) {
    int x = StartPosition;
    int z = StartPosition;
    while (z < EndPosition){
      TexturedBlocks(x, GridHeight, z, diamond, GridSize, false);
      x += GridSize;
      if (x >= EndPosition){
        z += GridSize;
        x = StartPosition;       
      }
    }
    //stroke(Stroke);
    //line(LineVar, GridHeight, StartPosition, LineVar, GridHeight, EndPosition);
    //line(StartPosition, GridHeight, LineVar, EndPosition, GridHeight, LineVar);
  //}

  popMatrix();
}

//===================================================================================================

//void mouseDragged(){
//  RotateY = RotateY + (pmouseY - mouseY)*0.01;
//  RotateX = RotateX + (pmouseX - mouseX)*-0.01;

//}
//===================================================================================================

void keyPressed() {
  if (key == 'w' || key == 'W') KeyW = true;
  if (key == 'a' || key == 'A') KeyA = true;
  if (key == 's' || key == 'S') KeyS = true;
  if (key == 'd' || key == 'D') KeyD = true;
}
//===================================================================================================

void keyReleased() {
  if (key == 'w' || key == 'W') KeyW = false;
  if (key == 'a' || key == 'A') KeyA = false;
  if (key == 's' || key == 'S') KeyS = false;
  if (key == 'd' || key == 'D') KeyD = false;
}
