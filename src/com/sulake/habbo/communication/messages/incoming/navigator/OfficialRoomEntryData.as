package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1183:int = 1;
      
      public static const const_690:int = 2;
      
      public static const const_884:int = 3;
      
      public static const const_1428:int = 4;
       
      
      private var _index:int;
      
      private var var_2084:String;
      
      private var var_2087:String;
      
      private var var_2085:Boolean;
      
      private var var_2086:String;
      
      private var var_980:String;
      
      private var var_2088:int;
      
      private var var_2083:int;
      
      private var _type:int;
      
      private var var_2082:String;
      
      private var var_844:GuestRoomData;
      
      private var var_845:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2084 = param1.readString();
         this.var_2087 = param1.readString();
         this.var_2085 = param1.readInteger() == 1;
         this.var_2086 = param1.readString();
         this.var_980 = param1.readString();
         this.var_2088 = param1.readInteger();
         this.var_2083 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1183)
         {
            this.var_2082 = param1.readString();
         }
         else if(this._type == const_884)
         {
            this.var_845 = new PublicRoomData(param1);
         }
         else if(this._type == const_690)
         {
            this.var_844 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_844 != null)
         {
            this.var_844.dispose();
            this.var_844 = null;
         }
         if(this.var_845 != null)
         {
            this.var_845.dispose();
            this.var_845 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2084;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2087;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2085;
      }
      
      public function get picText() : String
      {
         return this.var_2086;
      }
      
      public function get picRef() : String
      {
         return this.var_980;
      }
      
      public function get folderId() : int
      {
         return this.var_2088;
      }
      
      public function get tag() : String
      {
         return this.var_2082;
      }
      
      public function get userCount() : int
      {
         return this.var_2083;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_844;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_845;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1183)
         {
            return 0;
         }
         if(this.type == const_690)
         {
            return this.var_844.maxUserCount;
         }
         if(this.type == const_884)
         {
            return this.var_845.maxUsers;
         }
         return 0;
      }
   }
}
