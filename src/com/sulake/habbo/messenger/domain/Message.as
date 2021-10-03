package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_705:int = 1;
      
      public static const const_698:int = 2;
      
      public static const const_841:int = 3;
      
      public static const const_1177:int = 4;
      
      public static const const_683:int = 5;
      
      public static const const_1192:int = 6;
       
      
      private var _type:int;
      
      private var var_1139:int;
      
      private var var_2111:String;
      
      private var var_2164:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1139 = param2;
         this.var_2111 = param3;
         this.var_2164 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2111;
      }
      
      public function get time() : String
      {
         return this.var_2164;
      }
      
      public function get senderId() : int
      {
         return this.var_1139;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
