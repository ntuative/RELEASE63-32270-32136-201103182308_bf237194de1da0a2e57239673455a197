package com.sulake.habbo.widget.messages
{
   public class RoomWidgetVoteMessage extends RoomWidgetMessage
   {
      
      public static const const_111:String = "RWVM_VOTE_MESSAGE";
       
      
      private var var_2011:int;
      
      public function RoomWidgetVoteMessage(param1:int)
      {
         super(const_111);
         this.var_2011 = param1;
      }
      
      public function get vote() : int
      {
         return this.var_2011;
      }
   }
}
