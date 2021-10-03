package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ViralFurniStatusMessageParser implements IMessageParser
   {
       
      
      private var var_193:String;
      
      private var var_386:int;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_1523:int = 0;
      
      private var var_397:int;
      
      private var _shareId:String;
      
      private var var_2288:String;
      
      public function ViralFurniStatusMessageParser()
      {
         super();
      }
      
      public function get campaignID() : String
      {
         return this.var_193;
      }
      
      public function get objectId() : int
      {
         return this.var_386;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get itemCategory() : int
      {
         return this.var_1523;
      }
      
      public function get shareId() : String
      {
         return this._shareId;
      }
      
      public function get status() : int
      {
         return this.var_397;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2288;
      }
      
      public function flush() : Boolean
      {
         this._roomId = 0;
         this._roomCategory = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_193 = param1.readString();
         this.var_386 = param1.readInteger();
         this.var_397 = param1.readInteger();
         this._shareId = param1.readString();
         this.var_2288 = param1.readString();
         this.var_1523 = param1.readInteger();
         return true;
      }
   }
}
