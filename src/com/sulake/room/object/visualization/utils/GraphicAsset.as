package com.sulake.room.object.visualization.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import flash.display.BitmapData;
   
   public class GraphicAsset implements IGraphicAsset
   {
       
      
      private var var_1658:String;
      
      private var var_2550:String;
      
      private var var_445:BitmapDataAsset;
      
      private var var_1359:Boolean;
      
      private var var_1360:Boolean;
      
      private var var_2549:Boolean;
      
      private var _offsetX:int;
      
      private var var_1144:int;
      
      private var var_252:int;
      
      private var _height:int;
      
      private var var_705:Boolean;
      
      public function GraphicAsset(param1:String, param2:String, param3:IAsset, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:Boolean = false)
      {
         super();
         this.var_1658 = param1;
         this.var_2550 = param2;
         var _loc9_:BitmapDataAsset = param3 as BitmapDataAsset;
         if(_loc9_ != null)
         {
            this.var_445 = _loc9_;
            this.var_705 = false;
         }
         else
         {
            this.var_445 = null;
            this.var_705 = true;
         }
         this.var_1359 = param4;
         this.var_1360 = param5;
         this._offsetX = param6;
         this.var_1144 = param7;
         this.var_2549 = param8;
      }
      
      public function dispose() : void
      {
         this.var_445 = null;
      }
      
      private function initialize() : void
      {
         var _loc1_:* = null;
         if(!this.var_705 && this.var_445 != null)
         {
            _loc1_ = this.var_445.content as BitmapData;
            if(_loc1_ != null)
            {
               this.var_252 = _loc1_.width;
               this._height = _loc1_.height;
            }
            this.var_705 = true;
         }
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1360;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1359;
      }
      
      public function get width() : int
      {
         this.initialize();
         return this.var_252;
      }
      
      public function get height() : int
      {
         this.initialize();
         return this._height;
      }
      
      public function get assetName() : String
      {
         return this.var_1658;
      }
      
      public function get libraryAssetName() : String
      {
         return this.var_2550;
      }
      
      public function get asset() : IAsset
      {
         return this.var_445;
      }
      
      public function get usesPalette() : Boolean
      {
         return this.var_2549;
      }
      
      public function get offsetX() : int
      {
         if(!this.var_1359)
         {
            return this._offsetX;
         }
         return -(this.width + this._offsetX);
      }
      
      public function get offsetY() : int
      {
         if(!this.var_1360)
         {
            return this.var_1144;
         }
         return -(this.height + this.var_1144);
      }
      
      public function get originalOffsetX() : int
      {
         return this._offsetX;
      }
      
      public function get originalOffsetY() : int
      {
         return this.var_1144;
      }
   }
}
