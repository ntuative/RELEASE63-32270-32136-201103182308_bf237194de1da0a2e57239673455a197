package com.sulake.habbo.widget.messages
{
   public class RoomWidgetViralFurniMessage extends RoomWidgetMessage
   {
      
      public static const const_815:String = "RWVFM_VIRAL_FOUND";
      
      public static const const_163:String = "RWVFM_OPEN_PRESENT";
       
      
      private var var_386:int;
      
      public function RoomWidgetViralFurniMessage(param1:String)
      {
         super(param1);
      }
      
      public function get objectId() : int
      {
         return this.var_386;
      }
      
      public function set objectId(param1:int) : void
      {
         this.var_386 = param1;
      }
   }
}
