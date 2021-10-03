package com.sulake.habbo.sound.music
{
   import com.sulake.habbo.communication.messages.incoming.sound.PlayListEntry;
   import com.sulake.habbo.sound.IHabboSound;
   import com.sulake.habbo.sound.ISongInfo;
   
   public class SongDataEntry extends PlayListEntry implements ISongInfo
   {
       
      
      private var var_1118:IHabboSound = null;
      
      private var var_1726:String;
      
      public function SongDataEntry(param1:int, param2:int, param3:String, param4:String, param5:IHabboSound)
      {
         this.var_1118 = param5;
         this.var_1726 = "";
         super(param1,param2,param3,param4);
      }
      
      override public function get id() : int
      {
         return var_2062;
      }
      
      override public function get length() : int
      {
         return var_2063;
      }
      
      override public function get name() : String
      {
         return _songName;
      }
      
      override public function get creator() : String
      {
         return var_2061;
      }
      
      public function get loaded() : Boolean
      {
         return this.var_1118 == null ? false : Boolean(this.var_1118.ready);
      }
      
      public function get soundObject() : IHabboSound
      {
         return this.var_1118;
      }
      
      public function get songData() : String
      {
         return this.var_1726;
      }
      
      public function set soundObject(param1:IHabboSound) : void
      {
         this.var_1118 = param1;
      }
      
      public function set songData(param1:String) : void
      {
         this.var_1726 = param1;
      }
   }
}
