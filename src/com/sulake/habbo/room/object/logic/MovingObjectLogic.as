package com.sulake.habbo.room.object.logic
{
   import com.sulake.habbo.room.messages.RoomObjectMoveUpdateMessage;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.logic.ObjectLogicBase;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class MovingObjectLogic extends ObjectLogicBase
   {
      
      public static const const_667:int = 500;
      
      private static var var_929:Vector3d = new Vector3d();
       
      
      private var var_509:Vector3d;
      
      private var var_90:Vector3d;
      
      private var var_1772:int = 0;
      
      private var var_2447:int;
      
      private var var_1091:int = 500;
      
      public function MovingObjectLogic()
      {
         this.var_509 = new Vector3d();
         this.var_90 = new Vector3d();
         super();
      }
      
      protected function get lastUpdateTime() : int
      {
         return this.var_1772;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.var_90 = null;
         this.var_509 = null;
      }
      
      protected function set moveUpdateInterval(param1:int) : void
      {
         if(param1 <= 0)
         {
            param1 = 1;
         }
         this.var_1091 = param1;
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         super.processUpdateMessage(param1);
         var _loc2_:RoomObjectMoveUpdateMessage = param1 as RoomObjectMoveUpdateMessage;
         if(_loc2_ == null)
         {
            return;
         }
         if(object != null)
         {
            if(param1.loc != null)
            {
               this.var_90.assign(param1.loc);
               _loc3_ = _loc2_.targetLoc;
               this.var_2447 = this.var_1772;
               this.var_509.assign(_loc3_);
               this.var_509.sub(this.var_90);
            }
         }
      }
      
      override public function update(param1:int) : void
      {
         var _loc2_:int = 0;
         if(this.var_509.length > 0)
         {
            _loc2_ = param1 - this.var_2447;
            if(_loc2_ > this.var_1091)
            {
               _loc2_ = this.var_1091;
            }
            var_929.assign(this.var_509);
            var_929.mul(_loc2_ / Number(this.var_1091));
            var_929.add(this.var_90);
            if(object != null)
            {
               object.setLocation(var_929);
            }
            if(_loc2_ == this.var_1091)
            {
               this.var_509.x = 0;
               this.var_509.y = 0;
               this.var_509.z = 0;
            }
         }
         this.var_1772 = param1;
      }
   }
}
