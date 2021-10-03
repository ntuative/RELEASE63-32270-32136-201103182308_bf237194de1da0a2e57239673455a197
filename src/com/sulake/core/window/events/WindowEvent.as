package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_1705:String = "WE_CREATE";
      
      public static const const_1684:String = "WE_CREATED";
      
      public static const const_1535:String = "WE_DESTROY";
      
      public static const const_326:String = "WE_DESTROYED";
      
      public static const const_1674:String = "WE_OPEN";
      
      public static const const_1519:String = "WE_OPENED";
      
      public static const const_1536:String = "WE_CLOSE";
      
      public static const const_1664:String = "WE_CLOSED";
      
      public static const const_1493:String = "WE_FOCUS";
      
      public static const const_315:String = "WE_FOCUSED";
      
      public static const const_1653:String = "WE_UNFOCUS";
      
      public static const const_1468:String = "WE_UNFOCUSED";
      
      public static const const_1719:String = "WE_ACTIVATE";
      
      public static const const_1564:String = "WE_ACTIVATED";
      
      public static const const_1713:String = "WE_DEACTIVATE";
      
      public static const const_484:String = "WE_DEACTIVATED";
      
      public static const const_471:String = "WE_SELECT";
      
      public static const const_61:String = "WE_SELECTED";
      
      public static const const_904:String = "WE_UNSELECT";
      
      public static const const_899:String = "WE_UNSELECTED";
      
      public static const const_1889:String = "WE_ATTACH";
      
      public static const const_1852:String = "WE_ATTACHED";
      
      public static const const_1906:String = "WE_DETACH";
      
      public static const const_1874:String = "WE_DETACHED";
      
      public static const const_1579:String = "WE_LOCK";
      
      public static const const_1561:String = "WE_LOCKED";
      
      public static const const_1617:String = "WE_UNLOCK";
      
      public static const const_1558:String = "WE_UNLOCKED";
      
      public static const const_835:String = "WE_ENABLE";
      
      public static const const_291:String = "WE_ENABLED";
      
      public static const const_754:String = "WE_DISABLE";
      
      public static const const_219:String = "WE_DISABLED";
      
      public static const const_1433:String = "WE_RELOCATE";
      
      public static const const_344:String = "WE_RELOCATED";
      
      public static const const_1518:String = "WE_RESIZE";
      
      public static const const_47:String = "WE_RESIZED";
      
      public static const WINDOW_EVENT_MINIMIZE:String = "WE_MINIMIZE";
      
      public static const const_1570:String = "WE_MINIMIZED";
      
      public static const const_1551:String = "WE_MAXIMIZE";
      
      public static const const_1486:String = "WE_MAXIMIZED";
      
      public static const const_1606:String = "WE_RESTORE";
      
      public static const const_1695:String = "WE_RESTORED";
      
      public static const const_1955:String = "WE_ARRANGE";
      
      public static const const_1838:String = "WE_ARRANGED";
      
      public static const const_107:String = "WE_UPDATE";
      
      public static const const_1966:String = "WE_UPDATED";
      
      public static const const_1886:String = "WE_CHILD_RELOCATE";
      
      public static const const_503:String = "WE_CHILD_RELOCATED";
      
      public static const const_1870:String = "WE_CHILD_RESIZE";
      
      public static const const_304:String = "WE_CHILD_RESIZED";
      
      public static const const_1954:String = "WE_CHILD_REMOVE";
      
      public static const const_489:String = "WE_CHILD_REMOVED";
      
      public static const const_1819:String = "WE_PARENT_RELOCATE";
      
      public static const const_1827:String = "WE_PARENT_RELOCATED";
      
      public static const const_1962:String = "WE_PARENT_RESIZE";
      
      public static const const_1677:String = "WE_PARENT_RESIZED";
      
      public static const const_187:String = "WE_OK";
      
      public static const const_747:String = "WE_CANCEL";
      
      public static const const_108:String = "WE_CHANGE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_505:String = "WE_SCROLL";
      
      public static const const_164:String = "";
      
      private static const POOL:Array = [];
       
      
      protected var _type:String = "";
      
      protected var _window:IWindow;
      
      protected var var_462:IWindow;
      
      protected var var_1549:Boolean;
      
      protected var var_1550:Boolean;
      
      private var var_1710:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow = null, param3:IWindow = null, param4:Boolean = false)
      {
         this._type = param1;
         this._window = param2;
         this.var_462 = param3;
         this.var_1549 = false;
         this.var_1550 = param4;
         super(param1);
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false) : WindowEvent
      {
         var _loc5_:WindowEvent = false ? POOL.pop() : new WindowEvent(param1);
         _loc5_._type = param1;
         _loc5_._window = param2;
         _loc5_.var_462 = param3;
         _loc5_.var_1550 = param4;
         _loc5_.var_1710 = false;
         return _loc5_;
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      override public function get type() : String
      {
         return this._type;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_462;
      }
      
      override public function get cancelable() : Boolean
      {
         return this.var_1550;
      }
      
      public function recycle() : void
      {
         if(this.var_1710)
         {
            throw new Error("Event already recycled!");
         }
         this._type = null;
         this.var_462 = null;
         this._window = null;
         this.var_1710 = true;
         this.var_1549 = false;
         POOL.push(this);
      }
      
      override public function clone() : Event
      {
         return allocate(this._type,this.window,this.related,this.cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(this.cancelable)
         {
            this.var_1549 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1549;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","cancelable","window");
      }
   }
}
