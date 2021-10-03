package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var _figure:String;
      
      private var var_905:String;
      
      private var var_2486:String;
      
      private var var_1573:String;
      
      private var var_2485:int;
      
      private var var_2489:String;
      
      private var var_2487:int;
      
      private var var_2490:int;
      
      private var var_2387:int;
      
      private var var_1173:int;
      
      private var var_766:int;
      
      private var var_2488:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this._figure = param1.readString();
         this.var_905 = param1.readString();
         this.var_2486 = param1.readString();
         this.var_1573 = param1.readString();
         this.var_2485 = param1.readInteger();
         this.var_2489 = param1.readString();
         this.var_2487 = param1.readInteger();
         this.var_2490 = param1.readInteger();
         this.var_2387 = param1.readInteger();
         this.var_1173 = param1.readInteger();
         this.var_766 = param1.readInteger();
         this.var_2488 = param1.readInteger();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get sex() : String
      {
         return this.var_905;
      }
      
      public function get customData() : String
      {
         return this.var_2486;
      }
      
      public function get realName() : String
      {
         return this.var_1573;
      }
      
      public function get tickets() : int
      {
         return this.var_2485;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2489;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2487;
      }
      
      public function get directMail() : int
      {
         return this.var_2490;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2387;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1173;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_766;
      }
      
      public function get identityId() : int
      {
         return this.var_2488;
      }
   }
}
