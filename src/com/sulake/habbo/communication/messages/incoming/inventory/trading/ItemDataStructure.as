package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2107:int;
      
      private var var_1508:String;
      
      private var var_2141:int;
      
      private var var_2142:int;
      
      private var _category:int;
      
      private var var_2052:String;
      
      private var var_1464:int;
      
      private var var_2147:int;
      
      private var var_2145:int;
      
      private var var_2146:int;
      
      private var var_2143:int;
      
      private var var_2144:Boolean;
      
      private var var_2885:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2107 = param1;
         this.var_1508 = param2;
         this.var_2141 = param3;
         this.var_2142 = param4;
         this._category = param5;
         this.var_2052 = param6;
         this.var_1464 = param7;
         this.var_2147 = param8;
         this.var_2145 = param9;
         this.var_2146 = param10;
         this.var_2143 = param11;
         this.var_2144 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2107;
      }
      
      public function get itemType() : String
      {
         return this.var_1508;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2141;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2142;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2052;
      }
      
      public function get extra() : int
      {
         return this.var_1464;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2147;
      }
      
      public function get creationDay() : int
      {
         return this.var_2145;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2146;
      }
      
      public function get creationYear() : int
      {
         return this.var_2143;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2144;
      }
      
      public function get songID() : int
      {
         return this.var_1464;
      }
   }
}
