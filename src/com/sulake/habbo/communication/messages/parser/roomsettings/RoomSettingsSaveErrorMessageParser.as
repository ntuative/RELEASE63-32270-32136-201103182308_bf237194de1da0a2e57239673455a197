package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1924:int = 1;
      
      public static const const_1786:int = 2;
      
      public static const const_1957:int = 3;
      
      public static const const_1968:int = 4;
      
      public static const const_1681:int = 5;
      
      public static const const_1806:int = 6;
      
      public static const const_1676:int = 7;
      
      public static const const_1432:int = 8;
      
      public static const const_1896:int = 9;
      
      public static const const_1434:int = 10;
      
      public static const const_1672:int = 11;
      
      public static const const_1661:int = 12;
       
      
      private var _roomId:int;
      
      private var var_1664:int;
      
      private var var_1312:String;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._roomId = param1.readInteger();
         this.var_1664 = param1.readInteger();
         this.var_1312 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get errorCode() : int
      {
         return this.var_1664;
      }
      
      public function get info() : String
      {
         return this.var_1312;
      }
   }
}
