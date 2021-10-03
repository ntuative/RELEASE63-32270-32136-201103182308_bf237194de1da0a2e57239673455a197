package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_155:Number = 0;
      
      private var var_156:Number = 0;
      
      private var var_2589:Number = 0;
      
      private var var_2586:Number = 0;
      
      private var var_2588:Number = 0;
      
      private var var_2584:Number = 0;
      
      private var var_339:int = 0;
      
      private var var_2585:int = 0;
      
      private var var_330:Array;
      
      private var var_2587:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_330 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_155 = param3;
         this.var_156 = param4;
         this.var_2589 = param5;
         this.var_339 = param6;
         this.var_2585 = param7;
         this.var_2586 = param8;
         this.var_2588 = param9;
         this.var_2584 = param10;
         this.var_2587 = param11;
         this.var_330 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_155;
      }
      
      public function get z() : Number
      {
         return this.var_156;
      }
      
      public function get localZ() : Number
      {
         return this.var_2589;
      }
      
      public function get targetX() : Number
      {
         return this.var_2586;
      }
      
      public function get targetY() : Number
      {
         return this.var_2588;
      }
      
      public function get targetZ() : Number
      {
         return this.var_2584;
      }
      
      public function get dir() : int
      {
         return this.var_339;
      }
      
      public function get dirHead() : int
      {
         return this.var_2585;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2587;
      }
      
      public function get actions() : Array
      {
         return this.var_330.slice();
      }
   }
}
