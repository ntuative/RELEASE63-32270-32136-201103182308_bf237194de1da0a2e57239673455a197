package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
      
      public static const const_179:int = 0;
       
      
      private var var_2433:int = 0;
      
      private var var_1515:Dictionary;
      
      private var var_1976:int = 0;
      
      private var var_1977:int = 0;
      
      private var var_2325:Boolean = false;
      
      private var var_2330:int = 0;
      
      private var var_2328:int = 0;
      
      public function Purse()
      {
         this.var_1515 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_2433;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_2433 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1976;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1976 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1977;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1977 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_1976 > 0 || this.var_1977 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2325;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2325 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2330;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2330 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2328;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2328 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1515;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1515 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1515[param1];
      }
   }
}
