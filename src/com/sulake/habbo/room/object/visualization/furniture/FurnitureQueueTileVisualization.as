package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1329:int = 3;
      
      private static const const_1271:int = 2;
      
      private static const const_1273:int = 1;
      
      private static const const_1272:int = 15;
       
      
      private var var_318:Array;
      
      private var var_1073:int;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_318 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1271)
         {
            this.var_318 = new Array();
            this.var_318.push(const_1273);
            this.var_1073 = const_1272;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(this.var_1073 > 0)
         {
            --this.var_1073;
         }
         if(this.var_1073 == 0)
         {
            if(this.var_318.length > 0)
            {
               super.setAnimation(this.var_318.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
