package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_661:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2559:int;
      
      private var var_2558:int;
      
      private var _color:uint;
      
      private var var_1207:int;
      
      private var var_2560:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_661);
         this.var_2559 = param1;
         this.var_2558 = param2;
         this._color = param3;
         this.var_1207 = param4;
         this.var_2560 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2559;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2558;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1207;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2560;
      }
   }
}
