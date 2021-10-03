package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2096:int = 0;
      
      private var var_1368:String = "";
      
      private var var_1691:String = "";
      
      private var var_2100:String = "";
      
      private var var_2095:String = "";
      
      private var var_1568:int = 0;
      
      private var var_2099:int = 0;
      
      private var var_2098:int = 0;
      
      private var var_1370:int = 0;
      
      private var var_2097:int = 0;
      
      private var var_1371:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2096 = param1;
         this.var_1368 = param2;
         this.var_1691 = param3;
         this.var_2100 = param4;
         this.var_2095 = param5;
         if(param6)
         {
            this.var_1568 = 1;
         }
         else
         {
            this.var_1568 = 0;
         }
         this.var_2099 = param7;
         this.var_2098 = param8;
         this.var_1370 = param9;
         this.var_2097 = param10;
         this.var_1371 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2096,this.var_1368,this.var_1691,this.var_2100,this.var_2095,this.var_1568,this.var_2099,this.var_2098,this.var_1370,this.var_2097,this.var_1371];
      }
   }
}
