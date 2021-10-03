package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1565:int;
      
      private var var_2076:int;
      
      private var var_757:int;
      
      private var var_486:Number;
      
      private var var_2078:Boolean;
      
      private var var_2077:int;
      
      private var var_1566:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2076 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2077 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2078 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         ++this.var_757;
         if(this.var_757 == 1)
         {
            this.var_486 = param1;
            this.var_1565 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_757);
            this.var_486 = this.var_486 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2078 && param3 - this.var_1565 >= this.var_2076 && this.var_1566 < this.var_2077)
         {
            _loc5_ = 1000 / this.var_486;
            param2.track("performance","averageFramerate",Math.round(_loc5_));
            ++this.var_1566;
            this.var_1565 = param3;
            this.var_757 = 0;
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
