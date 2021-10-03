package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_971:int = 3;
       
      
      private var var_2534:int = -1;
      
      private var var_2530:int = -2;
      
      private var var_369:Vector3d = null;
      
      private var var_433:Vector3d = null;
      
      private var var_1816:Vector3d;
      
      private var var_2532:Boolean = false;
      
      private var _limitedLocY:Boolean = false;
      
      private var var_2533:Boolean = false;
      
      private var var_2528:Boolean = false;
      
      private var var_2529:int = 0;
      
      private var var_2526:int = 0;
      
      private var _scale:int = 0;
      
      private var var_2527:int = 0;
      
      private var var_2531:int = 0;
      
      private var var_1588:int = -1;
      
      private var var_1440:int = 0;
      
      public function RoomCamera()
      {
         this.var_1816 = new Vector3d();
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_433;
      }
      
      public function get targetId() : int
      {
         return this.var_2534;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2530;
      }
      
      public function get targetObjectLoc() : IVector3d
      {
         return this.var_1816;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2532;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this._limitedLocY;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2533;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2528;
      }
      
      public function get screenWd() : int
      {
         return this.var_2529;
      }
      
      public function get screenHt() : int
      {
         return this.var_2526;
      }
      
      public function get scale() : int
      {
         return this._scale;
      }
      
      public function get roomWd() : int
      {
         return this.var_2527;
      }
      
      public function get roomHt() : int
      {
         return this.var_2531;
      }
      
      public function get geometryUpdateId() : int
      {
         return this.var_1588;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2534 = param1;
      }
      
      public function set targetObjectLoc(param1:IVector3d) : void
      {
         this.var_1816.assign(param1);
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2530 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2532 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this._limitedLocY = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2533 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2528 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2529 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2526 = param1;
      }
      
      public function set scale(param1:int) : void
      {
         this._scale = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2527 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2531 = param1;
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         this.var_1588 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(this.var_369 == null)
         {
            this.var_369 = new Vector3d();
         }
         if(this.var_369.x != param1.x || this.var_369.y != param1.y || this.var_369.z != param1.z)
         {
            this.var_369.assign(param1);
            this.var_1440 = 0;
         }
      }
      
      public function dispose() : void
      {
         this.var_369 = null;
         this.var_433 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_433 != null)
         {
            return;
         }
         this.var_433 = new Vector3d();
         this.var_433.assign(param1);
      }
      
      public function update(param1:uint, param2:Number, param3:Number) : void
      {
         var _loc4_:* = null;
         if(this.var_369 != null && this.var_433 != null)
         {
            ++this.var_1440;
            _loc4_ = Vector3d.dif(this.var_369,this.var_433);
            if(_loc4_.length <= param2)
            {
               this.var_433 = this.var_369;
               this.var_369 = null;
            }
            else
            {
               _loc4_.div(_loc4_.length);
               if(_loc4_.length < param2 * (const_971 + 1))
               {
                  _loc4_.mul(param2);
               }
               else if(this.var_1440 <= const_971)
               {
                  _loc4_.mul(param2);
               }
               else
               {
                  _loc4_.mul(param3);
               }
               this.var_433 = Vector3d.sum(this.var_433,_loc4_);
            }
         }
      }
   }
}
