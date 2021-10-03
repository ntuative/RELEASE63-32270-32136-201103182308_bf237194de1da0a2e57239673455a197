package com.sulake.habbo.friendlist.domain
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendRequestData;
   
   public class FriendRequest implements IDisposable
   {
      
      public static const const_165:int = 1;
      
      public static const const_340:int = 2;
      
      public static const const_371:int = 3;
      
      public static const const_1175:int = 4;
       
      
      private var var_1230:int;
      
      private var var_2348:String;
      
      private var var_2349:int;
      
      private var _state:int = 1;
      
      private var _disposed:Boolean;
      
      private var var_17:IWindowContainer;
      
      public function FriendRequest(param1:FriendRequestData)
      {
         super();
         this.var_1230 = param1.requestId;
         this.var_2348 = param1.requesterName;
         this.var_2349 = param1.requesterUserId;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.view != null)
         {
            this.view.destroy();
            this.view = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get requestId() : int
      {
         return this.var_1230;
      }
      
      public function get requesterName() : String
      {
         return this.var_2348;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_2349;
      }
      
      public function get view() : IWindowContainer
      {
         return this.var_17;
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function set view(param1:IWindowContainer) : void
      {
         this.var_17 = param1;
      }
      
      public function set state(param1:int) : void
      {
         this._state = param1;
      }
   }
}
