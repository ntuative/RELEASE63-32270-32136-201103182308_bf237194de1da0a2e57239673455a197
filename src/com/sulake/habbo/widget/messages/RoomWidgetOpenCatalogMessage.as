package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_369:String = "RWGOI_MESSAGE_OPEN_CATALOG";
      
      public static const const_1020:String = "RWOCM_CLUB_MAIN";
      
      public static const const_1203:String = "RWOCM_PIXELS";
      
      public static const const_1103:String = "RWOCM_CREDITS";
       
      
      private var var_2521:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_369);
         this.var_2521 = param1;
      }
      
      public function get pageKey() : String
      {
         return this.var_2521;
      }
   }
}
