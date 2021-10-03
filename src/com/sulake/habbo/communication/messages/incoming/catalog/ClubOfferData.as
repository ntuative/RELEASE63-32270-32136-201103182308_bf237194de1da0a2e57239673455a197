package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var _offerId:int;
      
      private var var_1836:String;
      
      private var var_1683:int;
      
      private var var_2207:Boolean;
      
      private var var_2210:Boolean;
      
      private var var_2205:int;
      
      private var var_2211:int;
      
      private var var_2209:int;
      
      private var var_2208:int;
      
      private var var_2206:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_1836 = param1.readString();
         this.var_1683 = param1.readInteger();
         this.var_2207 = param1.readBoolean();
         this.var_2210 = param1.readBoolean();
         this.var_2205 = param1.readInteger();
         this.var_2211 = param1.readInteger();
         this.var_2209 = param1.readInteger();
         this.var_2208 = param1.readInteger();
         this.var_2206 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get productCode() : String
      {
         return this.var_1836;
      }
      
      public function get price() : int
      {
         return this.var_1683;
      }
      
      public function get upgrade() : Boolean
      {
         return this.var_2207;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2210;
      }
      
      public function get periods() : int
      {
         return this.var_2205;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2211;
      }
      
      public function get year() : int
      {
         return this.var_2209;
      }
      
      public function get month() : int
      {
         return this.var_2208;
      }
      
      public function get day() : int
      {
         return this.var_2206;
      }
   }
}
