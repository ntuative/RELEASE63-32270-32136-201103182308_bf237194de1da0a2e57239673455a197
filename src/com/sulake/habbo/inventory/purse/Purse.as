package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1976:int = 0;
      
      private var var_1977:int = 0;
      
      private var var_2734:int = 0;
      
      private var var_2735:Boolean = false;
      
      private var var_2325:Boolean = false;
      
      public function Purse()
      {
         super();
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_1976 = Math.max(0,param1);
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_1977 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_2734 = Math.max(0,param1);
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_2735 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2325 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_1976;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_1977;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_2734;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_2735;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2325;
      }
   }
}
