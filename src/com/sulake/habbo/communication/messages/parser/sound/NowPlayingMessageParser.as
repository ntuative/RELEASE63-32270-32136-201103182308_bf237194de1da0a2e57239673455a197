package com.sulake.habbo.communication.messages.parser.sound
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NowPlayingMessageParser implements IMessageParser
   {
       
      
      private var var_1595:int;
      
      private var _currentPosition:int;
      
      private var var_1592:int;
      
      private var var_1593:int;
      
      private var var_1594:int;
      
      public function NowPlayingMessageParser()
      {
         super();
      }
      
      public function get currentSongId() : int
      {
         return this.var_1595;
      }
      
      public function get currentPosition() : int
      {
         return this._currentPosition;
      }
      
      public function get nextSongId() : int
      {
         return this.var_1592;
      }
      
      public function get nextPosition() : int
      {
         return this.var_1593;
      }
      
      public function get syncCount() : int
      {
         return this.var_1594;
      }
      
      public function flush() : Boolean
      {
         this.var_1595 = -1;
         this._currentPosition = -1;
         this.var_1592 = -1;
         this.var_1593 = -1;
         this.var_1594 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1595 = param1.readInteger();
         this._currentPosition = param1.readInteger();
         this.var_1592 = param1.readInteger();
         this.var_1593 = param1.readInteger();
         this.var_1594 = param1.readInteger();
         return true;
      }
   }
}
