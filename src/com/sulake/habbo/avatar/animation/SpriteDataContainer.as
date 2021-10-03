package com.sulake.habbo.avatar.animation
{
   public class SpriteDataContainer implements ISpriteDataContainer
   {
       
      
      private var var_2620:IAnimation;
      
      private var _id:String;
      
      private var var_1860:int;
      
      private var var_2621:String;
      
      private var var_2622:Boolean;
      
      private var _dx:Array;
      
      private var var_1472:Array;
      
      private var var_1471:Array;
      
      public function SpriteDataContainer(param1:IAnimation, param2:XML)
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         super();
         this.var_2620 = param1;
         this._id = String(param2.@id);
         this.var_1860 = parseInt(param2.@ink);
         this.var_2621 = String(param2.@member);
         this.var_2622 = Boolean(parseInt(param2.@directions));
         this._dx = [];
         this.var_1472 = [];
         this.var_1471 = [];
         for each(_loc3_ in param2.direction)
         {
            _loc4_ = parseInt(_loc3_.@id);
            this._dx[_loc4_] = parseInt(_loc3_.@dx);
            this.var_1472[_loc4_] = parseInt(_loc3_.@dy);
            this.var_1471[_loc4_] = parseInt(_loc3_.@dz);
         }
      }
      
      public function getDirectionOffsetX(param1:int) : int
      {
         if(param1 < this._dx.length)
         {
            return this._dx[param1];
         }
         return 0;
      }
      
      public function getDirectionOffsetY(param1:int) : int
      {
         if(param1 < this.var_1472.length)
         {
            return this.var_1472[param1];
         }
         return 0;
      }
      
      public function getDirectionOffsetZ(param1:int) : int
      {
         if(param1 < this.var_1471.length)
         {
            return this.var_1471[param1];
         }
         return 0;
      }
      
      public function get animation() : IAnimation
      {
         return this.var_2620;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get ink() : int
      {
         return this.var_1860;
      }
      
      public function get member() : String
      {
         return this.var_2621;
      }
      
      public function get hasDirections() : Boolean
      {
         return this.var_2622;
      }
   }
}
