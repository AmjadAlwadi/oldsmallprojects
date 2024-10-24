int maxiter = 1000;

double   z1 = 0D;
double   z2 = 0D;
double oldz1 = 0D;
double  leftx = -2.5D;
double   rightx = 2.5D;
double   lefty = -2.5D;
double   righty = 2.5D;

int zooms = 0;
int oldzooms = zooms;

color [] colorarr = new color[maxiter];





void initcolor(){

  for(int i = 0; i < maxiter;i++){
  
  int r = floor(random(255));
  int g = floor(random(255));
  int b = floor(random(255));
  
  colorarr[i] = color(r,g,b);
  
  
  }

}






color getcolorgrayscale(int n){

  return color(map(n,0,maxiter,255,0));

}





color getcolorrandom(int n){

  if(n == maxiter){return color(0);}
  
  
  return colorarr[n];


}




color getcolorset(int n){
 
if (n < maxiter && n > 0) {
    
    int i = n % 16;
    color mapping[] = new color[16];
    mapping[0] = color(66, 30, 15);
    mapping[1] = color(25, 7, 26);
    mapping[2] = color(9, 1, 47);
    mapping[3] = color(4, 4, 73);
    mapping[4] = color(0, 7, 100);
    mapping[5] = color(12, 44, 138);
    mapping[6] = color(24, 82, 177);
    mapping[7] = color(57, 125, 209);
    mapping[8] = color(134, 181, 229);
    mapping[9] = color(211, 236, 248);
    mapping[10] = color(241, 233, 191);
    mapping[11] = color(248, 201, 95);
    mapping[12] = color(255, 170, 0);
    mapping[13] = color(204, 128, 0);
    mapping[14] = color(153, 87, 0);
    mapping[15] = color(106, 52, 3);
    return mapping[i];
}

else return color(0,0,0);

}





void drawComplex(int x,int y,int n){
    
  set(x, y , getcolorrandom(n));
  
}





double mapp(double x,double a,double b,double c,double d){

  double y = ((x - a)/(b - a))  * (d - c) + c;
  
  return y;
  
}


void drawSet(){

  int n = 0;
  for(int x = 0; x <= width;x++){
    
      for (int y = 0; y <= height; y++){
        
      n = 0;
      
      double a =   mapp(x,0,width,leftx,rightx);
      double b =   mapp(y,0,height,lefty,righty);
      
      z1 = 0D;
      z2 = 0D;
      
      oldz1 = 0D;
      
      while((z1*z2)+(z1*z2) <= 4 && n < maxiter ){
        
        oldz1 = z1;
        z1 = ((z1*z1)-(z2*z2)) + a;
        z2 = (z2*oldz1*2) + b;
              
        n++;
        
      }

      drawComplex(x,y,n);
   
    }
    
  }
}



void setup(){

  size(800,800);
  initcolor();
  drawSet();
  
}




void mousePressed(){

  double mousex = mouseX;
  double mousey = mouseY;
  
  double diffx = rightx-leftx;
  double diffy = righty-lefty;

  rightx = rightx-(diffx*(mapp(mousex,0D,width,0.5D,0D)));
  leftx = leftx+(diffx*(mapp(mousex,0D,width,0D,0.5D)));
  righty = righty-(diffy*(mapp(mousey,0D,height,0.5D,0D)));
  lefty = lefty+(diffy*(mapp(mousey,0D,height,0D,0.5D)));
  zooms ++;
  
  println("leftx = " + leftx);
  println("rightx = " + rightx);
  

  
}




void draw(){
  
  if(oldzooms != zooms){println("zoomlevel : " + zooms);oldzooms = zooms;}
  drawSet();
  
}
