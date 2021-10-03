package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2196:int;
      
      private var var_2194:int;
      
      private var var_1183:int;
      
      private var var_1185:int;
      
      private var _activityPointType:int;
      
      private var var_2195:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2196 = param1.readInteger();
         this.var_2194 = param1.readInteger();
         this.var_1183 = param1.readInteger();
         this.var_1185 = param1.readInteger();
         this._activityPointType = param1.readInteger();
         this.var_2195 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2196;
      }
      
      public function get charges() : int
      {
         return this.var_2194;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1183;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1185;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2195;
      }
      
      public function get activityPointType() : int
      {
         return this._activityPointType;
      }
   }
}
