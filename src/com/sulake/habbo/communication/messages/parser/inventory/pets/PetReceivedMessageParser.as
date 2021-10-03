package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_1570:Boolean;
      
      private var var_847:PetData;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1570 = param1.readBoolean();
         this.var_847 = new PetData(param1);
         Logger.log("Got PetReceived: " + this.var_1570 + ", " + this.var_847.id + ", " + this.var_847.name + ", " + this.var_847.type + ", " + this.var_847.breed + ", " + this.pet.color);
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return this.var_1570;
      }
      
      public function get pet() : PetData
      {
         return this.var_847;
      }
   }
}
