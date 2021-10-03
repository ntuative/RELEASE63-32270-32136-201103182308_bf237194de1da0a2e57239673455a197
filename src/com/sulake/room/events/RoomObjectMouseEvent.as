package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_142:String = "ROE_MOUSE_CLICK";
      
      public static const const_1995:String = "ROE_MOUSE_ENTER";
      
      public static const const_496:String = "ROE_MOUSE_MOVE";
      
      public static const const_1908:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1824:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const ROOM_OBJECT_MOUSE_DOWN:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1787:String = "";
      
      private var var_2637:Boolean;
      
      private var var_2638:Boolean;
      
      private var var_2635:Boolean;
      
      private var var_2634:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:String, param3:int, param4:String, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false)
      {
         super(param1,param3,param4,param9,param10);
         this.var_1787 = param2;
         this.var_2637 = param5;
         this.var_2638 = param6;
         this.var_2635 = param7;
         this.var_2634 = param8;
      }
      
      public function get eventId() : String
      {
         return this.var_1787;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2637;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2638;
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
