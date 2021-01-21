
void TexturedBlocks(float X, float Y, float Z, PImage Texture, int Size, boolean WallTetxure){// Same Texture All Sides
  pushMatrix();
    translate(X, Y, Z);
    scale(Size);
    //rotateX(RotateX);
    //rotateY(RotateY);
    noStroke();
    
    
    beginShape(QUADS);
      //if (WallTetxure){
      //  int B = (int) random(0,2);
      //  if (B == 0){
      //    texture(Stone);
      //  }
      //  else if (B == 1){
      //    texture(Cobblestone);
      //  }
      //  else {
      //    texture(Andesite);
      //  }
      //}
      //else {
        texture(Texture);
      //}
      //     X,Y,Z, tX,tY
      vertex(0,0,0, 0,0);// Top
      vertex(1,0,0, 1,0);
      vertex(1,0,1, 1,1);
      vertex(0,0,1, 0,1);

      vertex(0,1,0, 0,0);// Bottom
      vertex(1,1,0, 1,0);
      vertex(1,1,1, 1,1);
      vertex(0,1,1, 0,1);
    
      vertex(0,0,1, 0,0);// Front
      vertex(1,0,1, 1,0);
      vertex(1,1,1, 1,1);
      vertex(0,1,1, 0,1);
        
      vertex(0,0,0, 0,0);// Back
      vertex(1,0,0, 1,0);
      vertex(1,1,0, 1,1);
      vertex(0,1,0, 0,1);
        
      vertex(0,0,0, 0,0);// Left
      vertex(0,0,1, 1,0);
      vertex(0,1,1, 1,1);
      vertex(0,1,0, 0,1);
        
      vertex(1,0,1, 0,0);// Right 
      vertex(1,0,0, 1,0);
      vertex(1,1,0, 1,1);
      vertex(1,1,1, 0,1);   
    endShape();
    
    
  popMatrix();
}

//===================================================================================================

void TexturedBlocks(float X, float Y, float Z, PImage Top, PImage Sides, PImage Bottom, PImage Front, int Size){
  
  
  pushMatrix();
    translate(X, Y, Z);
    scale(Size);
    //rotateX(RotateX);
    //rotateY(RotateY);
    noStroke();
    
    beginShape(QUADS);
      texture(Top);
      //     X,Y,Z, tX,tY
      vertex(0,0,0, 0,0);// Top
      vertex(1,0,0, 1,0);
      vertex(1,0,1, 1,1);
      vertex(0,0,1, 0,1);
    endShape();
    
    beginShape(QUADS); 
      texture(Bottom);
      vertex(0,1,0, 0,0);// Bottom
      vertex(1,1,0, 1,0);
      vertex(1,1,1, 1,1);
      vertex(0,1,1, 0,1);
    endShape();
    
    beginShape(QUADS); 
      texture(Front);
      vertex(0,0,1, 0,0);// Front
      vertex(1,0,1, 1,0);
      vertex(1,1,1, 1,1);
      vertex(0,1,1, 0,1);
    endShape();
    
    beginShape(QUADS); 
      texture(Sides);
      vertex(0,0,0, 0,0);// Back
      vertex(1,0,0, 1,0);
      vertex(1,1,0, 1,1);
      vertex(0,1,0, 0,1);
        
      vertex(0,0,0, 0,0);// Left
      vertex(0,0,1, 1,0);
      vertex(0,1,1, 1,1);
      vertex(0,1,0, 0,1);
        
      vertex(1,0,1, 0,0);// Right 
      vertex(1,0,0, 1,0);
      vertex(1,1,0, 1,1);
      vertex(1,1,1, 0,1);   
    endShape();
       
  popMatrix();
}
