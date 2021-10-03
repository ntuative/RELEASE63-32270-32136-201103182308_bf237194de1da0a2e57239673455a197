package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_2436:Number = 0.0;
      
      private var var_2437:Number = 0.0;
      
      private var var_2657:Number = 0.0;
      
      private var var_2658:Number = 0.0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2436 = param1;
         this.var_2437 = param2;
         this.var_2657 = param3;
         this.var_2658 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2436;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2437;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2657;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2658;
      }
   }
}
