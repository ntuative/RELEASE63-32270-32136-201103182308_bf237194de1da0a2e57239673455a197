package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2537:String;
      
      private var var_1817:String;
      
      private var var_2536:String;
      
      private var var_1819:Boolean;
      
      private var var_1818:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2537 = String(param1["set-type"]);
         this.var_1817 = String(param1["flipped-set-type"]);
         this.var_2536 = String(param1["remove-set-type"]);
         this.var_1819 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1818 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_1818;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1818 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2537;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1817;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2536;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1819;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1819 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1817 = param1;
      }
   }
}
