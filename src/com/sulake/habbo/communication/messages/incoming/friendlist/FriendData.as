package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_983:int;
      
      private var var_686:Boolean;
      
      private var var_1717:Boolean;
      
      private var _figure:String;
      
      private var var_1415:int;
      
      private var var_1575:String;
      
      private var var_1574:String;
      
      private var var_1573:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_983 = param1.readInteger();
         this.var_686 = param1.readBoolean();
         this.var_1717 = param1.readBoolean();
         this._figure = param1.readString();
         this.var_1415 = param1.readInteger();
         this.var_1575 = param1.readString();
         this.var_1574 = param1.readString();
         this.var_1573 = param1.readString();
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
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1717;
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
   }
}
