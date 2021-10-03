package com.sulake.habbo.help.tutorial
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.ChangeUserNameResultMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.CheckUserNameResultMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.avatar.ChangeUserNameMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.avatar.CheckUserNameMessageComposer;
   import com.sulake.habbo.communication.messages.parser.avatar.ChangeUserNameResultMessageParser;
   import com.sulake.habbo.communication.messages.parser.avatar.CheckUserNameResultMessageParser;
   import com.sulake.habbo.help.HabboHelp;
   import com.sulake.habbo.help.INameChangeUI;
   import com.sulake.habbo.help.enum.HabboHelpTutorialEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.events.HabboSessionFigureUpdatedEvent;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.events.Event;
   
   public class TutorialUI implements INameChangeUI
   {
      
      public static const const_90:String = "TUI_MAIN_VIEW";
      
      public static const const_313:String = "TUI_NAME_VIEW";
      
      public static const const_346:String = "TUI_CLOTHES_VIEW";
      
      public static const const_540:String = "TUI_GUIDEBOT_VIEW";
       
      
      private var var_2452:int = 0;
      
      private var var_2453:int = 0;
      
      private var var_35:HabboHelp;
      
      private var _window:IFrameWindow;
      
      private var var_45:ITutorialUIView;
      
      private var var_372:NameChangeView;
      
      private var var_1194:Boolean = false;
      
      private var var_1193:Boolean = false;
      
      private var var_1460:Boolean = false;
      
      private var var_1858:Boolean = false;
      
      private var var_2595:Boolean;
      
      public function TutorialUI(param1:HabboHelp, param2:Boolean = true)
      {
         super();
         this.var_35 = param1;
         this.var_2595 = param2;
         this.var_35.events.addEventListener(HabboHelpTutorialEvent.const_572,this.onTaskDoneEvent);
         this.var_35.events.addEventListener(HabboHelpTutorialEvent.const_555,this.onTaskDoneEvent);
         this.var_35.events.addEventListener(HabboHelpTutorialEvent.const_427,this.onTaskDoneEvent);
         if(this.var_35.sessionDataManager != null)
         {
            this.var_35.sessionDataManager.events.addEventListener(HabboSessionFigureUpdatedEvent.const_285,this.onFigureUpdate);
         }
      }
      
      public function get help() : HabboHelp
      {
         return this.var_35;
      }
      
      public function get assets() : IAssetLibrary
      {
         return this.var_35.assets;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this.var_35.localization;
      }
      
      public function get myName() : String
      {
         return this.var_35.ownUserName;
      }
      
      public function get hasTasksDone() : Boolean
      {
         return this.var_1194 && this.var_1193 && this.var_1460;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1194;
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1193;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1460;
      }
      
      public function dispose() : void
      {
         this.disposeView();
         if(this.var_35)
         {
            this.var_35.events.removeEventListener(HabboHelpTutorialEvent.const_572,this.onTaskDoneEvent);
            this.var_35.events.removeEventListener(HabboHelpTutorialEvent.const_555,this.onTaskDoneEvent);
            this.var_35.events.removeEventListener(HabboHelpTutorialEvent.const_427,this.onTaskDoneEvent);
            if(this.var_35.sessionDataManager != null)
            {
               this.var_35.sessionDataManager.events.removeEventListener(HabboSessionFigureUpdatedEvent.const_285,this.onFigureUpdate);
            }
            this.var_35 = null;
         }
      }
      
      public function update(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         this.var_1194 = param1;
         this.var_1193 = param2;
         this.var_1460 = param3;
         if(this.var_45 == null || this.var_45.id == const_90)
         {
            this.method_3();
            this.showView(const_90);
         }
      }
      
      public function onTaskDoneEvent(param1:HabboHelpTutorialEvent) : void
      {
         switch(param1.type)
         {
            case HabboHelpTutorialEvent.const_572:
               this.var_1460 = true;
               if(this.var_45 != null && this.var_45.id == const_540)
               {
                  this.showView(const_90);
               }
               break;
            case HabboHelpTutorialEvent.const_555:
               if(this.var_45 != null && this.var_45.id == const_346)
               {
                  this.var_1858 = true;
                  this.disposeWindow();
               }
               break;
            case HabboHelpTutorialEvent.const_427:
               if(this.var_1858)
               {
                  this.var_1858 = false;
                  this.showView(const_90);
               }
         }
      }
      
      public function showView(param1:String) : void
      {
         var _loc2_:* = null;
         if(this.hasTasksDone)
         {
            if(this.var_35)
            {
               this.var_35.removeTutorialUI();
            }
            return;
         }
         var _loc3_:Boolean = false;
         if(this._window == null)
         {
            this._window = this.buildXmlWindow("tutorial_frame") as IFrameWindow;
            if(this._window == null)
            {
               return;
            }
            this._window.procedure = this.windowProcedure;
            _loc2_ = this._window.findChildByName("content_list") as IItemListWindow;
            if(_loc2_ == null)
            {
               return;
            }
            this.var_2452 = this._window.width - _loc2_.width;
            this.var_2453 = this._window.height;
            _loc3_ = true;
         }
         _loc2_ = this._window.findChildByName("content_list") as IItemListWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.destroyListItems();
         _loc2_.height = 0;
         if(this.var_45 != null)
         {
            this.var_45.dispose();
         }
         this._window.visible = true;
         switch(param1)
         {
            case const_90:
               if(this.var_372 != null)
               {
                  this.var_372.dispose();
               }
               if(this.var_2595)
               {
                  this.var_45 = new TutorialMainView(_loc2_,this);
                  break;
               }
               this._window.visible = false;
               return;
               break;
            case const_313:
               this._window.visible = false;
               if(this.var_372 == null)
               {
                  this.var_372 = new NameChangeView(this);
               }
               this.var_372.showMainView();
               this.method_3();
               break;
            case const_346:
               this.var_45 = new TutorialClothesChangeView(_loc2_,this);
               break;
            case const_540:
               this.var_45 = new TutorialCallGuideBotView(_loc2_,this);
         }
         this._window.height = _loc2_.height + this.var_2453;
         this._window.width = _loc2_.width + this.var_2452;
         if(_loc3_)
         {
            if(this._window == null)
            {
               return;
            }
            this._window.x = this._window.context.getDesktopWindow().width / 2 - this._window.width / 2;
            this._window.y = 0;
         }
      }
      
      public function buildXmlWindow(param1:String, param2:uint = 1) : IWindow
      {
         if(this.var_35 == null || this.var_35.assets == null)
         {
            return null;
         }
         var _loc3_:XmlAsset = XmlAsset(this.var_35.assets.getAssetByName(param1 + "_xml"));
         if(_loc3_ == null || this.var_35.windowManager == null)
         {
            return null;
         }
         var _loc4_:ICoreWindowManager = ICoreWindowManager(this.var_35.windowManager);
         return _loc4_.buildFromXML(XML(_loc3_.content),param2);
      }
      
      private function disposeWindow(param1:WindowEvent = null) : void
      {
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
      }
      
      private function disposeView() : void
      {
         if(this.var_45 != null)
         {
            this.var_45.dispose();
            this.var_45 = null;
         }
         if(this.var_372 != null)
         {
            this.var_372.dispose();
            this.var_372 = null;
         }
         this.disposeWindow();
      }
      
      public function setRoomSessionStatus(param1:Boolean) : void
      {
         if(param1 == false)
         {
            this.disposeView();
         }
      }
      
      public function method_3() : void
      {
         if(this.var_35 == null || this.var_35.events == null)
         {
            return;
         }
         this.var_35.hideUI();
         this.var_35.events.dispatchEvent(new HabboHelpTutorialEvent(HabboHelpTutorialEvent.const_123));
      }
      
      public function windowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(param2.name == "header_button_close")
               {
                  this.disposeView();
               }
         }
      }
      
      public function changeName(param1:String) : void
      {
         this.disposeWindow();
         this.var_35.sendMessage(new ChangeUserNameMessageComposer(param1));
      }
      
      public function checkName(param1:String) : void
      {
         this.disposeWindow();
         this.var_35.sendMessage(new CheckUserNameMessageComposer(param1));
      }
      
      public function onUserNameChanged(param1:String) : void
      {
         var name:String = param1;
         if(!this.var_35 || !this.var_35.localization || !this.var_35.windowManager)
         {
            return;
         }
         this.var_1193 = true;
         this.var_35.localization.registerParameter("help.tutorial.name.changed","name",name);
         this.var_35.windowManager.alert("${generic.notice}","${help.tutorial.name.changed}",0,function(param1:IAlertDialog, param2:Event):void
         {
            param1.dispose();
         });
         if(this.var_45 != null && (this.var_45.id == const_313 || this.var_45.id == const_90))
         {
            this.showView(const_90);
         }
      }
      
      private function onFigureUpdate(param1:HabboSessionFigureUpdatedEvent) : void
      {
         var _loc2_:* = false;
         if(this.var_35 == null || param1 == null)
         {
            return;
         }
         if(!this.var_1194)
         {
            if(this.var_35.sessionDataManager != null)
            {
               _loc2_ = param1.userId == this.var_35.sessionDataManager.userId;
               if(_loc2_)
               {
                  this.var_35.sessionDataManager.events.removeEventListener(HabboSessionFigureUpdatedEvent.const_285,this.onFigureUpdate);
                  this.onUserChanged();
               }
            }
         }
      }
      
      public function onUserChanged() : void
      {
         this.var_1194 = true;
         if(this.var_45 != null && (this.var_45.id == const_346 || this.var_45.id == const_90))
         {
            this.showView(const_90);
         }
      }
      
      public function onChangeUserNameResult(param1:ChangeUserNameResultMessageEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:ChangeUserNameResultMessageParser = param1.getParser();
         if(_loc2_.resultCode == ChangeUserNameResultMessageEvent.var_550)
         {
            this.var_1193 = true;
            this.showView(TutorialUI.const_90);
         }
         else
         {
            this.var_372.setNameNotAvailableView(_loc2_.resultCode,_loc2_.name,_loc2_.nameSuggestions);
         }
      }
      
      public function onCheckUserNameResult(param1:CheckUserNameResultMessageEvent) : void
      {
         if(!param1)
         {
            return;
         }
         var _loc2_:CheckUserNameResultMessageParser = param1.getParser();
         if(_loc2_.resultCode == ChangeUserNameResultMessageEvent.var_550)
         {
            this.var_372.checkedName = _loc2_.name;
         }
         else
         {
            this.var_372.setNameNotAvailableView(_loc2_.resultCode,_loc2_.name,_loc2_.nameSuggestions);
         }
      }
   }
}
