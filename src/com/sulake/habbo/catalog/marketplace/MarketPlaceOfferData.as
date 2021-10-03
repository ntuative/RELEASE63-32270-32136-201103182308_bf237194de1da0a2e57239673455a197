package com.sulake.habbo.catalog.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOfferData implements IMarketPlaceOfferData
   {
       
      
      private var _offerId:int;
      
      private var _furniId:int;
      
      private var var_2281:int;
      
      private var var_2052:String;
      
      private var var_1683:int;
      
      private var var_2284:int;
      
      private var var_2283:int;
      
      private var var_397:int;
      
      private var var_2282:int = -1;
      
      private var var_1684:int;
      
      private var var_46:BitmapData;
      
      public function MarketPlaceOfferData(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         this._offerId = param1;
         this._furniId = param2;
         this.var_2281 = param3;
         this.var_2052 = param4;
         this.var_1683 = param5;
         this.var_397 = param6;
         this.var_2284 = param7;
         this.var_1684 = param8;
      }
      
      public function dispose() : void
      {
         if(this.var_46)
         {
            this.var_46.dispose();
            this.var_46 = null;
         }
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_2281;
      }
      
      public function get stuffData() : String
      {
         return this.var_2052;
      }
      
      public function get price() : int
      {
         return this.var_1683;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2284;
      }
      
      public function get image() : BitmapData
      {
         return this.var_46;
      }
      
      public function set image(param1:BitmapData) : void
      {
         if(this.var_46 != null)
         {
            this.var_46.dispose();
         }
         this.var_46 = param1;
      }
      
      public function set imageCallback(param1:int) : void
      {
         this.var_2283 = param1;
      }
      
      public function get imageCallback() : int
      {
         return this.var_2283;
      }
      
      public function get status() : int
      {
         return this.var_397;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2282;
      }
      
      public function set timeLeftMinutes(param1:int) : void
      {
         this.var_2282 = param1;
      }
      
      public function set price(param1:int) : void
      {
         this.var_1683 = param1;
      }
      
      public function set offerId(param1:int) : void
      {
         this._offerId = param1;
      }
      
      public function get offerCount() : int
      {
         return this.var_1684;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_1684 = param1;
      }
   }
}
