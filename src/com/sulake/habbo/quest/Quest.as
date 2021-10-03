package com.sulake.habbo.quest
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   import com.sulake.habbo.quest.enum.QuestStatusEnum;
   import flash.events.Event;
   
   public class Quest implements IDisposable
   {
       
      
      private var var_17:IWindowContainer;
      
      private var _region:IRegionWindow;
      
      private var var_63:QuestCampaign;
      
      private var _id:int;
      
      private var var_397:int;
      
      private var _type:String;
      
      private var var_1925:String;
      
      private var var_1924:int;
      
      private var var_1834:Date;
      
      private var var_792:String;
      
      private var var_2576:String;
      
      private var _selected:Boolean = false;
      
      private var var_1452:uint = 7645971;
      
      private var var_1835:uint = 6710886;
      
      private var var_206:IWindow;
      
      private var var_702:Boolean = false;
      
      public function Quest(param1:QuestMessageData, param2:QuestCampaign)
      {
         super();
         this.var_63 = param2;
         this._id = param1.id;
         this.update(param1);
      }
      
      public function dispose() : void
      {
         if(this._region)
         {
            this._region.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.itemGridEventProc);
            this._region.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.itemGridEventProc);
            this._region.removeEventListener(WindowMouseEvent.const_25,this.itemGridEventProc);
         }
         if(this.var_17)
         {
            this.var_17.dispose();
            this.var_17 = null;
         }
         this.var_702 = true;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_702;
      }
      
      public function update(param1:QuestMessageData) : void
      {
         this.var_397 = param1.status;
         this._type = param1.type;
         this.var_1925 = param1.roomItemTypeName;
         this.var_1924 = param1.rewardCurrencyAmount;
         this.var_1834 = new Date();
         this.var_1834.setTime(param1.endDateTimeStamp);
         this.var_792 = param1.localizationCode;
         this.var_2576 = param1.questBadgeAchievementTypeId;
         this.updateView();
      }
      
      private function createView() : void
      {
         switch(this.var_397)
         {
            case QuestStatusEnum.const_46:
               this.var_17 = this.var_63.controller.questEngine.getXmlWindow("QuestEntityAccepted") as IWindowContainer;
               break;
            case QuestStatusEnum.const_405:
               this.var_17 = this.var_63.controller.questEngine.getXmlWindow("QuestEntityAvailable") as IWindowContainer;
               break;
            case QuestStatusEnum.const_194:
               this.var_17 = this.var_63.controller.questEngine.getXmlWindow("QuestEntityExpired") as IWindowContainer;
               break;
            case QuestStatusEnum.const_858:
               this.var_17 = this.var_63.controller.questEngine.getXmlWindow("QuestEntityCompleted") as IWindowContainer;
               break;
            case QuestStatusEnum.const_192:
               this.var_17 = this.var_63.controller.questEngine.getXmlWindow("QuestEntityPreview") as IWindowContainer;
               break;
            default:
               this.var_17 = this.var_63.controller.questEngine.getXmlWindow("QuestEntityExpired") as IWindowContainer;
         }
         if(!this.var_17)
         {
            return;
         }
         this._region = this.var_17.findChildByName("mouse.region") as IRegionWindow;
         this._region.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.itemGridEventProc);
         this._region.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.itemGridEventProc);
         this._region.addEventListener(WindowMouseEvent.const_25,this.itemGridEventProc);
         var _loc1_:IWindow = this.var_17.findChildByTag("SELECTION_COLOR");
         if(_loc1_ != null)
         {
            this.var_1452 = _loc1_.color;
         }
         var _loc2_:IWindow = this.var_17.findChildByTag("SELECTION_BORDER");
         if(_loc2_ != null)
         {
            this.var_1835 = _loc2_.color;
            this.var_206 = _loc2_;
         }
         else
         {
            this.var_206 = this.var_17;
         }
         this.var_206.color = this.var_1452;
      }
      
      private function updateView() : void
      {
         var _loc2_:* = null;
         if(this.var_17 == null)
         {
            this.createView();
         }
         var _loc1_:IBitmapWrapperWindow = this.find(this.var_17,"icon") as IBitmapWrapperWindow;
         switch(this.var_397)
         {
            case QuestStatusEnum.const_46:
               _loc2_ = ["icon",this.var_63.code,"active"].join("_");
               this.var_63.controller.questEngine.setImageFromAsset(_loc1_,_loc2_,this.onPreviewImageReady);
               break;
            case QuestStatusEnum.const_405:
               break;
            case QuestStatusEnum.const_194:
               break;
            case QuestStatusEnum.const_858:
               this.var_63.controller.questEngine.setImageFromAsset(_loc1_,"icon_complete",this.onPreviewImageReady);
         }
         var _loc3_:String = ["quest",this.var_63.code,this.var_792].join("_");
         var _loc4_:* = _loc3_ + ".title";
         var _loc5_:* = _loc3_ + ".short";
         this.setText("quest.title",_loc4_);
         this.setText("quest.short",_loc5_);
      }
      
      public function get endDate() : Date
      {
         return this.var_1834;
      }
      
      private function itemGridEventProc(param1:Event, param2:IWindow = null) : void
      {
         if(param2 == null)
         {
            param2 = param1.target as IWindow;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.var_63.activateListItem(this);
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            if(!this._selected)
            {
               this.var_206.color = this.var_1835;
            }
         }
         else if(param1.type == WindowMouseEvent.const_25)
         {
            if(!this._selected)
            {
               this.var_206.color = this.var_1452;
            }
         }
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this._selected = param1;
         if(this._selected)
         {
            this.var_206.color = this.var_1835;
         }
         else
         {
            this.var_206.color = this.var_1452;
         }
      }
      
      private function setText(param1:String, param2:String, param3:Boolean = true) : void
      {
         var _loc4_:IWindow = this.var_17.findChildByName(param1);
         if(_loc4_)
         {
            if(param3)
            {
               param2 = "${" + param2 + "}";
            }
            _loc4_.caption = param2;
         }
      }
      
      private function setVisible(param1:String, param2:Boolean) : void
      {
         var _loc3_:IWindow = this.var_17.findChildByName(param1);
         if(_loc3_)
         {
            _loc3_.visible = param2;
         }
      }
      
      private function find(param1:IWindowContainer, param2:String) : IWindow
      {
         var _loc3_:IWindow = param1.findChildByName(param2);
         if(_loc3_ == null)
         {
            throw new Error("Window element with name: " + param2 + " cannot be found!");
         }
         return _loc3_;
      }
      
      private function onPreviewImageReady(param1:AssetLoaderEvent) : void
      {
         var _loc3_:* = null;
         if(this.var_702)
         {
            return;
         }
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(_loc2_ != null)
         {
            _loc3_ = this.find(this.var_17,"icon") as IBitmapWrapperWindow;
            this.var_63.controller.questEngine.setImageFromAsset(_loc3_,_loc2_.assetName,this.onPreviewImageReady);
         }
      }
      
      public function get view() : IWindowContainer
      {
         return this.var_17;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get status() : int
      {
         return this.var_397;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get roomItemTypeName() : String
      {
         return this.var_1925;
      }
      
      public function get rewardCurrencyAmount() : int
      {
         return this.var_1924;
      }
      
      public function get localizationCode() : String
      {
         return this.var_792;
      }
      
      public function get questBadgeAchievementTypeId() : String
      {
         return this.var_2576;
      }
   }
}
