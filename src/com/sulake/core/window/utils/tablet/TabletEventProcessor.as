package com.sulake.core.window.utils.tablet
{
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.MouseEventProcessor;
   
   public class TabletEventProcessor extends MouseEventProcessor
   {
       
      
      private var var_2902:String = "";
      
      public function TabletEventProcessor()
      {
         super();
      }
      
      override public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         if(param2.length == 0)
         {
            return;
         }
         var_145 = param1.desktop;
         var_72 = param1.var_1281 as WindowController;
         var_175 = param1.var_1279 as WindowController;
         var_173 = param1.renderer;
         var_834 = param1.var_1282;
         param2.begin();
         param2.end();
         param1.desktop = var_145;
         param1.var_1281 = var_72;
         param1.var_1279 = var_175;
         param1.renderer = var_173;
         param1.var_1282 = var_834;
      }
   }
}
