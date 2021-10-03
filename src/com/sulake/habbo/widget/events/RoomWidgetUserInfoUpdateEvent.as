package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_122:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_132:String = "RWUIUE_PEER";
      
      public static const TRADE_REASON_OK:int = 0;
      
      public static const const_1150:int = 2;
      
      public static const const_1095:int = 3;
      
      public static const const_1529:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_1575:String = "";
      
      private var var_2175:int;
      
      private var var_2172:int = 0;
      
      private var var_2174:int = 0;
      
      private var _figure:String = "";
      
      private var var_46:BitmapData = null;
      
      private var var_254:Array;
      
      private var var_1687:Array;
      
      private var var_1366:int = 0;
      
      private var var_2295:String = "";
      
      private var var_2301:int = 0;
      
      private var var_2292:int = 0;
      
      private var var_1656:Boolean = false;
      
      private var var_1573:String = "";
      
      private var var_2299:Boolean = false;
      
      private var var_2294:Boolean = true;
      
      private var var_1173:int = 0;
      
      private var var_2293:Boolean = false;
      
      private var var_2297:Boolean = false;
      
      private var var_2298:Boolean = false;
      
      private var var_2300:Boolean = false;
      
      private var var_2302:Boolean = false;
      
      private var var_2296:Boolean = false;
      
      private var var_2303:int = 0;
      
      private var var_1654:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_254 = [];
         this.var_1687 = [];
         super(param1,param2,param3);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1575 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1575;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2175 = param1;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2175;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2172 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2172;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2174 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2174;
      }
      
      public function set figure(param1:String) : void
      {
         this._figure = param1;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_46 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_46;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_254 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_254;
      }
      
      public function get givableBadges() : Array
      {
         return this.var_1687;
      }
      
      public function set givableBadges(param1:Array) : void
      {
         this.var_1687 = param1;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1366 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1366;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2295 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2295;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2299 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2299;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this.var_1173 = param1;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1173;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2293 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2293;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2297 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2297;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2298 = param1;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2298;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2300 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2300;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2302 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2302;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2296 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2296;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2303 = param1;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2303;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2294 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2294;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1654 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1654;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2301 = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_2301;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2292 = param1;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2292;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_1656 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_1656;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1573 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_1573;
      }
   }
}
