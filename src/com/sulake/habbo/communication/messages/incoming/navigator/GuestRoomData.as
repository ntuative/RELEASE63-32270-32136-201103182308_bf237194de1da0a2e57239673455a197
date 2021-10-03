package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_394:int;
      
      private var var_801:Boolean;
      
      private var var_889:String;
      
      private var _ownerName:String;
      
      private var var_2116:int;
      
      private var var_2083:int;
      
      private var var_2237:int;
      
      private var var_1677:String;
      
      private var var_2238:int;
      
      private var var_2234:Boolean;
      
      private var var_708:int;
      
      private var var_1415:int;
      
      private var var_2235:String;
      
      private var var_839:Array;
      
      private var var_2236:RoomThumbnailData;
      
      private var var_2118:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_839 = new Array();
         super();
         this.var_394 = param1.readInteger();
         this.var_801 = param1.readBoolean();
         this.var_889 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2116 = param1.readInteger();
         this.var_2083 = param1.readInteger();
         this.var_2237 = param1.readInteger();
         this.var_1677 = param1.readString();
         this.var_2238 = param1.readInteger();
         this.var_2234 = param1.readBoolean();
         this.var_708 = param1.readInteger();
         this.var_1415 = param1.readInteger();
         this.var_2235 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_839.push(_loc4_);
            _loc3_++;
         }
         this.var_2236 = new RoomThumbnailData(param1);
         this.var_2118 = param1.readBoolean();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_839 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get flatId() : int
      {
         return this.var_394;
      }
      
      public function get event() : Boolean
      {
         return this.var_801;
      }
      
      public function get roomName() : String
      {
         return this.var_889;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2116;
      }
      
      public function get userCount() : int
      {
         return this.var_2083;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2237;
      }
      
      public function get description() : String
      {
         return this.var_1677;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2238;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2234;
      }
      
      public function get score() : int
      {
         return this.var_708;
      }
      
      public function get categoryId() : int
      {
         return this.var_1415;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2235;
      }
      
      public function get tags() : Array
      {
         return this.var_839;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2236;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2118;
      }
   }
}
