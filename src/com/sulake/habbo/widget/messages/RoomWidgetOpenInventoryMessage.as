package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_654:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1051:String = "inventory_effects";
      
      public static const const_1167:String = "inventory_badges";
      
      public static const const_1621:String = "inventory_clothes";
      
      public static const const_1562:String = "inventory_furniture";
       
      
      private var var_2463:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_654);
         this.var_2463 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2463;
      }
   }
}
