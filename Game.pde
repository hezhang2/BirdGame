//Helen Zhang, Painting with Shape, Block 8
//https://7fd46e5bb705df1d22d3b82177cca4230d977330.googledrive.com/host/0B24E0vgcnJ6PTTRzOEFUUDNQSUU/index.html

//block
int blockY=0;//fly 
int blockW=30;//wing 
int blockX=330;//position
//cloud
int cloudY=int(random(160));
int cloudX=500;
int cloudYA=int(random(160));
int cloudXA=795;
//start
boolean start=true;

void setup()
{
  size(500, 200);
  noStroke();
}

void draw()
{
  if (start==true)
  {
    theStart();
  } 

  if (start==false)
  {
    background(220, 240, 250); 

    block();
    cloud();
    monster();

    //pushed 
    if (
    blockX+30==cloudX 
      && blockY+15>cloudY
      && blockY+15<cloudY+40
      )
    {
      blockX=blockX-5;
    }
    if (
    blockX+30==cloudXA
      && blockY+15>cloudYA
      && blockY+15<cloudYA+40
      )
    {
      blockX=blockX-5;
    }
  }
}

void keyPressed()
{
  if (key=='w')
  {
    blockY=blockY-5;
    blockW=30;
  }

  if (key=='s')
  {
    blockY=blockY+5;
    blockW=-30;
  }
}

void block()
{
  fill(200);
  rect(blockX, blockY, 35, 25, 0, 15, 0, 0);
  triangle(blockX, blockY, blockX-30, blockY, blockX-30, blockW+blockY);
  triangle(blockX+35, blockY+25, blockX+45, blockY+20, blockX+35, blockY+10);
  fill(130, 140, 180);
  ellipse(blockX+23, blockY+10, 10, 10);

  if (blockX==-35)
  {
    start=true;
    blockX=330;
  }
}

void monster()
{
  fill(100);
  rect(0, 0, 32, 50);
  rect(0, 150, 32, 50);
  fill(200, 100, 100);
  ellipse(17, 35, 10, 10);
  fill(250);
  triangle(0, 50, 8, 60, 16, 50);
  triangle(16, 50, 24, 60, 32, 50);
  triangle(0, 150, 8, 140, 16, 150);
  triangle(16, 150, 24, 140, 32, 150);
}

void cloud()
{
  fill(250);
  rect(cloudX, cloudY, 85, 40, 15);
  cloudX=cloudX-5;
  if (cloudX<-85)
  {
    rect(cloudX, cloudY, 85, 40, 15);
    cloudX=500;
    cloudY=int(random(160));
  }

  rect(cloudXA, cloudYA, 85, 40, 15);
  cloudXA=cloudXA-5;
  if (cloudXA<-85)
  {
    rect(cloudXA, cloudYA, 85, 40, 15);
    cloudXA=500;
    cloudYA=int(random(160));
  }
}

void mousePressed()
{
  start=false;
}

void theStart()
{
  fill(220, 240, 250);
  rect(0, 0, 500, 200);
  textAlign(CENTER);
  fill(200);
  textSize(40);
  text("Click To Start", 250, 65);
  fill(150);
  textSize(18);
  text("The monster is trying to eat you", 250, 100);
  text("Don't bump into clouds", 250, 130);
  text("Use W to move up and S to move down", 250, 160);
}


