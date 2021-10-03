package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_967:int = 10;
      
      private static const const_616:int = 20;
      
      private static const const_1330:int = 31;
      
      private static const const_1329:int = 32;
       
      
      private var var_318:Array;
      
      private var var_777:Boolean = false;
      
      public function FurnitureHabboWheelVisualization()
      {
         this.var_318 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!this.var_777)
            {
               this.var_777 = true;
               this.var_318 = new Array();
               this.var_318.push(const_1330);
               this.var_318.push(const_1329);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_967)
         {
            if(this.var_777)
            {
               this.var_777 = false;
               this.var_318 = new Array();
               this.var_318.push(const_967 + param1);
               this.var_318.push(const_616 + param1);
               this.var_318.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
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
