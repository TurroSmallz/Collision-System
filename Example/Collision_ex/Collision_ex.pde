ArrayList ps;

void setup() {
   size(400, 600);
   //Creates a array list of 50 new particles
   ps = new ArrayList<Particle>();
   for(int i =0;i<50;i++)
   {
      ps.add(new Particle());
   }
   //Changes the Coefficent of resitution to .6
   Vector.setCoRes(.6);
}

void draw() {
   background(50);
   fill(255);
   stroke(0);
   ellipse(width/2,400,200,200);
   //shows all the particles in the array on the screen and updates them
   for(int i=0;i<ps.size();i++)
   {
      ((Particle)ps.get(i)).show();
      ((Particle)ps.get(i)).update();
      //deletes and creates a new particle if it has gone off the screen
      if(((Particle)ps.get(i)).y>height)
      {
         ps.remove(i);
         i--;
         ps.add(new Particle());
      }
   }
}
//The particle class utalizes the Vector class when it collides with a surface
class Particle
{
  //a particle is defined by a postion, velocity, and acceleration.
   float x;
   float y = 0;
   float yA =.5;
   float yV = 0;
   float xV = 0;
   
   Particle()
   {
     //randomizes the starting x postion of the particle
      x= random(0,width);
      
   }
   
   void show()
   {
      //draws a red circle where the particle's postion is
      fill(255,0,0);
      ellipse(x,y,15,15);
   }
   
   void update()
   {
     //updates the particle's postion and velocity
      x+=xV;
      y+=yV;
      yV+=yA;
      
      //checks to see if the particle's postion is withi the circle
      if(Math.pow(100,2)>=Math.pow(x-(width/2),2)+Math.pow(y-400,2)
      )
      {
         //Finds the slope of the circle at the point the particle hit the circle by takign the derivative of the circle
         float m= (width-2*x)/(2*y-800);
         //creates a vector based on the particle's velocity
         Vector v = new Vector(xV,yV);
         //the vector collides with the surface of the circle
         v.collide(m);
         //makes the particle's x and y velocity equal to the vectors x an y velocity
         xV = (float)v.getX();
         yV = (float)v.getY();
         //changes the y postion of the particle to the outer rim of the circle so the particle does not get stuck inside the circle
         y=(float) -Math.sqrt(Math.pow(100,2)-Math.pow(x-(width/2),2))+400;
      }
      
      
      
      
   }
}