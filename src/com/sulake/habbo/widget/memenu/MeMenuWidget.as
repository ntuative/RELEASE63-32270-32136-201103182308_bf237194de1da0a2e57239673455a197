package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarActionUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPurseUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomEngineUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetWaveUpdateEvent;
   import com.sulake.habbo.widget.memenu.enum.HabboMeMenuTrackingEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectOutfitMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetToolbarMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   
   public class MeMenuWidget extends RoomWidgetBase
   {
      
      public static const const_110:String = "me_menu_top_view";
      
      public static const const_1669:String = "me_menu_rooms_view";
      
      public static const const_288:String = "me_menu_my_clothes_view";
      
      public static const const_1027:String = "me_menu_dance_moves_view";
      
      public static const const_792:String = "me_menu_effects_view";
      
      public static const const_628:String = "me_menu_settings_view";
      
      public static const const_840:String = "me_menu_sound_settings";
      
      private static const const_1423:int = 5000;
       
      
      private var var_45:IMeMenuView;
      
      private var _mainContainer:IWindowContainer;
      
      private var _eventDispatcher:IEventDispatcher;
      
      private var var_1264:Point;
      
      private var var_1533:int = 0;
      
      private var var_2795:int = 0;
      
      private var var_2794:int = 0;
      
      private var var_2796:Boolean = false;
      
      private var var_1995:int = 0;
      
      private var var_1265:Boolean = false;
      
      private var var_2798:Boolean = false;
      
      private var var_450:Boolean = false;
      
      private var var_2614:int = 0;
      
      private var var_2797:Boolean = false;
      
      private var var_1994:int = 0;
      
      private var var_1992:Boolean = false;
      
      private var _config:IHabboConfigurationManager;
      
      public function MeMenuWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IEventDispatcher, param5:IHabboConfigurationManager)
      {
         super(param1,param2,param3);
         this._config = param5;
         this.var_1264 = new Point(0,0);
         this._eventDispatcher = param4;
         if(param5 != null && false)
         {
            this.var_2797 = param5.getKey("client.news.embed.enabled","HabboRoomWidgetLib_user_tag_highlighted") == "true";
         }
         this.changeView(const_110);
         this.hide();
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         this.hide();
         this._eventDispatcher = null;
         if(this.var_45 != null)
         {
            this.var_45.dispose();
            this.var_45 = null;
         }
         super.dispose();
      }
      
      override public function get mainWindow() : IWindow
      {
         return this._mainContainer;
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetWaveUpdateEvent.const_685,this.onWaveEvent);
         param1.addEventListener(RoomWidgetDanceUpdateEvent.const_833,this.onDanceEvent);
         param1.addEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_801,this.onUpdateEffects);
         param1.addEventListener(RoomWidgetToolbarClickedUpdateEvent.const_630,this.onToolbarClicked);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_677,this.onAvatarEditorClosed);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_681,this.onHideAvatarEditor);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_130,this.onAvatarDeselected);
         param1.addEventListener(RoomWidgetHabboClubUpdateEvent.const_236,this.onHabboClubEvent);
         param1.addEventListener(RoomWidgetAvatarActionUpdateEvent.const_732,this.onAvatarActionEvent);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_122,this.onUserInfo);
         param1.addEventListener(RoomWidgetSettingsUpdateEvent.const_355,this.onSettingsUpdate);
         param1.addEventListener(RoomWidgetTutorialEvent.const_123,this.onTutorialEvent);
         param1.addEventListener(RoomWidgetTutorialEvent.const_562,this.onTutorialEvent);
         param1.addEventListener(RoomWidgetPurseUpdateEvent.const_66,this.onCreditBalance);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_89,this.onNormalMode);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_351,this.onGameMode);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetWaveUpdateEvent.const_685,this.onWaveEvent);
         param1.removeEventListener(RoomWidgetDanceUpdateEvent.const_833,this.onDanceEvent);
         param1.removeEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_801,this.onUpdateEffects);
         param1.removeEventListener(RoomWidgetToolbarClickedUpdateEvent.const_630,this.onToolbarClicked);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_130,this.onAvatarDeselected);
         param1.removeEventListener(RoomWidgetHabboClubUpdateEvent.const_236,this.onHabboClubEvent);
         param1.removeEventListener(RoomWidgetAvatarActionUpdateEvent.const_732,this.onAvatarActionEvent);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_677,this.onHideAvatarEditor);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_681,this.onAvatarEditorClosed);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_122,this.onUserInfo);
         param1.removeEventListener(RoomWidgetSettingsUpdateEvent.const_355,this.onSettingsUpdate);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_562,this.onTutorialEvent);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_123,this.onTutorialEvent);
         param1.removeEventListener(RoomWidgetPurseUpdateEvent.const_66,this.onCreditBalance);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_89,this.onNormalMode);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_89,this.onGameMode);
      }
      
      public function hide(param1:RoomWidgetRoomObjectUpdateEvent = null) : void
      {
         var _loc2_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_790);
         _loc2_.window = this._mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc2_);
         }
         if(this.var_45 != null)
         {
            this._mainContainer.removeChild(this.var_45.window);
            this.var_45.dispose();
            this.var_45 = null;
         }
         this.var_450 = false;
         this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_CLOSE));
      }
      
      private function show() : void
      {
         if(!this._mainContainer || !this._mainContainer.parent)
         {
            return;
         }
         this.changeView(const_110);
         var _loc1_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_851);
         _loc1_.window = this._mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc1_);
         }
         this.var_450 = true;
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(!(this.var_450 && this.var_45.window.name == const_288))
         {
            _loc2_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_846);
            if(messageListener != null)
            {
               if(!this.var_1992)
               {
                  messageListener.processWidgetMessage(_loc2_);
               }
            }
         }
      }
      
      private function onSettingsUpdate(param1:RoomWidgetSettingsUpdateEvent) : void
      {
         if(!this.var_450)
         {
            return;
         }
         if(this.var_45.window.name == const_840)
         {
            (this.var_45 as MeMenuSoundSettingsView).updateSettings(param1);
         }
      }
      
      private function onTutorialEvent(param1:RoomWidgetTutorialEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetTutorialEvent.const_562:
               Logger.log("* MeMenuWidget: onHighlightClothesIcon " + this.var_450 + " view: " + this.var_45.window.name);
               if(this.var_450 != true || this.var_45.window.name != const_110)
               {
                  return;
               }
               (this.var_45 as MeMenuMainView).setIconAssets("clothes_icon",const_110,"clothes_highlighter_blue");
               break;
            case RoomWidgetTutorialEvent.const_123:
               this.hide();
         }
      }
      
      private function onToolbarClicked(param1:RoomWidgetToolbarClickedUpdateEvent) : void
      {
         switch(param1.iconType)
         {
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ME_MENU:
               this.var_450 = !this.var_450;
               break;
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ROOM_INFO:
               this.var_450 = false;
               break;
            default:
               return;
         }
         if(this.var_450)
         {
            this.show();
         }
         else
         {
            this.hide();
         }
      }
      
      private function onUpdateEffects(param1:RoomWidgetUpdateEffectsUpdateEvent) : void
      {
         var _loc2_:* = null;
         this.var_1265 = false;
         for each(_loc2_ in param1.effects)
         {
            if(_loc2_.isInUse)
            {
               this.var_1265 = true;
            }
         }
         if(this.var_45 != null && this.var_45.window.name == const_792)
         {
            (this.var_45 as MeMenuEffectsView).updateEffects(param1.effects);
         }
      }
      
      private function onAvatarDeselected(param1:Event) : void
      {
         if(this.var_45 != null && this.var_45.window.name != const_288)
         {
            this.hide();
         }
      }
      
      private function onAvatarEditorClosed(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(this.var_45 != null && this.var_45.window.name == const_288)
         {
            this.changeView(const_110);
         }
      }
      
      private function onHideAvatarEditor(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(this.var_45 != null && this.var_45.window.name == const_288)
         {
            this.changeView(const_110);
         }
      }
      
      private function onWaveEvent(param1:RoomWidgetWaveUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Wave Event received");
      }
      
      private function onDanceEvent(param1:RoomWidgetDanceUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Dance Event received, style: " + param1.style);
      }
      
      private function onHabboClubEvent(param1:RoomWidgetHabboClubUpdateEvent) : void
      {
         var _loc2_:* = param1.daysLeft != this.var_1533;
         this.var_1533 = param1.daysLeft;
         this.var_2795 = param1.periodsLeft;
         this.var_2794 = param1.pastPeriods;
         this.var_2796 = param1.allowClubDances;
         _loc2_ = Boolean(_loc2_ || param1.clubLevel != this.var_1995);
         this.var_1995 = param1.clubLevel;
         if(_loc2_)
         {
            if(this.var_45 != null)
            {
               this.changeView(this.var_45.window.name);
            }
         }
      }
      
      private function onAvatarActionEvent(param1:RoomWidgetAvatarActionUpdateEvent) : void
      {
         switch(param1.actionType)
         {
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_ACTIVE:
               this.var_1265 = true;
               break;
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_INACTIVE:
               this.var_1265 = false;
         }
      }
      
      private function onCreditBalance(param1:RoomWidgetPurseUpdateEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.var_1994 = param1.balance;
         localizations.registerParameter("widget.memenu.credits","credits",this.var_1994.toString());
      }
      
      private function onNormalMode(param1:RoomWidgetRoomEngineUpdateEvent) : void
      {
         this.var_1992 = false;
      }
      
      private function onGameMode(param1:RoomWidgetRoomEngineUpdateEvent) : void
      {
         this.var_1992 = true;
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(this._mainContainer == null)
         {
            this._mainContainer = windowManager.createWindow("me_menu_main_container","",HabboWindowType.const_1513,HabboWindowStyle.const_1007,HabboWindowParam.const_42,new Rectangle(0,0,170,260)) as IWindowContainer;
            this._mainContainer.tags.push("room_widget_me_menu");
         }
         return this._mainContainer;
      }
      
      public function changeView(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case const_110:
               _loc2_ = new MeMenuMainView();
               this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DEFAULT));
               break;
            case const_792:
               _loc2_ = new MeMenuEffectsView();
               this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_EFFECTS));
               break;
            case const_1027:
               _loc2_ = new MeMenuDanceView();
               this._eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DANCE));
               break;
            case const_288:
               _loc2_ = new MeMenuClothesView();
               break;
            case const_1669:
               _loc2_ = new MeMenuRoomsView();
               break;
            case const_628:
               _loc2_ = new MeMenuSettingsMenuView();
               break;
            case const_840:
               _loc2_ = new MeMenuSoundSettingsView();
               break;
            default:
               Logger.log("Me Menu Change view: unknown view: " + param1);
         }
         if(_loc2_ != null)
         {
            if(this.var_45 != null)
            {
               this._mainContainer.removeChild(this.var_45.window);
               this.var_45.dispose();
               this.var_45 = null;
            }
            this.var_45 = _loc2_;
            this.var_45.init(this,param1);
         }
         this.updateSize();
      }
      
      public function updateSize() : void
      {
         if(this.var_45 != null)
         {
            this.var_1264.x = this.var_45.window.width + 10;
            this.var_1264.y = this.var_45.window.height;
            this.var_45.window.x = 5;
            this.var_45.window.y = 0;
            this._mainContainer.width = this.var_1264.x;
            this._mainContainer.height = this.var_1264.y;
         }
      }
      
      public function get allowHabboClubDances() : Boolean
      {
         return this.var_2796;
      }
      
      public function get isHabboClubActive() : Boolean
      {
         return this.var_1533 > 0;
      }
      
      public function get habboClubDays() : int
      {
         return this.var_1533;
      }
      
      public function get habboClubPeriods() : int
      {
         return this.var_2795;
      }
      
      public function get habboClubPastPeriods() : int
      {
         return this.var_2794;
      }
      
      public function get habboClubLevel() : int
      {
         return this.var_1995;
      }
      
      public function get isNewsEnabled() : Boolean
      {
         return this.var_2797;
      }
      
      public function get creditBalance() : int
      {
         return this.var_1994;
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return this._config;
      }
      
      public function changeToOutfit(param1:int) : void
      {
         this.var_2614 = getTimer();
         this.messageListener.processWidgetMessage(new RoomWidgetSelectOutfitMessage(param1));
      }
      
      public function canChangeOutfit() : Boolean
      {
         var _loc1_:Number = getTimer();
         return _loc1_ - this.var_2614 > const_1423;
      }
      
      public function get hasEffectOn() : Boolean
      {
         return this.var_1265;
      }
      
      public function get isDancing() : Boolean
      {
         return this.var_2798;
      }
      
      public function set isDancing(param1:Boolean) : void
      {
         this.var_2798 = param1;
      }
   }
}
