package
{
   import com.sulake.habbo.friendbar.HabboFriendBar;
   import mx.core.SimpleApplication;
   
   public class HabboFriendBarCom extends SimpleApplication
   {
      
      public static var manifest:Class = HabboFriendBarCom_manifest;
      
      public static var bar_xml:Class = HabboFriendBarCom_bar_xml;
      
      public static var entity_xml:Class = HabboFriendBarCom_entity_xml;
      
      public static var toggle_xml:Class = HabboFriendBarCom_toggle_xml;
      
      public static var facebook_piece_xml:Class = HabboFriendBarCom_facebook_piece_xml;
      
      public static var controls_piece_xml:Class = HabboFriendBarCom_controls_piece_xml;
      
      public static var HabboFriendBarCom:Class = §§newclass(HabboFriendBarCom,SimpleApplication);
      
      {
         HabboFriendBarCom = HabboFriendBar;
      }
      
      public function HabboFriendBarCom()
      {
         super();
      }
   }
}
