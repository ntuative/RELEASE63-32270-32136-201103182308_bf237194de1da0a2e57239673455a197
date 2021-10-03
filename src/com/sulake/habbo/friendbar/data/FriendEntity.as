package com.sulake.habbo.friendbar.data
{
   public class FriendEntity implements IFriendEntity
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_983:int;
      
      private var var_686:Boolean;
      
      private var var_1576:Boolean;
      
      private var _figure:String;
      
      private var var_1415:int;
      
      private var var_1575:String;
      
      private var var_1574:String;
      
      private var var_1573:String;
      
      public function FriendEntity(param1:int, param2:String, param3:String, param4:String, param5:int, param6:Boolean, param7:Boolean, param8:String, param9:int, param10:String)
      {
         super();
         this._id = param1;
         this._name = param2;
         this.var_1573 = param3;
         this.var_1575 = param4;
         this.var_983 = param5;
         this.var_686 = param6;
         this.var_1576 = param7;
         this._figure = param8;
         this.var_1415 = param9;
         this.var_1574 = param10;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_983;
      }
      
      public function get online() : Boolean
      {
         return this.var_686;
      }
      
      public function get allowFollow() : Boolean
      {
         return this.var_1576;
      }
      
      public function get figure() : String
      {
         return this._figure;
      }
      
      public function get categoryId() : int
      {
         return this.var_1415;
      }
      
      public function get motto() : String
      {
         return this.var_1575;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1574;
      }
      
      public function get realName() : String
      {
         return this.var_1573;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function set gender(param1:int) : void
      {
         this.var_983 = param1;
      }
      
      public function set online(param1:Boolean) : void
      {
         this.var_686 = param1;
      }
      
      public function set allowFollow(param1:Boolean) : void
      {
         this.var_1576 = param1;
      }
      
      public function set figure(param1:String) : void
      {
         this._figure = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1415 = param1;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1575 = param1;
      }
      
      public function set lastAccess(param1:String) : void
      {
         this.var_1574 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1573 = param1;
      }
   }
}
