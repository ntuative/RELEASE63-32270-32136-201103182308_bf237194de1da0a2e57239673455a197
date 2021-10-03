package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1784:int = 1;
      
      public static const const_1721:int = 2;
       
      
      private var var_950:String;
      
      private var var_2326:int;
      
      private var var_2321:int;
      
      private var var_2322:int;
      
      private var var_2331:int;
      
      private var var_2323:Boolean;
      
      private var var_2325:Boolean;
      
      private var var_2330:int;
      
      private var var_2328:int;
      
      private var var_2327:Boolean;
      
      private var var_2324:int;
      
      private var var_2329:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_950 = param1.readString();
         this.var_2326 = param1.readInteger();
         this.var_2321 = param1.readInteger();
         this.var_2322 = param1.readInteger();
         this.var_2331 = param1.readInteger();
         this.var_2323 = param1.readBoolean();
         this.var_2325 = param1.readBoolean();
         this.var_2330 = param1.readInteger();
         this.var_2328 = param1.readInteger();
         this.var_2327 = param1.readBoolean();
         this.var_2324 = param1.readInteger();
         this.var_2329 = param1.readInteger();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_950;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_2326;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_2321;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_2322;
      }
      
      public function get responseType() : int
      {
         return this.var_2331;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_2323;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2325;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2330;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2328;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_2327;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_2324;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_2329;
      }
   }
}
