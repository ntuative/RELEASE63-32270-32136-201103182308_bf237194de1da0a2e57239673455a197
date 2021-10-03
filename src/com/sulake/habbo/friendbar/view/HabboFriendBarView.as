package com.sulake.habbo.friendbar.view
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.friendbar.HabboFriendBar;
   import com.sulake.habbo.friendbar.data.FriendStruct;
   import com.sulake.habbo.friendbar.data.IFriendEntity;
   import com.sulake.habbo.friendbar.data.IHabboFriendBarData;
   import com.sulake.habbo.friendbar.events.FriendBarUpdateEvent;
   import com.sulake.habbo.friendbar.iid.IIDHabboFriendBarData;
   import com.sulake.habbo.friendbar.view.utils.TextCropper;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDAvatarRenderManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import iid.IIDHabboWindowManager;
   
   public class HabboFriendBarView extends Component implements IHabboFriendBarView, IAvatarImageListener
   {
      
      private static const const_330:int = 127;
      
      private static const const_418:int = 40;
      
      private static const const_946:int = -1;
      
      private static const const_1291:int = 0;
      
      private static const const_329:int = 1;
      
      private static const const_1287:int = -4;
      
      private static const const_941:int = 80;
      
      private static const const_1299:Boolean = false;
      
      private static const const_1289:String = "bar_xml";
      
      private static const const_1292:String = "entity_xml";
      
      private static const const_1290:String = "facebook_piece_xml";
      
      private static const const_1288:String = "controls_piece_xml";
      
      private static const const_1297:String = "toggle_xml";
      
      private static const const_124:String = "list";
      
      private static const const_940:String = "header";
      
      private static const const_947:String = "facebook";
      
      private static const const_945:String = "controls";
      
      private static const const_274:String = "canvas";
      
      private static const const_599:String = "name";
      
      private static const const_943:String = "btn_message";
      
      private static const const_939:String = "btn_visit";
      
      private static const const_944:String = "button_left";
      
      private static const const_942:String = "button_right";
      
      private static const const_1295:String = "button_left_page";
      
      private static const const_1294:String = "button_right_page";
      
      private static const const_1293:String = "button_left_end";
      
      private static const const_1296:String = "button_right_end";
      
      private static const const_1298:String = "button_close";
      
      private static const const_1300:String = "button_open";
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1066:IAvatarRenderManager;
      
      private var var_96:IHabboFriendBarData;
      
      private var var_28:IWindowContainer;
      
      private var var_200:IWindowContainer;
      
      private var var_595:Array;
      
      private var var_1097:Map;
      
      private var _startIndex:int = 0;
      
      private var var_418:int = -1;
      
      private var _textCropper:TextCropper;
      
      public function HabboFriendBarView(param1:HabboFriendBar, param2:uint, param3:IAssetLibrary)
      {
         super(param1,param2,param3);
         this._textCropper = new TextCropper();
         this.var_595 = [];
         this.var_1097 = new Map();
         queueInterface(new IIDAvatarRenderManager(),this.onAvatarRendererAvailable);
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerAvailable);
         queueInterface(new IIDHabboFriendBarData(),this.onFriendBarDataAvailable);
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            this._windowManager.getWindowContext(const_329).getDesktopWindow().removeEventListener(WindowEvent.const_47,this.onDesktopResized);
            if(this.var_200)
            {
               this.var_200.dispose();
               this.var_200 = null;
            }
            if(this.var_28)
            {
               this.var_28.dispose();
               this.var_28 = null;
            }
            while(this.var_595.length > 0)
            {
               this.var_595.pop().dispose();
            }
            while(this.var_1097.length > 0)
            {
               try
               {
                  BitmapData(this.var_1097.remove(this.var_1097.getKey(0))).dispose();
               }
               catch(e:Error)
               {
               }
            }
            if(this.var_96)
            {
               this.var_96.events.removeEventListener(FriendBarUpdateEvent.const_443,this.onRefreshView);
               this.var_96 = null;
               release(new IIDHabboFriendBarData());
            }
            if(this._windowManager)
            {
               this._windowManager = null;
               release(new IIDHabboWindowManager());
            }
            if(this.var_1066)
            {
               this.var_1066 = null;
               release(new IIDAvatarRenderManager());
            }
            this._textCropper.dispose();
            this._textCropper = null;
            super.dispose();
         }
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(this.var_28)
         {
            this.var_28.visible = param1;
            this.var_28.activate();
         }
         if(this.var_200)
         {
            this.var_200.visible = !param1;
            if(this.var_28)
            {
               this.var_200.x = this.var_28.x;
               this.var_200.y = this.var_28.y;
               this.var_200.activate();
            }
         }
      }
      
      public function get visible() : Boolean
      {
         return this.var_28 && this.var_28.visible;
      }
      
      public function populate() : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc1_:IItemListWindow = this.var_28.findChildByName(const_124) as IItemListWindow;
         _loc1_.autoArrangeItems = false;
         var _loc2_:int = _loc1_.numListItems;
         _loc3_ = _loc2_;
         while(_loc3_ > 0)
         {
            this.releaseEntityWindow(_loc1_.removeListItemAt(_loc3_ - 1) as IWindowContainer);
            _loc3_--;
         }
         _loc2_ = Math.min(this.maxNumFriendsVisible,this.var_96.numFriends);
         this.visible = _loc2_ > 0;
         if(this._startIndex + _loc2_ > this.var_96.numFriends)
         {
            this._startIndex = Math.max(0,this._startIndex - (this._startIndex + _loc2_ - this.var_96.numFriends));
         }
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this.var_96.getFriendAt(_loc3_ + this._startIndex);
            _loc5_ = this.getEntityWindow();
            _loc5_.id = _loc4_.id;
            if(_loc4_.id == this.var_418)
            {
               _loc8_ = _loc4_;
               _loc9_ = _loc5_;
            }
            _loc6_ = IItemListWindow(_loc5_.getChildByName(const_124)).getListItemByName(const_940) as IWindowContainer;
            _loc6_.getChildByName(const_599).caption = _loc4_.name;
            this._textCropper.crop(_loc6_.getChildByName(const_599) as ITextWindow);
            _loc7_ = IBitmapWrapperWindow(_loc6_.getChildByName(const_274));
            _loc7_.bitmap = this.getAvatarFaceBitmap(_loc4_.figure);
            _loc7_.width = _loc7_.bitmap.width;
            _loc7_.height = _loc7_.bitmap.height;
            _loc5_.y = 0;
            _loc1_.addListItem(_loc5_);
            _loc3_++;
         }
         _loc1_.autoArrangeItems = true;
         this.deSelectFriendEntity();
         if(_loc8_ && _loc9_)
         {
            this.selectFriendEntity(_loc8_,_loc9_);
         }
         this.toggleArrowButtons(this.maxNumFriendsVisible < this.var_96.numFriends);
      }
      
      public function addOrReplaceFriend(param1:FriendStruct) : void
      {
         var _loc2_:* = null;
         if(this.var_28)
         {
            _loc2_ = this.var_28.findChildByName(const_124) as IItemListWindow;
         }
      }
      
      private function get maxNumFriendsVisible() : int
      {
         var _loc1_:IItemListWindow = this.var_28.findChildByName(const_124) as IItemListWindow;
         return _loc1_.width / (const_330 + _loc1_.spacing);
      }
      
      private function getEntityWindow() : IWindowContainer
      {
         return this.var_595.length > 0 ? this.var_595.pop() : this.allocateEntityWindow();
      }
      
      private function allocateEntityWindow() : IWindowContainer
      {
         var _loc1_:IWindowContainer = this._windowManager.buildFromXML(assets.getAssetByName(const_1292).content as XML) as IWindowContainer;
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(_loc1_.findChildByName(const_274));
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.width = const_330;
         _loc1_.height = const_418;
         _loc1_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onFriendEntityClick);
         _loc2_.disposesBitmap = true;
         return _loc1_;
      }
      
      private function releaseEntityWindow(param1:IWindowContainer) : void
      {
         var _loc2_:* = null;
         if(param1 && !param1.disposed)
         {
            param1.procedure = null;
            param1.findChildByName(const_274).removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onFriendEntityClick);
            param1.width = const_330;
            param1.height = const_418;
            _loc2_ = IBitmapWrapperWindow(param1.findChildByName(const_274));
            _loc2_.bitmap = null;
            this.purgeEntityPieces(param1);
            if(this.var_595.indexOf(param1) == -1)
            {
               this.var_595.push(param1);
            }
         }
      }
      
      private function onFriendBarDataAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_96 = param2 as IHabboFriendBarData;
         this.var_96.events.addEventListener(FriendBarUpdateEvent.const_443,this.onRefreshView);
      }
      
      private function onWindowManagerAvailable(param1:IID, param2:IUnknown) : void
      {
         this._windowManager = param2 as IHabboWindowManager;
      }
      
      private function isUserInterfaceReady() : Boolean
      {
         return this.var_28 && !this.var_28.disposed;
      }
      
      private function buildUserInterface() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < const_1291)
         {
            this.var_595.push(this.allocateEntityWindow());
            _loc1_++;
         }
         var _loc2_:IAsset = assets.getAssetByName(const_1289);
         this.var_28 = this._windowManager.buildFromXML(_loc2_.content as XML,const_329) as IWindowContainer;
         if(const_946 > 0)
         {
            this.var_28.width = const_946;
         }
         else
         {
            this.var_28.width = this.calculateSizeForBar();
         }
         this.var_28.x = this.var_28.parent.width / 2 - this.var_28.width / 2;
         this.var_28.y = this.var_28.parent.height - (this.var_28.height + const_1287);
         this.var_28.setParamFlag(WindowParam.const_232,true);
         this.var_28.procedure = this.barWindowEventProc;
         if(const_1299)
         {
            _loc2_ = assets.getAssetByName(const_1297);
            this.var_200 = this._windowManager.buildFromXML(_loc2_.content as XML,const_329) as IWindowContainer;
            this.var_200.x = this.var_28.x;
            this.var_200.y = this.var_28.y;
            this.var_200.setParamFlag(WindowParam.const_232,true);
            this.var_200.visible = false;
            this.var_200.procedure = this.toggleWindowEventProc;
         }
         this.visible = true;
         this._windowManager.getWindowContext(const_329).getDesktopWindow().addEventListener(WindowEvent.const_47,this.onDesktopResized);
      }
      
      private function onAvatarRendererAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_1066 = param2 as IAvatarRenderManager;
      }
      
      private function getAvatarFaceBitmap(param1:String) : BitmapData
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(this.var_1066)
         {
            _loc3_ = this.var_1066.createAvatarImage(param1,AvatarScaleType.const_56,null,this);
            if(_loc3_)
            {
               _loc2_ = _loc3_.getCroppedImage(AvatarSetType.const_51);
               _loc3_.dispose();
            }
         }
         return _loc2_;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc3_:IItemListWindow = this.var_28.findChildByName(const_124) as IItemListWindow;
         var _loc4_:int = this.var_96.numFriends;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.var_96.getFriendAt(_loc5_);
            if(_loc2_.figure == param1)
            {
               _loc6_ = this.getAvatarFaceBitmap(_loc2_.figure);
               if(_loc6_)
               {
                  this.var_1097[_loc2_.figure] = _loc6_;
                  _loc7_ = _loc3_.getListItemByID(_loc2_.id) as IWindowContainer;
                  if(_loc7_)
                  {
                     _loc8_ = _loc7_.getChildByName(const_124) as IItemListWindow;
                     if(_loc8_)
                     {
                        _loc9_ = IWindowContainer(_loc8_.getListItemByName(const_940));
                        if(_loc9_)
                        {
                           _loc10_ = _loc9_.getChildByName(const_274) as IBitmapWrapperWindow;
                           _loc10_.bitmap = _loc6_.clone();
                           _loc10_.width = _loc6_.width;
                           _loc10_.height = _loc6_.height;
                        }
                     }
                  }
               }
            }
            _loc5_++;
         }
      }
      
      public function faceBookImageReady(param1:BitmapData) : void
      {
      }
      
      private function isFriendEntitySelected(param1:IFriendEntity) : Boolean
      {
         return this.var_418 == param1.id;
      }
      
      private function selectFriendEntity(param1:IFriendEntity, param2:IWindowContainer) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(this.var_418 == param1.id)
         {
            return;
         }
         if(this.var_418 > -1)
         {
            this.deSelectFriendEntity();
         }
         this.var_418 = param1.id;
         var _loc3_:IItemListWindow = IItemListWindow(param2.getChildByName(const_124));
         if(param1.realName != null && param1.realName != "")
         {
            _loc4_ = this._windowManager.buildFromXML(assets.getAssetByName(const_1290).content as XML) as IWindowContainer;
            _loc4_.name = const_947;
            _loc4_.getChildByName(const_599).caption = param1.realName;
            _loc5_ = IBitmapWrapperWindow(_loc4_.getChildByName(const_274));
            _loc5_.bitmap = this.getAvatarFaceBitmap(param1.figure);
            _loc5_.width = _loc5_.bitmap.width;
            _loc5_.height = _loc5_.bitmap.height;
            _loc3_.addListItem(_loc4_);
         }
         if(param1.online)
         {
            _loc4_ = this._windowManager.buildFromXML(assets.getAssetByName(const_1288).content as XML) as IWindowContainer;
            _loc4_.name = const_945;
            _loc6_ = _loc4_.getChildByName(const_943);
            if(_loc6_)
            {
               _loc6_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onControlClick);
            }
            _loc6_ = _loc4_.getChildByName(const_939);
            if(_loc6_)
            {
               if(param1.allowFollow)
               {
                  _loc6_.visible = true;
                  _loc6_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onControlClick);
               }
               else
               {
                  _loc6_.visible = false;
               }
            }
            _loc3_.addListItem(_loc4_);
         }
         param2.height = _loc3_.height;
         param2.y = const_418 - param2.height;
      }
      
      private function deSelectFriendEntity() : void
      {
         var _loc1_:* = null;
         if(this.var_418 > -1)
         {
            if(this.var_28)
            {
               _loc1_ = IItemListWindow(this.var_28.getChildByName(const_124)).getListItemByID(this.var_418) as IWindowContainer;
               if(_loc1_)
               {
                  this.purgeEntityPieces(_loc1_);
               }
            }
            this.var_418 = -1;
         }
      }
      
      private function purgeEntityPieces(param1:IWindowContainer) : void
      {
         var _loc3_:* = null;
         var _loc2_:IItemListWindow = IItemListWindow(param1.getChildByName(const_124));
         _loc3_ = _loc2_.getListItemByName(const_947) as IWindowContainer;
         if(_loc3_)
         {
            _loc3_.dispose();
         }
         _loc3_ = _loc2_.getListItemByName(const_945) as IWindowContainer;
         if(_loc3_)
         {
            _loc3_.dispose();
         }
         param1.height = const_418;
         param1.y = 0;
      }
      
      private function onRefreshView(param1:Event) : void
      {
         if(!this.isUserInterfaceReady())
         {
            this.buildUserInterface();
         }
         this.resizeAndPopulate();
      }
      
      private function onFriendEntityClick(param1:WindowMouseEvent) : void
      {
         var _loc2_:int = param1.target.id;
         var _loc3_:IFriendEntity = this.var_96.getFriendByID(_loc2_);
         if(this.isFriendEntitySelected(_loc3_))
         {
            this.deSelectFriendEntity();
         }
         else
         {
            this.selectFriendEntity(_loc3_,param1.target as IWindowContainer);
         }
      }
      
      private function onControlClick(param1:WindowMouseEvent) : void
      {
         switch(param1.window.name)
         {
            case const_943:
               if(this.var_96)
               {
                  this.var_96.startConversation(this.var_418);
               }
               break;
            case const_939:
               if(this.var_96)
               {
                  this.var_96.followToRoom(this.var_418);
               }
         }
      }
      
      private function barWindowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:int = 0;
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_DOWN)
         {
            _loc3_ = this._startIndex;
            switch(param2.name)
            {
               case const_944:
                  _loc3_ = Math.max(0,this._startIndex - 1);
                  break;
               case const_1295:
                  _loc3_ = Math.max(0,this._startIndex - this.maxNumFriendsVisible);
                  break;
               case const_1293:
                  _loc3_ = 0;
                  break;
               case const_942:
                  _loc3_ = Math.max(0,Math.min(this.var_96.numFriends - this.maxNumFriendsVisible,this._startIndex + 1));
                  break;
               case const_1294:
                  _loc3_ = Math.max(0,Math.min(this.var_96.numFriends - this.maxNumFriendsVisible,this._startIndex + this.maxNumFriendsVisible));
                  break;
               case const_1296:
                  _loc3_ = Math.max(0,this.var_96.numFriends - this.maxNumFriendsVisible);
                  break;
               case const_1298:
                  this.visible = false;
            }
            if(_loc3_ != this._startIndex)
            {
               this.deSelectFriendEntity();
               this._startIndex = _loc3_;
               this.resizeAndPopulate();
            }
         }
         if(param1.type == WindowEvent.const_484)
         {
            this.deSelectFriendEntity();
         }
      }
      
      private function toggleWindowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(this.var_200.visible)
         {
            if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_DOWN)
            {
               switch(param2.name)
               {
                  case const_1300:
                     this.visible = true;
               }
            }
         }
      }
      
      private function toggleArrowButtons(param1:Boolean) : void
      {
         this.var_28.findChildByName(const_942).visible = param1;
         this.var_28.findChildByName(const_944).visible = param1;
      }
      
      private function resizeAndPopulate() : void
      {
         if(!disposed)
         {
            if(this.var_28)
            {
               this.var_28.width = this.calculateSizeForBar();
               this.var_28.x = Math.max(this.var_28.parent.width / 2 - this.var_28.width / 2,const_941);
               this.populate();
            }
         }
      }
      
      private function calculateSizeForBar() : int
      {
         var _loc1_:IItemListWindow = this.var_28.findChildByName(const_124) as IItemListWindow;
         var _loc2_:int = this._windowManager.getWindowContext(const_329).getDesktopWindow().width - const_941;
         var _loc3_:int = this.var_28.width - _loc1_.width;
         var _loc4_:int = (_loc2_ - _loc3_) / (const_330 + _loc1_.spacing);
         return Math.min(_loc4_,this.var_96.numFriends) * (const_330 + _loc1_.spacing) + _loc3_;
      }
      
      private function onDesktopResized(param1:WindowEvent) : void
      {
         this.resizeAndPopulate();
      }
   }
}
