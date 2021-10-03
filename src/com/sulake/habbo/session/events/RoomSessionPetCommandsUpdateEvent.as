package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionPetCommandsUpdateEvent extends RoomSessionEvent
   {
      
      public static const PET_COMMANDS:String = "RSPIUE_ENABLED_PET_COMMANDS";
       
      
      private var var_1680:int;
      
      private var var_2341:Array;
      
      private var var_2435:Array;
      
      public function RoomSessionPetCommandsUpdateEvent(param1:IRoomSession, param2:int, param3:Array, param4:Array, param5:Boolean = false, param6:Boolean = false)
      {
         super(RoomSessionPetCommandsUpdateEvent.PET_COMMANDS,param1,param5,param6);
         this.var_1680 = param2;
         this.var_2341 = param3;
         this.var_2435 = param4;
      }
      
      public function get petId() : int
      {
         return this.var_1680;
      }
      
      public function get allCommands() : Array
      {
         return this.var_2341;
      }
      
      public function get enabledCommands() : Array
      {
         return this.var_2435;
      }
   }
}
