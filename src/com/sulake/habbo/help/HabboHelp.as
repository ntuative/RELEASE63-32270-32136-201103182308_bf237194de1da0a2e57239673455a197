package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.hotelmerge.HotelMergeUI;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var var_188:IHabboToolbar;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_291:IHabboCommunicationManager;
      
      private var var_878:IHabboLocalizationManager;
      
      private var var_703:IHabboConfigurationManager;
      
      private var var_321:ISessionDataManager;
      
      private var var_1088:FaqIndex;
      
      private var var_1397:IncomingMessages;
      
      private var var_65:HelpUI;
      
      private var var_105:TutorialUI;
      
      private var var_704:HotelMergeUI;
      
      private var var_1356:CallForHelpData;
      
      private var var_2245:UserRegistry;
      
      private var var_2246:String = "";
      
      private var var_587:WelcomeScreenController;
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         this.var_1356 = new CallForHelpData();
         this.var_2245 = new UserRegistry();
         super(param1,param2,param3);
         this._assetLibrary = param3;
         this.var_1088 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
         queueInterface(new IIDSessionDataManager(),this.onSessionDataManagerReady);
      }
      
      public function set ownUserName(param1:String) : void
      {
         this.var_2246 = param1;
      }
      
      public function get ownUserName() : String
      {
         return this.var_2246;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return this.var_1356;
      }
      
      public function get userRegistry() : UserRegistry
      {
         return this.var_2245;
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this.var_878;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return this.var_188;
      }
      
      public function get sessionDataManager() : ISessionDataManager
      {
         return this.var_321;
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return this.var_105;
      }
      
      public function get hotelMergeUI() : HotelMergeUI
      {
         return this.var_704;
      }
      
      public function hasChangedName() : Boolean
      {
         if(this.var_105)
         {
            return this.var_105.hasChangedName;
         }
         return true;
      }
      
      override public function dispose() : void
      {
         if(this.var_65 != null)
         {
            this.var_65.dispose();
            this.var_65 = null;
         }
         if(this.var_105 != null)
         {
            this.var_105.dispose();
            this.var_105 = null;
         }
         if(this.var_704)
         {
            this.var_704.dispose();
            this.var_704 = null;
         }
         if(this.var_1088 != null)
         {
            this.var_1088.dispose();
            this.var_1088 = null;
         }
         this.var_1397 = null;
         if(this.var_188)
         {
            this.var_188.release(new IIDHabboToolbar());
            this.var_188 = null;
         }
         if(this.var_878)
         {
            this.var_878.release(new IIDHabboLocalizationManager());
            this.var_878 = null;
         }
         if(this.var_291)
         {
            this.var_291.release(new IIDHabboCommunicationManager());
            this.var_291 = null;
         }
         if(this.var_703)
         {
            this.var_703.release(new IIDHabboConfigurationManager());
            this.var_703 = null;
         }
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this.var_321 != null)
         {
            this.var_321.release(new IIDSessionDataManager());
            this.var_321 = null;
         }
         if(this.var_587 != null)
         {
            this.var_587.dispose();
            this.var_587 = null;
         }
         super.dispose();
      }
      
      public function showUI(param1:String = null) : void
      {
         if(this.var_65 != null)
         {
            this.var_65.showUI(param1);
         }
      }
      
      public function hideUI() : void
      {
         if(this.var_65 != null)
         {
            this.var_65.hideUI();
         }
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(this.var_65 != null)
         {
            this.var_65.tellUI(param1,param2);
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(this.var_65 != null)
         {
            this.var_65.updateCallForGuideBotUI(true);
         }
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(this.var_65 != null)
         {
            this.var_65.updateCallForGuideBotUI(false);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return this.var_1088;
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(this.var_291 != null && param1 != null)
         {
            this.var_291.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(this.var_703 == null)
         {
            return param1;
         }
         return this.var_703.getKey(param1,param2,param3);
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(this.var_65 != null)
         {
            this.var_65.showCallForHelpReply(param1);
         }
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(this.var_65 != null)
         {
            this.var_65.showCallForHelpResult(param1);
         }
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         this.var_1356.reportedUserId = param1;
         this.var_1356.reportedUserName = param2;
         this.var_65.showUI(HabboHelpViewEnum.const_343);
      }
      
      private function toggleHelpUI() : void
      {
         if(this.var_65 == null)
         {
            if(!this.createHelpUI())
            {
               return;
            }
         }
         this.var_65.toggleUI();
      }
      
      private function createHelpUI() : Boolean
      {
         if(this.var_65 == null && this._assetLibrary != null && this._windowManager != null)
         {
            this.var_65 = new HelpUI(this,this._assetLibrary,this._windowManager,this.var_878,this.var_188);
         }
         return this.var_65 != null;
      }
      
      private function createTutorialUI() : Boolean
      {
         var _loc1_:* = false;
         if(this.var_105 == null && this._assetLibrary != null && this._windowManager != null)
         {
            _loc1_ = this.getConfigurationKey("avatar.widget.enabled","0") == "0";
            this.var_105 = new TutorialUI(this,_loc1_);
         }
         return this.var_105 != null;
      }
      
      public function removeTutorialUI() : void
      {
         if(this.var_105 != null)
         {
            this.var_105.dispose();
            this.var_105 = null;
         }
      }
      
      public function initHotelMergeUI() : void
      {
         if(!this.var_704)
         {
            this.var_704 = new HotelMergeUI(this);
         }
         this.var_704.startNameChange();
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            this.removeTutorialUI();
            return;
         }
         if(this.var_105 == null)
         {
            if(!this.createTutorialUI())
            {
               return;
            }
         }
         this.var_105.update(param1,param2,param3);
      }
      
      public function startNameChange() : void
      {
         if(this.var_105)
         {
            this.var_105.showView(TutorialUI.const_313);
         }
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerReady);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_291 = IHabboCommunicationManager(param2);
         this.var_1397 = new IncomingMessages(this,this.var_291);
         queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_188 = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_878 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_703 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),this.onRoomSessionManagerReady);
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_87,this.onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_94,this.onRoomSessionEvent);
         this.var_188.events.addEventListener(HabboToolbarEvent.const_64,this.onHabboToolbarEvent);
         this.var_188.events.addEventListener(HabboToolbarEvent.const_38,this.onHabboToolbarEvent);
         this.createHelpUI();
         this.setHabboToolbarIcon();
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         this.var_321 = param2 as ISessionDataManager;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_87:
               if(this.var_65 != null)
               {
                  this.var_65.setRoomSessionStatus(true);
               }
               if(this.var_105 != null)
               {
                  this.var_105.setRoomSessionStatus(true);
               }
               this.showWelcomeScreen(true);
               break;
            case RoomSessionEvent.const_94:
               if(this.var_65 != null)
               {
                  this.var_65.setRoomSessionStatus(false);
               }
               if(this.var_105 != null)
               {
                  this.var_105.setRoomSessionStatus(false);
               }
               this.userRegistry.unregisterRoom();
               this.showWelcomeScreen(false);
         }
      }
      
      private function showWelcomeScreen(param1:Boolean) : void
      {
         if(!this.var_587)
         {
            this.var_587 = new WelcomeScreenController(this,this._windowManager,this.var_703);
         }
         this.var_587.showWelcomeScreen(param1);
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(this.var_188 != null)
         {
            this.var_188.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_134,HabboToolbarIconEnum.HELP));
         }
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_64)
         {
            this.setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_38)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               this.toggleHelpUI();
               return;
            }
         }
      }
      
      public function setWelcomeScreenCategory(param1:String, param2:String = "", param3:String = "") : void
      {
         if(!this.var_587)
         {
            this.showWelcomeScreen(true);
         }
         this.var_587.setCategory(param1,param2,param3);
      }
   }
}
