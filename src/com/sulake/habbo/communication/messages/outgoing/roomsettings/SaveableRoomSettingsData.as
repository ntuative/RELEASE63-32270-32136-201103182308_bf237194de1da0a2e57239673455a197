package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   public class SaveableRoomSettingsData
   {
       
      
      private var _roomId:int;
      
      private var _name:String;
      
      private var var_1677:String;
      
      private var var_2116:int;
      
      private var _password:String;
      
      private var var_1415:int;
      
      private var var_2113:int;
      
      private var var_839:Array;
      
      private var var_2114:Array;
      
      private var var_2118:Boolean;
      
      private var var_2112:Boolean;
      
      private var var_2117:Boolean;
      
      private var var_2115:Boolean;
      
      public function SaveableRoomSettingsData()
      {
         super();
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2118;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         this.var_2118 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return this.var_2112;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         this.var_2112 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return this.var_2117;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         this.var_2117 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return this.var_2115;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         this.var_2115 = param1;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function set roomId(param1:int) : void
      {
         this._roomId = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get description() : String
      {
         return this.var_1677;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1677 = param1;
      }
      
      public function get doorMode() : int
      {
         return this.var_2116;
      }
      
      public function set doorMode(param1:int) : void
      {
         this.var_2116 = param1;
      }
      
      public function get password() : String
      {
         return this._password;
      }
      
      public function set password(param1:String) : void
      {
         this._password = param1;
      }
      
      public function get categoryId() : int
      {
         return this.var_1415;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1415 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return this.var_2113;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         this.var_2113 = param1;
      }
      
      public function get tags() : Array
      {
         return this.var_839;
      }
      
      public function set tags(param1:Array) : void
      {
         this.var_839 = param1;
      }
      
      public function get controllers() : Array
      {
         return this.var_2114;
      }
      
      public function set controllers(param1:Array) : void
      {
         this.var_2114 = param1;
      }
   }
}
