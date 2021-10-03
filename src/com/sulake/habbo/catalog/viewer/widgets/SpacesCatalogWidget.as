package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.IProduct;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class SpacesCatalogWidget extends CatalogWidget implements ICatalogWidget, IGetImageListener
   {
      
      private static const const_213:String = "floor";
      
      private static const const_212:String = "wallpaper";
      
      private static const TYPE_LANDSCAPE:String = "landscape";
       
      
      private var var_178:XML;
      
      private var var_1540:Array;
      
      private var var_1028:Array;
      
      private var var_453:int = 0;
      
      private var var_455:int = 0;
      
      private var var_1030:int = 0;
      
      private var var_1765:String = "GetPetInventoryComposer";
      
      private var var_1539:Array;
      
      private var _activeFloorPatterns:Array;
      
      private var var_454:int = 0;
      
      private var var_546:int = 0;
      
      private var var_1031:int = 0;
      
      private var _floorType:String = "GetPetInventoryComposer";
      
      private var var_1538:Array;
      
      private var var_1029:Array;
      
      private var var_452:int = 0;
      
      private var var_547:int = 0;
      
      private var var_1032:int = 0;
      
      private var var_1763:String = "1.1";
      
      private var var_2006:int = -1;
      
      private var var_2005:int = -1;
      
      private var var_393:BitmapData = null;
      
      private var var_392:BitmapData = null;
      
      public function SpacesCatalogWidget(param1:IWindowContainer)
      {
         this.var_1540 = [];
         this.var_1028 = [];
         this.var_1539 = [];
         this._activeFloorPatterns = [];
         this.var_1538 = [];
         this.var_1029 = [];
         super(param1);
      }
      
      override public function dispose() : void
      {
         if(this.var_393 != null)
         {
            this.var_393.dispose();
            this.var_393 = null;
         }
         if(this.var_392 != null)
         {
            this.var_392.dispose();
            this.var_392 = null;
         }
         super.dispose();
      }
      
      override public function init() : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:Boolean = false;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         if(!super.init())
         {
            return false;
         }
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("configuration_catalog_spaces") as XmlAsset;
         if(_loc1_ != null)
         {
            this.var_178 = _loc1_.content as XML;
            for each(_loc2_ in page.offers)
            {
               _loc4_ = _loc2_.productContainer.firstProduct;
               _loc5_ = _loc2_.localizationId;
               _loc6_ = _loc5_.split(" ")[0];
               _loc7_ = _loc5_.split(" ")[1];
               _loc8_ = false;
               switch(_loc4_.furnitureData.name)
               {
                  case "floor":
                     for each(_loc9_ in this.var_178.floors.pattern)
                     {
                        this._activeFloorPatterns.push(String(_loc9_.@id));
                        this.var_1539.push(_loc2_);
                     }
                     break;
                  case "wallpaper":
                     for each(_loc10_ in this.var_178.walls.pattern)
                     {
                        if(_loc10_.@id == _loc7_)
                        {
                           this.var_1028.push(_loc7_);
                           _loc8_ = true;
                        }
                     }
                     if(_loc8_)
                     {
                        this.var_1540.push(_loc2_);
                     }
                     else
                     {
                        Logger.log("[SpacesCatalogWidget] Could not find wallpaper pattern configuration! " + [_loc2_.localizationId,_loc4_.furnitureData.name]);
                     }
                     break;
                  case "landscape":
                     for each(_loc11_ in this.var_178.landscapes.pattern)
                     {
                        if(_loc11_.@id == _loc7_)
                        {
                           this.var_1029.push(_loc7_);
                           _loc8_ = true;
                        }
                     }
                     if(_loc8_)
                     {
                        this.var_1538.push(_loc2_);
                     }
                     else
                     {
                        Logger.log("[SpacesCatalogWidget] Could not find landscape pattern configuration! " + [_loc2_.localizationId,_loc4_.furnitureData.name]);
                     }
                     break;
                  default:
                     Logger.log("[SpacesCatalogWidget] : " + _loc4_.furnitureData.name);
                     break;
               }
            }
            _loc3_ = 0;
            while(_loc3_ < _window.numChildren)
            {
               _loc12_ = _window.getChildAt(_loc3_);
               if(_loc12_ is IButtonWindow)
               {
                  _loc12_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onClick);
               }
               _loc3_++;
            }
            this.changePattern(const_212,0);
            this.changePattern(TYPE_LANDSCAPE,0);
            this.changePattern(const_213,0);
            this.updateConfiguration();
            this.retrieveSpacesPreview();
            return true;
         }
         return false;
      }
      
      private function onClick(param1:WindowMouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:IWindow = param1.target as IWindow;
         if(_loc2_ == null)
         {
            return;
         }
         switch(_loc2_.name)
         {
            case "ctlg_wall_pattern_prev":
               this.changePattern(const_212,-1);
               break;
            case "ctlg_wall_pattern_next":
               this.changePattern(const_212,1);
               break;
            case "ctlg_wall_color_prev":
               this.changeColor(const_212,-1);
               break;
            case "ctlg_wall_color_next":
               this.changeColor(const_212,1);
               break;
            case "ctlg_buy_wall":
               _loc3_ = this.var_1540[this.var_453];
               if(_loc3_ != null)
               {
                  (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(_loc3_,page.pageId,this.var_1765);
               }
               break;
            case "ctlg_floor_pattern_prev":
               this.changePattern(const_213,-1);
               break;
            case "ctlg_floor_pattern_next":
               this.changePattern(const_213,1);
               break;
            case "ctlg_floor_color_prev":
               this.changeColor(const_213,-1);
               break;
            case "ctlg_floor_color_next":
               this.changeColor(const_213,1);
               break;
            case "ctlg_buy_floor":
               _loc3_ = this.var_1539[this.var_454];
               if(_loc3_ != null)
               {
                  (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(_loc3_,page.pageId,this._floorType);
               }
               break;
            case "ctlg_landscape_pattern_next":
               this.changePattern(TYPE_LANDSCAPE,-1);
               break;
            case "ctlg_landscape_pattern_prev":
               this.changePattern(TYPE_LANDSCAPE,1);
               break;
            case "ctlg_landscape_color_prev":
               this.changeColor(TYPE_LANDSCAPE,-1);
               break;
            case "ctlg_landscape_color_next":
               this.changeColor(TYPE_LANDSCAPE,1);
               break;
            case "ctlg_buy_landscape":
               _loc3_ = this.var_1538[this.var_452];
               if(_loc3_ != null)
               {
                  (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(_loc3_,page.pageId,this.var_1763);
               }
               break;
            default:
               Logger.log("Spaces, unknown button: " + _loc2_.name);
         }
         this.updateConfiguration();
         this.retrieveSpacesPreview();
      }
      
      private function updateConfiguration() : void
      {
         var _loc1_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc2_:String = this.var_1028[this.var_453];
         for each(_loc1_ in this.var_178.walls.pattern)
         {
            if(_loc1_.@id == _loc2_)
            {
               if(this.var_455 >= 0)
               {
                  _loc9_ = _loc1_.children()[this.var_455];
                  if(_loc9_ != null)
                  {
                     this.var_1765 = _loc9_.@id;
                  }
               }
            }
         }
         _loc3_ = this.var_1540[this.var_453];
         _loc4_ = (page.viewer.catalog as HabboCatalog).localization;
         if(_loc3_ != null)
         {
            _loc10_ = _window.findChildByName("ctlg_wall_price") as ITextWindow;
            if(_loc10_ != null)
            {
               _loc10_.caption = _loc4_.registerParameter("catalog.purchase.price.credits","credits",String(_loc3_.priceInCredits));
            }
         }
         var _loc5_:String = this._activeFloorPatterns[this.var_454];
         for each(_loc1_ in this.var_178.floors.pattern)
         {
            if(_loc1_.@id == _loc5_)
            {
               _loc11_ = _loc1_.children()[this.var_546];
               if(_loc11_ != null)
               {
                  this._floorType = _loc11_.@id;
               }
            }
         }
         _loc6_ = this.var_1539[this.var_454];
         if(_loc6_ != null)
         {
            _loc12_ = _window.findChildByName("ctlg_floor_price") as ITextWindow;
            if(_loc12_ != null)
            {
               _loc12_.caption = _loc4_.registerParameter("catalog.purchase.price.credits","credits",String(_loc6_.priceInCredits));
            }
         }
         var _loc7_:String = this.var_1029[this.var_452];
         for each(_loc1_ in this.var_178.landscapes.pattern)
         {
            if(_loc1_.@id == _loc7_)
            {
               _loc13_ = _loc1_.children()[this.var_547];
               if(_loc13_ != null)
               {
                  this.var_1763 = _loc13_.@id;
               }
            }
         }
         _loc8_ = this.var_1538[this.var_452];
         if(_loc8_ != null)
         {
            _loc14_ = _window.findChildByName("ctlg_landscape_price") as ITextWindow;
            if(_loc14_ != null)
            {
               _loc14_.caption = _loc4_.registerParameter("catalog.purchase.price.credits","credits",String(_loc8_.priceInCredits));
            }
         }
      }
      
      private function changePattern(param1:String, param2:int) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         switch(param1)
         {
            case const_212:
               this.var_453 += param2;
               if(this.var_453 < 0)
               {
                  this.var_453 = this.var_1028.length - 1;
               }
               if(this.var_453 == this.var_1028.length)
               {
                  this.var_453 = 0;
               }
               this.var_455 = 0;
               this.var_1030 = 0;
               _loc5_ = this.var_1028[this.var_453];
               for each(_loc8_ in this.var_178.walls.pattern)
               {
                  if(_loc8_.@id == _loc5_)
                  {
                     this.var_1030 = _loc8_.children().length();
                  }
               }
               _loc4_ = _window.findChildByName("ctlg_wall_color_prev") as IButtonWindow;
               _loc3_ = _window.findChildByName("ctlg_wall_color_next") as IButtonWindow;
               if(this.var_1030 < 2)
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.disable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.disable();
                  }
               }
               else
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.enable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.enable();
                  }
               }
               break;
            case const_213:
               this.var_454 += param2;
               if(this.var_454 < 0)
               {
                  this.var_454 = this._activeFloorPatterns.length - 1;
               }
               if(this.var_454 >= this._activeFloorPatterns.length)
               {
                  this.var_454 = 0;
               }
               this.var_546 = 0;
               this.var_1031 = 0;
               _loc6_ = this._activeFloorPatterns[this.var_454];
               for each(_loc9_ in this.var_178.floors.pattern)
               {
                  if(_loc9_.@id == _loc6_)
                  {
                     this.var_1031 = _loc9_.children().length();
                  }
               }
               _loc4_ = _window.findChildByName("ctlg_floor_color_prev") as IButtonWindow;
               _loc3_ = _window.findChildByName("ctlg_floor_color_next") as IButtonWindow;
               if(this.var_1031 < 2)
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.disable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.disable();
                  }
               }
               else
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.enable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.enable();
                  }
               }
               break;
            case TYPE_LANDSCAPE:
               this.var_452 += param2;
               if(this.var_452 < 0)
               {
                  this.var_452 = this.var_1029.length - 1;
               }
               if(this.var_452 >= this.var_1029.length)
               {
                  this.var_452 = 0;
               }
               this.var_547 = 0;
               this.var_1032 = 0;
               _loc7_ = this.var_1029[this.var_452];
               for each(_loc10_ in this.var_178.landscapes.pattern)
               {
                  if(_loc10_.@id == _loc7_)
                  {
                     this.var_1032 = _loc10_.children().length();
                  }
               }
               _loc4_ = _window.findChildByName("ctlg_landscape_color_prev") as IButtonWindow;
               _loc3_ = _window.findChildByName("ctlg_landscape_color_next") as IButtonWindow;
               if(this.var_1032 < 2)
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.disable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.disable();
                  }
               }
               else
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.enable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.enable();
                  }
               }
         }
      }
      
      private function changeColor(param1:String, param2:int) : void
      {
         switch(param1)
         {
            case const_212:
               this.var_455 += param2;
               if(this.var_455 < 0)
               {
                  if(this.var_1030 > 0)
                  {
                     this.var_455 = this.var_1030 - 1;
                  }
                  else
                  {
                     this.var_455 = 0;
                  }
               }
               if(this.var_455 >= this.var_1030)
               {
                  this.var_455 = 0;
               }
               break;
            case const_213:
               this.var_546 += param2;
               if(this.var_546 < 0)
               {
                  if(this.var_1031 > 0)
                  {
                     this.var_546 = this.var_1031 - 1;
                  }
                  else
                  {
                     this.var_546 = 0;
                  }
               }
               if(this.var_546 >= this.var_1031)
               {
                  this.var_546 = 0;
               }
               break;
            case TYPE_LANDSCAPE:
               this.var_547 += param2;
               if(this.var_547 < 0)
               {
                  if(this.var_1032 > 0)
                  {
                     this.var_547 = this.var_1032 - 1;
                  }
                  else
                  {
                     this.var_547 = 0;
                  }
               }
               if(this.var_547 >= this.var_1032)
               {
                  this.var_547 = 0;
               }
         }
      }
      
      private function retrieveSpacesPreview() : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:ImageResult = page.viewer.roomEngine.getRoomImage(this._floorType,this.var_1765,this.var_1763,64,this,"window_romantic_wide");
         var _loc3_:ImageResult = page.viewer.roomEngine.getGenericRoomObjectImage("window_romantic_wide","",new Vector3d(180,0,0),64,this);
         if(_loc2_ != null && _loc3_ != null)
         {
            this.var_2006 = _loc2_.id;
            this.var_2005 = _loc3_.id;
            _loc4_ = _loc2_.data as BitmapData;
            _loc5_ = _loc3_.data as BitmapData;
            if(this.var_393 != null)
            {
               this.var_393.dispose();
            }
            if(this.var_392 != null)
            {
               this.var_392.dispose();
            }
            this.var_393 = _loc4_;
            this.var_392 = _loc5_;
            this.setRoomImage(_loc4_,_loc5_);
         }
      }
      
      private function setRoomImage(param1:BitmapData, param2:BitmapData) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param1 != null && param2 != null && true)
         {
            _loc3_ = new Point(param1.width / 2 + 4 + 19,param1.height / 2 - param2.height / 2 - 24 + 10);
            _loc4_ = new BitmapData(param1.width,param1.height,param1.transparent);
            _loc4_.copyPixels(param1,param1.rect,new Point(0,0),null,null,true);
            _loc4_.copyPixels(param2,param2.rect,_loc3_,null,null,true);
            _loc5_ = window.getChildByName("catalog_floor_preview_example") as IBitmapWrapperWindow;
            if(_loc5_ != null)
            {
               if(_loc5_.bitmap == null)
               {
                  _loc5_.bitmap = new BitmapData(_loc5_.width,_loc5_.height,true,16777215);
               }
               _loc5_.bitmap.fillRect(_loc5_.bitmap.rect,16777215);
               _loc6_ = (_loc5_.width - _loc4_.width) / 2;
               _loc7_ = (_loc5_.height - _loc4_.height) / 2;
               _loc5_.bitmap.copyPixels(_loc4_,_loc4_.rect,new Point(_loc6_,_loc7_),null,null,true);
               _loc5_.invalidate();
            }
            _loc4_.dispose();
         }
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         if(disposed)
         {
            return;
         }
         switch(param1)
         {
            case this.var_2006:
               this.var_2006 = 0;
               if(this.var_393 != null)
               {
                  this.var_393.dispose();
               }
               this.var_393 = param2;
               break;
            case this.var_2005:
               this.var_2005 = 0;
               if(this.var_392 != null)
               {
                  this.var_392.dispose();
               }
               this.var_392 = param2;
         }
         if(this.var_393 != null && this.var_392 != null)
         {
            this.setRoomImage(this.var_393,this.var_392);
         }
      }
   }
}
