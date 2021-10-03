package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2745:Number;
      
      private var var_1978:Number;
      
      private var var_1008:Number;
      
      private var var_480:Number = 0;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         this.var_2745 = param1;
         this.var_1978 = param2;
      }
      
      public function reset(param1:int) : void
      {
         this.var_1008 = param1;
         this.var_480 = 0;
      }
      
      public function update() : void
      {
         this.var_1008 += this.var_1978;
         this.var_480 += this.var_1008;
         if(this.var_480 > 0)
         {
            this.var_480 = 0;
            this.var_1008 = this.var_2745 * -1 * this.var_1008;
         }
      }
      
      public function get location() : Number
      {
         return this.var_480;
      }
   }
}
