package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_185;
         param1["bound_to_parent_rect"] = const_100;
         param1["child_window"] = const_1223;
         param1["embedded_controller"] = const_1044;
         param1["resize_to_accommodate_children"] = const_63;
         param1["input_event_processor"] = const_29;
         param1["internal_event_handling"] = const_877;
         param1["mouse_dragging_target"] = const_254;
         param1["mouse_dragging_trigger"] = const_404;
         param1["mouse_scaling_target"] = const_325;
         param1["mouse_scaling_trigger"] = const_545;
         param1["horizontal_mouse_scaling_trigger"] = const_262;
         param1["vertical_mouse_scaling_trigger"] = const_230;
         param1["observe_parent_input_events"] = const_1201;
         param1["optimize_region_to_layout_size"] = const_514;
         param1["parent_window"] = const_1108;
         param1["relative_horizontal_scale_center"] = const_183;
         param1["relative_horizontal_scale_fixed"] = const_136;
         param1["relative_horizontal_scale_move"] = const_398;
         param1["relative_horizontal_scale_strech"] = const_353;
         param1["relative_scale_center"] = const_1028;
         param1["relative_scale_fixed"] = const_760;
         param1["relative_scale_move"] = const_1015;
         param1["relative_scale_strech"] = const_1176;
         param1["relative_vertical_scale_center"] = const_195;
         param1["relative_vertical_scale_fixed"] = const_140;
         param1["relative_vertical_scale_move"] = const_232;
         param1["relative_vertical_scale_strech"] = const_280;
         param1["on_resize_align_left"] = const_879;
         param1["on_resize_align_right"] = const_532;
         param1["on_resize_align_center"] = const_479;
         param1["on_resize_align_top"] = const_671;
         param1["on_resize_align_bottom"] = const_478;
         param1["on_resize_align_middle"] = const_561;
         param1["on_accommodate_align_left"] = const_1164;
         param1["on_accommodate_align_right"] = const_449;
         param1["on_accommodate_align_center"] = const_847;
         param1["on_accommodate_align_top"] = const_1182;
         param1["on_accommodate_align_bottom"] = const_462;
         param1["on_accommodate_align_middle"] = const_862;
         param1["route_input_events_to_parent"] = const_506;
         param1["use_parent_graphic_context"] = const_33;
         param1["draggable_with_mouse"] = const_1222;
         param1["scalable_with_mouse"] = const_1063;
         param1["reflect_horizontal_resize_to_parent"] = const_517;
         param1["reflect_vertical_resize_to_parent"] = const_430;
         param1["reflect_resize_to_parent"] = const_296;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1106;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
