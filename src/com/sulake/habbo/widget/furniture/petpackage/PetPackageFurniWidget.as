package com.sulake.habbo.widget.furniture.petpackage
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetPetPackageUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetOpenPetPackageMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   
   public class PetPackageFurniWidget extends RoomWidgetBase
   {
      
      private static const const_1275:Number = 100;
      
      private static const const_1274:Number = 100;
       
      
      private var _window:IFrameWindow;
      
      private var var_386:int = -1;
      
      private var var_582:BitmapData;
      
      private var var_1074:Boolean = false;
      
      public function PetPackageFurniWidget(param1:IHabboWindowManager, param2:IAssetLibrary = null)
      {
         super(param1,param2);
      }
      
      override public function dispose() : void
      {
         this.hideInterface();
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetPetPackageUpdateEvent.const_461,this.onObjectUpdate);
         param1.addEventListener(RoomWidgetPetPackageUpdateEvent.const_533,this.onObjectUpdate);
         param1.addEventListener(RoomWidgetPetPackageUpdateEvent.const_383,this.onObjectUpdate);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetPetPackageUpdateEvent.const_461,this.onObjectUpdate);
         param1.removeEventListener(RoomWidgetPetPackageUpdateEvent.const_533,this.onObjectUpdate);
         param1.removeEventListener(RoomWidgetPetPackageUpdateEvent.const_383,this.onObjectUpdate);
         super.unregisterUpdateEvents(param1);
      }
      
      private function onObjectUpdate(param1:RoomWidgetPetPackageUpdateEvent) : void
      {
         var nameValidationStatus:int = 0;
         var error:String = null;
         var event:RoomWidgetPetPackageUpdateEvent = param1;
         switch(event.type)
         {
            case RoomWidgetPetPackageUpdateEvent.const_461:
               this.hideInterface();
               this.var_386 = event.objectId;
               this.var_582 = event.image;
               this.showInterface();
               this.showPetImage();
               break;
            case RoomWidgetPetPackageUpdateEvent.const_533:
               if(!this.var_1074)
               {
                  return;
               }
               this.var_1074 = false;
               nameValidationStatus = event.nameValidationStatus;
               switch(nameValidationStatus)
               {
                  case 0:
                     this.hideInterface();
                     return;
                  case 1:
                     error = "long";
                     break;
                  case 2:
                     error = "short";
                     break;
                  case 3:
                     error = "chars";
                     break;
                  default:
                     error = "bobba";
               }
               windowManager.alert("${widgets.petpackage.alert.petname.title}","${catalog.alert.petname." + error + "}",0,function(param1:IAlertDialog, param2:Event):void
               {
                  param1.dispose();
               });
               break;
            case RoomWidgetPetPackageUpdateEvent.const_383:
               if(event.objectId != this.var_386)
               {
                  return;
               }
               this.var_582 = event.image;
               this.showPetImage();
               break;
         }
      }
      
      private function hideInterface() : void
      {
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
         this.var_386 = -1;
         this.var_1074 = false;
         this.var_582 = null;
      }
      
      private function showInterface() : void
      {
         var _loc4_:* = null;
         if(this.var_386 < 0)
         {
            return;
         }
         var _loc1_:IAsset = assets.getAssetByName("petpackage");
         var _loc2_:XmlAsset = XmlAsset(_loc1_);
         if(_loc2_ == null)
         {
            return;
         }
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
         this._window = windowManager.buildFromXML(XML(_loc2_.content)) as IFrameWindow;
         this._window.x = const_1275;
         this._window.y = const_1274;
         var _loc3_:IWindow = this._window.header.findChildByTag("close");
         if(_loc3_)
         {
            _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onWindowClose);
         }
         _loc4_ = this._window.findChildByName("pick_name");
         if(_loc4_ != null)
         {
            _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseEvent);
         }
         _loc4_ = this._window.findChildByName("cancel");
         if(_loc4_ != null)
         {
            _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseEvent);
         }
         this._window.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onMouseEvent);
         this.showPetImage();
      }
      
      private function showPetImage() : void
      {
         var _loc2_:* = null;
         if(this.var_582 == null || this._window == null)
         {
            return;
         }
         var _loc1_:IBitmapWrapperWindow = this._window.findChildByName("pet_image") as IBitmapWrapperWindow;
         if(_loc1_ != null)
         {
            _loc1_.bitmap = new BitmapData(_loc1_.width,_loc1_.height,true,0);
            _loc2_ = new Point((_loc1_.width - this.var_582.width) / 2,(_loc1_.height - this.var_582.height) / 2);
            _loc1_.bitmap.copyPixels(this.var_582,this.var_582.rect,_loc2_);
         }
      }
      
      private function onWindowClose(param1:WindowEvent) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.hideInterface();
      }
      
      private function onMouseEvent(param1:WindowMouseEvent) : void
      {
         var _loc2_:IWindow = param1.target as IWindow;
         var _loc3_:String = _loc2_.name;
         switch(_loc3_)
         {
            case "pick_name":
               this.sendOpenPetPackage();
               break;
            case "cancel":
               this.hideInterface();
         }
      }
      
      private function sendOpenPetPackage() : void
      {
         var message:RoomWidgetOpenPetPackageMessage = null;
         if(this.var_1074 || this.var_386 == -1)
         {
            return;
         }
         var name:String = this.getName();
         if(name == null || name.length < 1)
         {
            windowManager.alert("${widgets.petpackage.alert.petname.title}","${catalog.alert.petname.short}",0,function(param1:IAlertDialog, param2:Event):void
            {
               param1.dispose();
            });
            return;
         }
         if(messageListener != null)
         {
            this.var_1074 = true;
            message = new RoomWidgetOpenPetPackageMessage(RoomWidgetOpenPetPackageMessage.const_676,this.var_386,name);
            messageListener.processWidgetMessage(message);
         }
      }
      
      private function getName() : String
      {
         var _loc1_:* = null;
         if(this._window)
         {
            _loc1_ = this._window.findChildByName("input") as ITextFieldWindow;
            if(_loc1_)
            {
               return _loc1_.text;
            }
         }
         return null;
      }
   }
}
