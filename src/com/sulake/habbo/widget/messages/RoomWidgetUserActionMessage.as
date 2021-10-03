package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_644:String = "RWUAM_WHISPER_USER";
      
      public static const const_772:String = "RWUAM_IGNORE_USER";
      
      public static const const_876:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_490:String = "RWUAM_KICK_USER";
      
      public static const const_645:String = "RWUAM_BAN_USER";
      
      public static const const_672:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_850:String = "RWUAM_RESPECT_USER";
      
      public static const const_883:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_648:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_686:String = "RWUAM_START_TRADING";
      
      public static const const_918:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_525:String = "RWUAM_KICK_BOT";
      
      public static const const_663:String = "RWUAM_REPORT";
      
      public static const const_450:String = "RWUAM_PICKUP_PET";
      
      public static const const_1620:String = "RWUAM_TRAIN_PET";
      
      public static const const_584:String = " RWUAM_RESPECT_PET";
      
      public static const const_403:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_750:String = "RWUAM_START_NAME_CHANGE";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         this._userId = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
