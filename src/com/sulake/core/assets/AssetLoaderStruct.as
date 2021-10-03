package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_972:IAssetLoader;
      
      private var var_1658:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         this.var_1658 = param1;
         this.var_972 = param2;
      }
      
      public function get assetName() : String
      {
         return this.var_1658;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return this.var_972;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_972 != null)
            {
               if(!this.var_972.disposed)
               {
                  this.var_972.dispose();
                  this.var_972 = null;
               }
            }
            super.dispose();
         }
      }
   }
}
