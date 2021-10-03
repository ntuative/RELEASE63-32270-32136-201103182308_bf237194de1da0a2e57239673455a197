package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_2840:uint;
      
      private var var_149:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var var_263:IWindowContext;
      
      private var var_1055:IMouseDraggingService;
      
      private var var_1057:IMouseScalingService;
      
      private var var_1056:IMouseListenerService;
      
      private var var_1054:IFocusManagerService;
      
      private var var_1059:IToolTipAgentService;
      
      private var var_1058:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_2840 = 0;
         this.var_149 = param2;
         this.var_263 = param1;
         this.var_1055 = new WindowMouseDragger(param2);
         this.var_1057 = new WindowMouseScaler(param2);
         this.var_1056 = new WindowMouseListener(param2);
         this.var_1054 = new FocusManager(param2);
         this.var_1059 = new WindowToolTipAgent(param2);
         this.var_1058 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1055 != null)
         {
            this.var_1055.dispose();
            this.var_1055 = null;
         }
         if(this.var_1057 != null)
         {
            this.var_1057.dispose();
            this.var_1057 = null;
         }
         if(this.var_1056 != null)
         {
            this.var_1056.dispose();
            this.var_1056 = null;
         }
         if(this.var_1054 != null)
         {
            this.var_1054.dispose();
            this.var_1054 = null;
         }
         if(this.var_1059 != null)
         {
            this.var_1059.dispose();
            this.var_1059 = null;
         }
         if(this.var_1058 != null)
         {
            this.var_1058.dispose();
            this.var_1058 = null;
         }
         this.var_149 = null;
         this.var_263 = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1055;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1057;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1056;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1054;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1059;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1058;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
