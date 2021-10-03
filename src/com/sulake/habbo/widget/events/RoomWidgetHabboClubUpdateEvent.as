package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_236:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2090:int = 0;
      
      private var var_2092:int = 0;
      
      private var var_2091:int = 0;
      
      private var var_2093:Boolean = false;
      
      private var var_2089:int;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_236,param6,param7);
         this.var_2090 = param1;
         this.var_2092 = param2;
         this.var_2091 = param3;
         this.var_2093 = param4;
         this.var_2089 = param5;
      }
      
      public function get daysLeft() : int
      {
         return this.var_2090;
      }
      
      public function get periodsLeft() : int
      {
         return this.var_2092;
      }
      
      public function get pastPeriods() : int
      {
         return this.var_2091;
      }
      
      public function get allowClubDances() : Boolean
      {
         return this.var_2093;
      }
      
      public function get clubLevel() : int
      {
         return this.var_2089;
      }
   }
}
