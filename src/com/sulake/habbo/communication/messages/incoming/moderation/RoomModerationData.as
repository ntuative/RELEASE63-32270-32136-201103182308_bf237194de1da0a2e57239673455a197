package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_394:int;
      
      private var var_2083:int;
      
      private var var_2336:Boolean;
      
      private var var_2271:int;
      
      private var _ownerName:String;
      
      private var var_115:RoomData;
      
      private var var_801:RoomData;
      
      private var _disposed:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         this.var_394 = param1.readInteger();
         this.var_2083 = param1.readInteger();
         this.var_2336 = param1.readBoolean();
         this.var_2271 = param1.readInteger();
         this._ownerName = param1.readString();
         this.var_115 = new RoomData(param1);
         this.var_801 = new RoomData(param1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_115 != null)
         {
            this.var_115.dispose();
            this.var_115 = null;
         }
         if(this.var_801 != null)
         {
            this.var_801.dispose();
            this.var_801 = null;
         }
      }
      
      public function get flatId() : int
      {
         return this.var_394;
      }
      
      public function get userCount() : int
      {
         return this.var_2083;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return this.var_2336;
      }
      
      public function get ownerId() : int
      {
         return this.var_2271;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get room() : RoomData
      {
         return this.var_115;
      }
      
      public function get event() : RoomData
      {
         return this.var_801;
      }
   }
}
