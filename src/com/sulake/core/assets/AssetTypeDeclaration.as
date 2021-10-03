package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2128:String;
      
      private var var_2130:Class;
      
      private var var_2129:Class;
      
      private var var_1589:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_2128 = param1;
         this.var_2130 = param2;
         this.var_2129 = param3;
         if(rest == null)
         {
            this.var_1589 = new Array();
         }
         else
         {
            this.var_1589 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return this.var_2128;
      }
      
      public function get assetClass() : Class
      {
         return this.var_2130;
      }
      
      public function get loaderClass() : Class
      {
         return this.var_2129;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_1589;
      }
   }
}
