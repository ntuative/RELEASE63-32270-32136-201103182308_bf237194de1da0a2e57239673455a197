package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionErrorMessageEvent extends RoomSessionEvent
   {
      
      public static const const_1181:String = "RSEME_DOOR_OTHER_DELETED";
      
      public static const const_1035:String = "RSEME_DOOR_NOT_INSTALLED";
      
      public static const const_270:String = "RSEME_CANT_TRADE_STUFF";
      
      public static const const_265:String = "RSEME_INVALID_ITEM_LOC";
      
      public static const const_737:String = "RSEME_CANT_SET_NOT_OWNER";
      
      public static const const_226:String = "RSEME_MAX_STICKIES";
      
      public static const const_252:String = "RSEME_MAX_FURNITURE";
      
      public static const const_234:String = "RSEME_MAX_QUEUE";
      
      public static const const_240:String = "RSEME_MAX_SOUND";
      
      public static const const_215:String = "RSEME_KICKED";
      
      public static const const_249:String = "RSEME_GUIDE_BUSY";
      
      public static const const_214:String = "RSEME_GUIDE_EXISTS";
      
      public static const const_859:String = "RSEME_PETS_FORBIDDEN_IN_HOTEL";
      
      public static const const_650:String = "RSEME_PETS_FORBIDDEN_IN_FLAT";
      
      public static const const_186:String = "RSEME_MAX_PETS";
      
      public static const const_665:String = "RSEME_NO_FREE_TILES_FOR_PET";
      
      public static const const_707:String = "RSEME_SELECTED_TILE_NOT_FREE_FOR_PET";
       
      
      private var _message:String;
      
      public function RoomSessionErrorMessageEvent(param1:String, param2:IRoomSession, param3:String = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param4,param5);
         this._message = param3;
      }
      
      public function get message() : String
      {
         return this._message;
      }
   }
}
