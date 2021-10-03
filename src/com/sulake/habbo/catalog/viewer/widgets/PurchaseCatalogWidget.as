package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetPurchaseOverrideEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_2214:XML;
      
      private var var_2212:XML;
      
      private var var_2215:XML;
      
      private var var_874:IWindowContainer;
      
      private var var_583:IButtonWindow;
      
      private var var_2889:IButtonWindow;
      
      private var var_1652:ITextWindow;
      
      private var var_1650:ITextWindow;
      
      private var var_1651:ITextWindow;
      
      private var var_2847:ITextWindow;
      
      private var var_92:Offer;
      
      private var var_2213:String = "";
      
      private var var_1347:Function;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      override public function dispose() : void
      {
         events.removeEventListener(WidgetEvent.CWE_SELECT_PRODUCT,this.onSelectProduct);
         events.removeEventListener(WidgetEvent.const_745,this.onSetParameter);
         events.removeEventListener(WidgetEvent.CWE_PURCHASE_OVERRIDE,this.onPurchaseOverride);
         super.dispose();
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            this.var_2214 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            this.var_2212 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            this.var_2215 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,this.onSelectProduct);
         events.addEventListener(WidgetEvent.const_745,this.onSetParameter);
         events.addEventListener(WidgetEvent.CWE_PURCHASE_OVERRIDE,this.onPurchaseOverride);
         return true;
      }
      
      private function onPurchaseOverride(param1:CatalogWidgetPurchaseOverrideEvent) : void
      {
         this.var_1347 = param1.callback;
      }
      
      private function attachStub(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case Offer.const_696:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2214) as IWindowContainer;
               break;
            case Offer.const_1080:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2212) as IWindowContainer;
               break;
            case Offer.const_1046:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_2215) as IWindowContainer;
               break;
            default:
               Logger.log("Unknown price-type, can\'t attach..." + this.var_92.priceType);
         }
         if(_loc2_ != null)
         {
            if(this.var_874 != null)
            {
               _window.removeChild(this.var_874);
               this.var_874.dispose();
            }
            this.var_874 = _loc2_;
            _window.addChild(_loc2_);
            this.var_874.x = 0;
            this.var_874.y = 0;
         }
         this.var_1652 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         this.var_1650 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         this.var_1651 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         this.var_2847 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         this.var_583 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         if(this.var_583 != null)
         {
            if(this.var_1347 != null)
            {
               this.var_583.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.var_1347);
            }
            else
            {
               this.var_583.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.var_1347);
               this.var_583.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onPurchase);
            }
            this.var_583.disable();
         }
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc4_:* = null;
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         this.var_92 = param1.offer;
         this.attachStub(this.var_92.priceType);
         if(this.var_1652 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(this.var_92.priceInCredits));
            this.var_1652.caption = "${catalog.purchase.price.credits}";
         }
         var _loc3_:String = this.var_92.activityPointType == Purse.const_179 ? "pixels" : "activitypoints";
         if(this.var_1650 != null)
         {
            _loc4_ = "catalog.purchase.price.activitypoints." + this.var_92.activityPointType;
            _loc2_.registerParameter(_loc4_,_loc3_,this.var_92.priceInActivityPoints.toString());
            this.var_1650.caption = _loc2_.getKey(_loc4_);
         }
         if(this.var_1651 != null)
         {
            _loc4_ = "catalog.purchase.price.credits+activitypoints." + this.var_92.activityPointType;
            _loc2_.registerParameter(_loc4_,"credits",String(this.var_92.priceInCredits));
            _loc2_.registerParameter(_loc4_,_loc3_,String(this.var_92.priceInActivityPoints));
            this.var_1651.caption = _loc2_.getKey(_loc4_);
         }
         var _loc5_:IWindow = _window.findChildByName("activity_points_bg");
         if(_loc5_ != null)
         {
            _loc5_.color = this.var_92.activityPointType == 0 ? 6737151 : uint(13421772);
         }
         if(this.var_583 != null)
         {
            this.var_583.enable();
         }
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         this.var_2213 = param1.parameter;
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(this.var_92 != null)
         {
            Logger.log("Init Purchase: " + this.var_92.offerId + " " + this.var_92.localizationId);
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(this.var_92,page.pageId,this.var_2213);
         }
      }
   }
}
