package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1478:Boolean;
      
      private var var_2258:int;
      
      private var var_1774:int;
      
      private var var_1775:int;
      
      private var var_2256:int;
      
      private var var_2255:int;
      
      private var var_2259:int;
      
      private var var_2257:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1478;
      }
      
      public function get commission() : int
      {
         return this.var_2258;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1774;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1775;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2255;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2256;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2259;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2257;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1478 = param1.readBoolean();
         this.var_2258 = param1.readInteger();
         this.var_1774 = param1.readInteger();
         this.var_1775 = param1.readInteger();
         this.var_2255 = param1.readInteger();
         this.var_2256 = param1.readInteger();
         this.var_2259 = param1.readInteger();
         this.var_2257 = param1.readInteger();
         return true;
      }
   }
}
