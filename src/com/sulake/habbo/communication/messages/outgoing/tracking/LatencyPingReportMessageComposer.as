package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_2659:int;
      
      private var var_2660:int;
      
      private var var_2661:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_2659 = param1;
         this.var_2660 = param2;
         this.var_2661 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2659,this.var_2660,this.var_2661];
      }
      
      public function dispose() : void
      {
      }
   }
}
