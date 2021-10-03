package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_83:String = "i";
      
      public static const const_86:String = "s";
      
      public static const const_245:String = "e";
       
      
      private var var_1631:String;
      
      private var var_2094:int;
      
      private var var_1338:String;
      
      private var var_1339:int;
      
      private var var_1633:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1631 = param1.readString();
         this.var_2094 = param1.readInteger();
         this.var_1338 = param1.readString();
         this.var_1339 = param1.readInteger();
         this.var_1633 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1631;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2094;
      }
      
      public function get extraParam() : String
      {
         return this.var_1338;
      }
      
      public function get productCount() : int
      {
         return this.var_1339;
      }
      
      public function get expiration() : int
      {
         return this.var_1633;
      }
   }
}
