package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class OpenPetPackageRequestedMessageParser implements IMessageParser
   {
       
      
      private var var_386:int = -1;
      
      private var var_1072:int = -1;
      
      private var var_1635:int = -1;
      
      private var _color:String = "";
      
      public function OpenPetPackageRequestedMessageParser()
      {
         super();
      }
      
      public function get objectId() : int
      {
         return this.var_386;
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
      
      public function flush() : Boolean
      {
         this.var_386 = -1;
         this.var_1072 = -1;
         this.var_1635 = -1;
         this._color = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_386 = param1.readInteger();
         this.var_1072 = param1.readInteger();
         this.var_1635 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
   }
}
