package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_2260:String;
      
      private var var_2262:Array;
      
      private var var_2263:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         this.var_2260 = param1;
         this.var_2262 = param2;
         this.var_2263 = param3;
      }
      
      public function get menuId() : String
      {
         return this.var_2260;
      }
      
      public function get yieldList() : Array
      {
         return this.var_2262;
      }
      
      public function get lockToIcon() : Boolean
      {
         return this.var_2263;
      }
   }
}
