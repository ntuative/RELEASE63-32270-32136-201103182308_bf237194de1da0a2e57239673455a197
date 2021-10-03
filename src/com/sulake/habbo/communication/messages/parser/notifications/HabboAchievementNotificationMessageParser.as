package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboAchievementNotificationMessageParser implements IMessageParser
   {
       
      
      private var _type:int;
      
      private var var_1495:int;
      
      private var var_1756:int;
      
      private var var_2418:int;
      
      private var var_1938:int;
      
      private var var_1496:int;
      
      private var var_2597:String = "";
      
      private var var_2689:String = "";
      
      private var var_2688:int;
      
      public function HabboAchievementNotificationMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._type = param1.readInteger();
         this.var_1495 = param1.readInteger();
         this.var_2597 = param1.readString();
         this.var_1756 = param1.readInteger();
         this.var_2418 = param1.readInteger();
         this.var_1938 = param1.readInteger();
         this.var_1496 = param1.readInteger();
         this.var_2688 = param1.readInteger();
         this.var_2689 = param1.readString();
         return true;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1495;
      }
      
      public function get points() : int
      {
         return this.var_1756;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2418;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1938;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_1496;
      }
      
      public function get badgeID() : String
      {
         return this.var_2597;
      }
      
      public function get achievementID() : int
      {
         return this.var_2688;
      }
      
      public function get removedBadgeID() : String
      {
         return this.var_2689;
      }
   }
}
