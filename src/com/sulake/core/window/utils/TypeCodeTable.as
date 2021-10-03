package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_823;
         param1["bitmap"] = const_758;
         param1["border"] = const_913;
         param1["border_notify"] = const_1589;
         param1["button"] = const_499;
         param1["button_thick"] = const_827;
         param1["button_icon"] = const_1496;
         param1["button_group_left"] = const_641;
         param1["button_group_center"] = const_629;
         param1["button_group_right"] = const_669;
         param1["canvas"] = const_819;
         param1["checkbox"] = const_788;
         param1["closebutton"] = const_1057;
         param1["container"] = const_368;
         param1["container_button"] = const_791;
         param1["display_object_wrapper"] = const_655;
         param1["dropmenu"] = const_470;
         param1["dropmenu_item"] = const_457;
         param1["frame"] = const_412;
         param1["frame_notify"] = const_1594;
         param1["header"] = const_848;
         param1["html"] = const_1240;
         param1["icon"] = const_1031;
         param1["itemgrid"] = const_1151;
         param1["itemgrid_horizontal"] = const_458;
         param1["itemgrid_vertical"] = const_701;
         param1["itemlist"] = const_1013;
         param1["itemlist_horizontal"] = const_380;
         param1["itemlist_vertical"] = const_360;
         param1["label"] = WINDOW_TYPE_LABEL;
         param1["maximizebox"] = const_1577;
         param1["menu"] = const_1701;
         param1["menu_item"] = const_1591;
         param1["submenu"] = const_1144;
         param1["minimizebox"] = const_1566;
         param1["notify"] = const_1590;
         param1["null"] = const_894;
         param1["password"] = const_741;
         param1["radiobutton"] = const_916;
         param1["region"] = const_522;
         param1["restorebox"] = const_1471;
         param1["scaler"] = const_679;
         param1["scaler_horizontal"] = const_1626;
         param1["scaler_vertical"] = const_1586;
         param1["scrollbar_horizontal"] = const_483;
         param1["scrollbar_vertical"] = const_872;
         param1["scrollbar_slider_button_up"] = const_1114;
         param1["scrollbar_slider_button_down"] = const_1070;
         param1["scrollbar_slider_button_left"] = const_1146;
         param1["scrollbar_slider_button_right"] = const_1215;
         param1["scrollbar_slider_bar_horizontal"] = const_1083;
         param1["scrollbar_slider_bar_vertical"] = const_1011;
         param1["scrollbar_slider_track_horizontal"] = const_1117;
         param1["scrollbar_slider_track_vertical"] = const_1166;
         param1["scrollable_itemlist"] = const_1431;
         param1["scrollable_itemlist_vertical"] = const_551;
         param1["scrollable_itemlist_horizontal"] = const_1066;
         param1["selector"] = const_774;
         param1["selector_list"] = const_626;
         param1["submenu"] = const_1144;
         param1["tab_button"] = const_549;
         param1["tab_container_button"] = const_1072;
         param1["tab_context"] = const_543;
         param1["tab_content"] = const_1165;
         param1["tab_selector"] = const_891;
         param1["text"] = const_587;
         param1["input"] = const_708;
         param1["toolbar"] = const_1580;
         param1["tooltip"] = const_359;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
