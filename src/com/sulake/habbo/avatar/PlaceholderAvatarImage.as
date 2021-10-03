package com.sulake.habbo.avatar
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import flash.display.BitmapData;
   
   public class PlaceholderAvatarImage extends AvatarImage
   {
      
      static var var_762:Map = new Map();
       
      
      public function PlaceholderAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!var_702)
         {
            _structure = null;
            _assets = null;
            var_275 = null;
            var_286 = null;
            _figure = null;
            var_554 = null;
            var_330 = null;
            if(!var_1292 && var_46)
            {
               var_46.dispose();
            }
            var_46 = null;
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_740 = null;
            var_702 = true;
         }
      }
      
      override protected function getFullImage(param1:String) : BitmapData
      {
         return var_762[param1];
      }
      
      override protected function cacheFullImage(param1:String, param2:BitmapData) : void
      {
         var_762[param1] = param2;
      }
      
      override public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         switch(param1)
         {
            case AvatarAction.const_341:
               switch(_loc3_)
               {
                  case AvatarAction.const_826:
                  case AvatarAction.const_504:
                  case AvatarAction.const_357:
                  case AvatarAction.const_907:
                  case AvatarAction.const_367:
                  case AvatarAction.const_773:
                     super.appendAction.apply(null,[param1].concat(rest));
               }
               break;
            case AvatarAction.const_302:
            case AvatarAction.const_753:
            case AvatarAction.const_228:
            case AvatarAction.const_770:
            case AvatarAction.const_814:
            case AvatarAction.const_651:
               super.addActionData.apply(null,[param1].concat(rest));
         }
         return true;
      }
      
      override public function isPlaceholder() : Boolean
      {
         return true;
      }
   }
}
