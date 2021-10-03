package com.sulake.habbo.room.object.visualization.data
{
   public class LayerData
   {
      
      public static const const_786:String = "";
      
      public static const const_374:int = 0;
      
      public static const const_539:int = 255;
      
      public static const const_836:Boolean = false;
      
      public static const const_583:int = 0;
      
      public static const const_474:int = 0;
      
      public static const const_391:int = 0;
      
      public static const const_1145:int = 1;
      
      public static const const_1030:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2082:String = "";
      
      private var var_1860:int = 0;
      
      private var var_2240:int = 255;
      
      private var var_2402:Boolean = false;
      
      private var var_2400:int = 0;
      
      private var var_2401:int = 0;
      
      private var var_2399:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2082 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2082;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_1860 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_1860;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2240 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2240;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2402 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2402;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2400 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2400;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2401 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2401;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2399 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2399;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
