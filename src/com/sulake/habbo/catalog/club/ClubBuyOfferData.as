package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var _offerId:int;
      
      private var var_1836:String;
      
      private var var_1683:int;
      
      private var var_2207:Boolean;
      
      private var var_2210:Boolean;
      
      private var var_2205:int;
      
      private var var_2211:int;
      
      private var var_431:ICatalogPage;
      
      private var var_2209:int;
      
      private var var_2208:int;
      
      private var var_2206:int;
      
      private var var_2759:Boolean = false;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         this._offerId = param1;
         this.var_1836 = param2;
         this.var_1683 = param3;
         this.var_2207 = param4;
         this.var_2210 = param5;
         this.var_2205 = param6;
         this.var_2211 = param7;
         this.var_2209 = param8;
         this.var_2208 = param9;
         this.var_2206 = param10;
      }
      
      public function dispose() : void
      {
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
      
      public function get priceInActivityPoints() : int
      {
         return 0;
      }
      
      public function get activityPointType() : int
      {
         return Purse.const_179;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1683;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_431;
      }
      
      public function get priceType() : String
      {
         return Offer.const_696;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get localizationId() : String
      {
         return this.var_1836;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         this.var_431 = param1;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return this.var_2759;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         this.var_2759 = param1;
      }
   }
}
