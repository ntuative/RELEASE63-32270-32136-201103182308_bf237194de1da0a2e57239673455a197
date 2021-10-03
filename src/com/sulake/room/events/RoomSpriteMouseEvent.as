package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_1787:String = "";
      
      private var var_1881:String = "";
      
      private var var_2120:String = "";
      
      private var var_2636:Number = 0;
      
      private var var_2632:Number = 0;
      
      private var var_2633:Number = 0;
      
      private var var_2639:Number = 0;
      
      private var var_2638:Boolean = false;
      
      private var var_2637:Boolean = false;
      
      private var var_2635:Boolean = false;
      
      private var var_2634:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_1787 = param2;
         this.var_1881 = param3;
         this.var_2120 = param4;
         this.var_2636 = param5;
         this.var_2632 = param6;
         this.var_2633 = param7;
         this.var_2639 = param8;
         this.var_2638 = param9;
         this.var_2637 = param10;
         this.var_2635 = param11;
         this.var_2634 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_1787;
      }
      
      public function get canvasId() : String
      {
         return this.var_1881;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2120;
      }
      
      public function get screenX() : Number
      {
         return this.var_2636;
      }
      
      public function get screenY() : Number
      {
         return this.var_2632;
      }
      
      public function get localX() : Number
      {
         return this.var_2633;
      }
      
      public function get localY() : Number
      {
         return this.var_2639;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2638;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2637;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2635;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2634;
      }
   }
}
