package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1598:String = "WN_CRETAE";
      
      public static const const_1507:String = "WN_CREATED";
      
      public static const const_1208:String = "WN_DESTROY";
      
      public static const const_1071:String = "WN_DESTROYED";
      
      public static const const_1218:String = "WN_OPEN";
      
      public static const const_1219:String = "WN_OPENED";
      
      public static const const_1142:String = "WN_CLOSE";
      
      public static const const_1077:String = "WN_CLOSED";
      
      public static const const_1097:String = "WN_FOCUS";
      
      public static const const_1171:String = "WN_FOCUSED";
      
      public static const const_1040:String = "WN_UNFOCUS";
      
      public static const const_1217:String = "WN_UNFOCUSED";
      
      public static const const_1210:String = "WN_ACTIVATE";
      
      public static const const_397:String = "WN_ACTVATED";
      
      public static const const_1029:String = "WN_DEACTIVATE";
      
      public static const const_1199:String = "WN_DEACTIVATED";
      
      public static const const_460:String = "WN_SELECT";
      
      public static const const_339:String = "WN_SELECTED";
      
      public static const const_901:String = "WN_UNSELECT";
      
      public static const const_810:String = "WN_UNSELECTED";
      
      public static const const_1025:String = "WN_LOCK";
      
      public static const const_1060:String = "WN_LOCKED";
      
      public static const const_1158:String = "WN_UNLOCK";
      
      public static const const_1187:String = "WN_UNLOCKED";
      
      public static const const_1048:String = "WN_ENABLE";
      
      public static const const_642:String = "WN_ENABLED";
      
      public static const const_1115:String = "WN_DISABLE";
      
      public static const const_780:String = "WN_DISABLED";
      
      public static const const_702:String = "WN_RESIZE";
      
      public static const const_191:String = "WN_RESIZED";
      
      public static const const_1049:String = "WN_RELOCATE";
      
      public static const const_467:String = "WN_RELOCATED";
      
      public static const const_1088:String = "WN_MINIMIZE";
      
      public static const const_1207:String = "WN_MINIMIZED";
      
      public static const const_1243:String = "WN_MAXIMIZE";
      
      public static const const_1055:String = "WN_MAXIMIZED";
      
      public static const const_1239:String = "WN_RESTORE";
      
      public static const const_1113:String = "WN_RESTORED";
      
      public static const const_348:String = "WN_CHILD_ADDED";
      
      public static const const_743:String = "WN_CHILD_REMOVED";
      
      public static const const_292:String = "WN_CHILD_RESIZED";
      
      public static const const_276:String = "WN_CHILD_RELOCATED";
      
      public static const WINDOW_NOTIFY_CHILD_ACTIVATED:String = "WN_CHILD_ACTIVATED";
      
      public static const const_448:String = "WN_PARENT_ADDED";
      
      public static const const_1159:String = "WN_PARENT_REMOVED";
      
      public static const const_564:String = "WN_PARENT_RESIZED";
      
      public static const const_1169:String = "WN_PARENT_RELOCATED";
      
      public static const const_735:String = "WN_PARENT_ACTIVATED";
      
      public static const const_559:String = "WN_STATE_UPDATED";
      
      public static const const_529:String = "WN_STYLE_UPDATED";
      
      public static const const_429:String = "WN_PARAM_UPDATED";
      
      public static const UNKNOWN:String = "UNKNOWN";
      
      private static const POOL:Array = [];
       
      
      private var _isRecycled:Boolean;
      
      public function WindowNotifyEvent()
      {
         super("",null,null);
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false) : WindowNotifyEvent
      {
         var _loc5_:WindowNotifyEvent = false ? POOL.pop() : new WindowNotifyEvent();
         _loc5_._type = param1;
         _loc5_._window = param2;
         _loc5_.var_462 = param3;
         _loc5_.var_1550 = param4;
         _loc5_._isRecycled = false;
         return _loc5_;
      }
      
      override public function recycle() : void
      {
         if(this._isRecycled)
         {
            throw new Error("Event already recycled!");
         }
         _type = null;
         var_462 = null;
         _window = null;
         this._isRecycled = true;
         POOL.push(this);
      }
      
      override public function clone() : Event
      {
         return allocate(type,_window,var_462,cancelable);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
   }
}
