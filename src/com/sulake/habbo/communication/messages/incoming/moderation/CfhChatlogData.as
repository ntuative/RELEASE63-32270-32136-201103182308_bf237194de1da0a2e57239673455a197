package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1947:int;
      
      private var var_2741:int;
      
      private var var_1322:int;
      
      private var var_2358:int;
      
      private var var_115:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1947 = param1.readInteger();
         this.var_2741 = param1.readInteger();
         this.var_1322 = param1.readInteger();
         this.var_2358 = param1.readInteger();
         this.var_115 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1947);
      }
      
      public function get callId() : int
      {
         return this.var_1947;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2741;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1322;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2358;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_115;
      }
   }
}
