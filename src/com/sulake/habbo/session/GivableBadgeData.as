package com.sulake.habbo.session
{
   public class GivableBadgeData
   {
       
      
      private var var_319:int;
      
      private var var_2405:String;
      
      public function GivableBadgeData(param1:int, param2:String)
      {
         super();
         this.var_319 = param1;
         this.var_2405 = param2;
      }
      
      public function get badgeId() : int
      {
         return this.var_319;
      }
      
      public function get achievementTypeName() : String
      {
         return this.var_2405;
      }
   }
}
