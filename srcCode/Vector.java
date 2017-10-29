/*
 * Created by:Scott Turro
 * Date:October 29th, 2017
 * Version 1.0
*/
class Vector
{
   //Private instance feilds
   //x is the x value of the vector, and y is the y value of the vector
   double x;
   double y;
   
   /* Coefficent of resitution. 
    * On a scale of 0-1.
    * 0 will make objects lose all veloctiy when they collide, 
    * 1 will make objects bounce with 100% of their original velocity. 
   */
   static double coRes = 1;
   
   //tX is the x value of the vector, and tY is the y value of the vector
   Vector(double tX, double tY)
   {
      x = tX;
      y = tY;
   }
   //returns the x value of the vector
   double getX()
   {
      return x;
   }
   //returns the y value of the vector
   double getY()
   {
      return y;
   }
   //CHanges the direction and velocity of the vector when it collides with a surface with the slope m.
   void collide(double m)
   {
     double tY, tX;
     tX=coRes*(x*m*m+2*y*m+x)/(1+m*m);
     tY=-coRes*(-y*m*m-2*x*m+y)/(1+m*m);
     x = tX;
     y = tY;
   }
   //Changes the Coefficent of Restitution for all objects.
   static void setCoRes(double temp)
   {
      coRes=temp;
   }
   
   
}