package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      protected var var_2062:int;
      
      protected var var_2063:int;
      
      protected var _songName:String;
      
      protected var var_2061:String;
      
      private var var_2562:Number = 0.0;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this.var_2062 = param1;
         this.var_2063 = param2;
         this._songName = param3;
         this.var_2061 = param4;
      }
      
      public function get id() : int
      {
         return this.var_2062;
      }
      
      public function get length() : int
      {
         return this.var_2063;
      }
      
      public function get name() : String
      {
         return this._songName;
      }
      
      public function get creator() : String
      {
         return this.var_2061;
      }
      
      public function get startPlayHeadPos() : Number
      {
         return this.var_2562;
      }
      
      public function set startPlayHeadPos(param1:Number) : void
      {
         this.var_2562 = param1;
      }
   }
}
