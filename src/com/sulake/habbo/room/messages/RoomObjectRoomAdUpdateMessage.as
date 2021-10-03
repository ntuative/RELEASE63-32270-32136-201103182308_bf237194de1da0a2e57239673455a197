package com.sulake.habbo.room.messages
{
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   
   public class RoomObjectRoomAdUpdateMessage extends RoomObjectUpdateMessage
   {
      
      public static const const_1244:String = "RORUM_ROOM_AD_ACTIVATE";
       
      
      private var _type:String;
      
      private var var_445:String;
      
      private var var_1260:String;
      
      public function RoomObjectRoomAdUpdateMessage(param1:String, param2:String, param3:String)
      {
         super(null,null);
         this._type = param1;
         this.var_445 = param2;
         this.var_1260 = param3;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get asset() : String
      {
         return this.var_445;
      }
      
      public function get clickUrl() : String
      {
         return this.var_1260;
      }
   }
}
