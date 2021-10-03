package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_1680:int;
      
      private var var_2184:String;
      
      private var var_1495:int;
      
      private var var_1072:int;
      
      private var var_1635:int;
      
      private var _color:String;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1680 = param1.readInteger();
         this.var_2184 = param1.readString();
         this.var_1495 = param1.readInteger();
         this.var_1072 = param1.readInteger();
         this.var_1635 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_1680;
      }
      
      public function get petName() : String
      {
         return this.var_2184;
      }
      
      public function get level() : int
      {
         return this.var_1495;
      }
      
      public function get petType() : int
      {
         return this.var_1072;
      }
      
      public function get breed() : int
      {
         return this.var_1635;
      }
      
      public function get color() : String
      {
         return this._color;
      }
   }
}
