package com.sulake.habbo.widget.events
{
   public class RoomWidgetUserTagsUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_166:String = "RWUTUE_USER_TAGS";
       
      
      private var _userId:int;
      
      private var var_839:Array;
      
      private var var_2662:Boolean;
      
      public function RoomWidgetUserTagsUpdateEvent(param1:int, param2:Array, param3:Boolean, param4:Boolean = false, param5:Boolean = false)
      {
         super(const_166,param4,param5);
         this._userId = param1;
         this.var_839 = param2;
         this.var_2662 = param3;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get tags() : Array
      {
         return this.var_839;
      }
      
      public function get isOwnUser() : Boolean
      {
         return this.var_2662;
      }
   }
}
