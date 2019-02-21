private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
Star galaxy[] = new Star[200];
public void setup() 
{  
  for(int i = 0; i < galaxy.length; i++){
    galaxy[i] = new Star();
  }
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	background(0);   
  for(int i = 0; i < galaxy.length; i++){
    galaxy[i].show();
  }
	stroke(255,193,223);
	line(320,480,320,380);   
	drawBranches(320,380,100,3*Math.PI/2);  
  textSize(25);
  text(":>", 580, 400);
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  branchLength = branchLength*fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1)+y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2)+y );
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2); 
  if(branchLength > smallestBranch){
    drawBranches(endX1, endY1, branchLength - 1, angle1 - 50);
    drawBranches(endX2, endY2, branchLength - 1, angle2 + 50);
  }
} 

class Star //note that this class does NOT extend Floater
{
  private double myX, myY;
  private int myColor, size;
  public Star(){
    myX = Math.random()*640;
    myY = Math.random()*480;
    myColor = color(255);
    size = (int)((Math.random()*5)+2);
  }
  public void show()
  {
    noStroke();
    fill(myColor);
    ellipse((float)myX, (float)myY, size, size);
  }
}
