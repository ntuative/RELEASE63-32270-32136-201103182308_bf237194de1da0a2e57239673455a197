package com.sulake.habbo.widget.messages
{
   public class RoomWidgetGetBadgeImageMessage extends RoomWidgetMessage
   {
      
      public static const const_796:String = "RWGOI_MESSAGE_GET_BADGE_IMAGE";
       
      
      private var var_319:String = "";
      
      public function RoomWidgetGetBadgeImageMessage(param1:String)
      {
         super(const_796);
         this.var_319 = param1;
      }
      
      public function get badgeId() : String
      {
         return this.var_319;
      }
   }
}
