package com.sulake.room.renderer.utils
{
   public class ObjectMouseData
   {
       
      
      private var var_386:String = "";
      
      private var var_2120:String = "";
      
      public function ObjectMouseData()
      {
         super();
      }
      
      public function get objectId() : String
      {
         return this.var_386;
      }
      
      public function set objectId(param1:String) : void
      {
         this.var_386 = param1;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2120;
      }
      
      public function set spriteTag(param1:String) : void
      {
         this.var_2120 = param1;
      }
   }
}
