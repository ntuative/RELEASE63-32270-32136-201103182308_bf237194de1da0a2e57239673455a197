package com.sulake.habbo.widget.events
{
   public class RoomWidgetTeaserDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_576:String = "RWTDUE_TEASER_DATA";
      
      public static const const_886:String = "RWTDUE_GIFT_DATA";
      
      public static const const_649:String = "RWTDUE_GIFT_RECEIVED";
       
      
      private var var_386:int;
      
      private var _data:String;
      
      private var var_397:int;
      
      private var var_193:String;
      
      private var var_2288:String;
      
      private var var_2289:Boolean;
      
      private var var_1523:int = 0;
      
      private var var_2607:String;
      
      public function RoomWidgetTeaserDataUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function get objectId() : int
      {
         return this.var_386;
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function get status() : int
      {
         return this.var_397;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2288;
      }
      
      public function get giftWasReceived() : Boolean
      {
         return this.var_2289;
      }
      
      public function get ownRealName() : String
      {
         return this.var_2607;
      }
      
      public function get itemCategory() : int
      {
         return this.var_1523;
      }
      
      public function set status(param1:int) : void
      {
         this.var_397 = param1;
      }
      
      public function set data(param1:String) : void
      {
         this._data = param1;
      }
      
      public function set firstClickUserName(param1:String) : void
      {
         this.var_2288 = param1;
      }
      
      public function set giftWasReceived(param1:Boolean) : void
      {
         this.var_2289 = param1;
      }
      
      public function set ownRealName(param1:String) : void
      {
         this.var_2607 = param1;
      }
      
      public function set objectId(param1:int) : void
      {
         this.var_386 = param1;
      }
      
      public function get campaignID() : String
      {
         return this.var_193;
      }
      
      public function set campaignID(param1:String) : void
      {
         this.var_193 = param1;
      }
      
      public function set itemCategory(param1:int) : void
      {
         this.var_1523 = param1;
      }
   }
}
