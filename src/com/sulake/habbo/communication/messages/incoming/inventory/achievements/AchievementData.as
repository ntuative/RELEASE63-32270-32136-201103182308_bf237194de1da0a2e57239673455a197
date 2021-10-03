package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1495:int;
      
      private var var_319:String;
      
      private var var_2419:int;
      
      private var var_2418:int;
      
      private var var_1938:int;
      
      private var var_2417:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1495 = param1.readInteger();
         this.var_319 = param1.readString();
         this.var_2419 = param1.readInteger();
         this.var_2418 = param1.readInteger();
         this.var_1938 = param1.readInteger();
         this.var_2417 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_319;
      }
      
      public function get level() : int
      {
         return this.var_1495;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_2419;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2418;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1938;
      }
      
      public function get currentPoints() : int
      {
         return this.var_2417;
      }
   }
}
