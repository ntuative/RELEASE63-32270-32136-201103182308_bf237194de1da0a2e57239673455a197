package com.sulake.habbo.sound.music
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.messages.incoming.sound.TraxSongInfoMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.sound.GetSongInfoMessageComposer;
   import com.sulake.habbo.communication.messages.parser.sound.TraxSongInfoMessageParser;
   import com.sulake.habbo.sound.HabboSoundManagerFlash10;
   import com.sulake.habbo.sound.IHabboMusicController;
   import com.sulake.habbo.sound.IHabboSound;
   import com.sulake.habbo.sound.IPlayListController;
   import com.sulake.habbo.sound.ISongInfo;
   import com.sulake.habbo.sound.events.SongInfoReceivedEvent;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class HabboMusicController implements IHabboMusicController, IDisposable
   {
      
      public static const const_1571:int = -1;
       
      
      private var var_549:HabboSoundManagerFlash10;
      
      private var _connection:IConnection;
      
      private var _events:IEventDispatcher;
      
      private var var_83:IEventDispatcher;
      
      private var var_141:Map;
      
      private var var_381:Array;
      
      private var var_999:Array;
      
      private var var_1001:Map;
      
      private var var_1000:Map;
      
      private var var_1936:RoomItemPlayListController = null;
      
      private var _disposed:Boolean = false;
      
      private var var_212:Map;
      
      private var var_1232:int = 0;
      
      private var var_1231:Timer;
      
      public function HabboMusicController(param1:HabboSoundManagerFlash10, param2:IEventDispatcher, param3:IEventDispatcher, param4:IConnection)
      {
         this.var_141 = new Map();
         this.var_381 = new Array();
         this.var_999 = new Array();
         this.var_1001 = new Map();
         this.var_1000 = new Map();
         this.var_212 = new Map();
         super();
         this.var_549 = param1;
         this._events = param2;
         this.var_83 = param3;
         this._connection = param4;
         this.var_1936 = new RoomItemPlayListController(param1,this,param2,param3,param4);
         this._connection.addMessageEvent(new TraxSongInfoMessageEvent(this.onSongInfoMessage));
         this.var_1231 = new Timer(1000);
         this.var_1231.start();
         this.var_1231.addEventListener(TimerEvent.TIMER,this.sendNextSongRequestMessage);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!this._disposed)
         {
            this.var_549 = null;
            this._connection = null;
            this.var_381 = null;
            this.var_999 = null;
            this.var_1936 = null;
            if(this.var_141)
            {
               _loc1_ = 0;
               while(_loc1_ < this.var_141.length)
               {
                  _loc2_ = this.var_141.getValues()[_loc1_] as SongDataEntry;
                  _loc3_ = _loc2_.soundObject as IHabboSound;
                  if(_loc3_ != null)
                  {
                     _loc3_.stop();
                  }
                  _loc2_.soundObject = null;
                  _loc1_++;
               }
               this.var_141.dispose();
               this.var_141 = null;
            }
            this.var_1231.stop();
            this.var_1231 = null;
            this._disposed = true;
         }
      }
      
      public function getRoomItemPlaylist(param1:int = -1) : IPlayListController
      {
         return this.var_1936 as IPlayListController;
      }
      
      public function playSong(param1:int, param2:int, param3:Number = 0) : Boolean
      {
         var _loc7_:int = 0;
         var _loc8_:* = null;
         if(this.var_212.getKeys().indexOf(param2) != -1)
         {
            this.var_212.add(param2,param1);
         }
         else
         {
            this.var_212[param2] = param1;
         }
         var _loc4_:Date = new Date();
         var _loc5_:SongDataEntry = this.var_141.getValue(param1) as SongDataEntry;
         if(_loc5_ == null)
         {
            this.requestSongInfo(param1);
            this.var_1001.add(param1,_loc4_.getTime());
            this.var_1000.add(param1,param3);
            return false;
         }
         this.var_1000[param1] = param3;
         if(_loc5_.soundObject == null)
         {
            this.var_1001[param1] = _loc4_.getTime();
            this.var_1000[param1] = param3;
            _loc5_.soundObject = this.var_549.loadTraxSong(_loc5_.id,_loc5_.songData);
         }
         var _loc6_:IHabboSound = _loc5_.soundObject;
         if(!_loc6_.ready)
         {
            return false;
         }
         if(param2 >= this.var_1232)
         {
            for each(_loc7_ in this.var_212.getValues())
            {
               if(_loc7_ != param1)
               {
                  _loc8_ = this.var_141.getValue(_loc7_) as SongDataEntry;
                  _loc8_.soundObject.stop();
               }
            }
            this.playSongObject(param1,param3);
            Logger.log("Started playing song: " + param1);
            this.var_1232 = param2;
         }
         else
         {
            Logger.log("Song play was rejected because of low priority: " + param1);
         }
         return true;
      }
      
      public function stopSong(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc2_:SongDataEntry = this.var_141.getValue(param1) as SongDataEntry;
         if(_loc2_ != null)
         {
            _loc2_.soundObject.stop();
         }
         var _loc3_:int = this.var_212.getValues().indexOf(_loc2_);
         if(_loc3_ != -1)
         {
            _loc4_ = this.var_212.getKeys()[_loc3_];
            this.var_212.remove(_loc4_);
            this.var_1232 = this.getTopPriority();
         }
      }
      
      public function stop(param1:int = 10) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_212.length)
         {
            _loc3_ = this.var_212.getKeys()[_loc2_];
            if(_loc3_ <= param1)
            {
               _loc4_ = this.var_212.getValues()[_loc2_];
               _loc5_ = this.var_141.getValue(_loc4_) as SongDataEntry;
               if(_loc5_ != null)
               {
                  _loc6_ = _loc5_.soundObject;
                  _loc6_.stop();
               }
            }
            _loc2_++;
         }
      }
      
      public function previewSong(param1:int, param2:int) : void
      {
      }
      
      public function getSongObject(param1:int) : IHabboSound
      {
         var _loc2_:SongDataEntry = this.var_141.getValue(param1) as SongDataEntry;
         if(_loc2_ != null)
         {
            return _loc2_.soundObject;
         }
         return null;
      }
      
      public function updateVolume(param1:Number) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         for each(_loc2_ in this.var_212.getKeys())
         {
            _loc3_ = this.var_141.getValue(_loc2_) as SongDataEntry;
            if(_loc3_ != null)
            {
               _loc3_.soundObject.volume = param1;
            }
         }
      }
      
      public function onSongLoaded(param1:int) : void
      {
         var _loc2_:int = this.var_212[this.var_1232];
         Logger.log("Song loaded : " + param1);
         if(param1 == _loc2_)
         {
            this.playSongObject(param1,this.var_1000[param1]);
         }
      }
      
      public function requestSongInfo(param1:int) : void
      {
         this.var_381.push(param1);
      }
      
      public function requestSongInfoWithoutSamples(param1:int) : void
      {
         if(this.var_381.indexOf(param1) == -1)
         {
            this.var_381.push(param1);
            this.var_999.push(param1);
         }
      }
      
      public function getSongInfo(param1:int) : ISongInfo
      {
         if(this.var_141.getKeys().indexOf(param1) == -1)
         {
            this.requestSongInfoWithoutSamples(param1);
         }
         return this.var_141.getValue(param1);
      }
      
      private function sendNextSongRequestMessage(param1:TimerEvent) : void
      {
         if(this.var_381.length < 1)
         {
            return;
         }
         var _loc2_:int = this.var_381[0];
         this.var_381.splice(0,1);
         if(this._connection == null)
         {
            return;
         }
         this._connection.send(new GetSongInfoMessageComposer(_loc2_));
         Logger.log("Requested song info : " + _loc2_);
      }
      
      private function onSongInfoMessage(param1:IMessageEvent) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         var _loc9_:* = null;
         var _loc2_:TraxSongInfoMessageEvent = param1 as TraxSongInfoMessageEvent;
         var _loc3_:TraxSongInfoMessageParser = _loc2_.getParser() as TraxSongInfoMessageParser;
         var _loc4_:* = this.var_141.getValue(_loc3_.id) == null;
         var _loc5_:* = this.var_999.indexOf(_loc3_.id) == -1;
         if(this.var_381.indexOf(_loc3_.id) != -1)
         {
            this.var_381.splice(this.var_381.indexOf(_loc3_.id),1);
         }
         if(!_loc5_)
         {
            this.var_999.splice(this.var_999.indexOf(_loc3_.id),1);
         }
         if(_loc4_)
         {
            if(_loc5_)
            {
               _loc6_ = this.var_549.loadTraxSong(_loc3_.id,_loc3_.data);
               if(_loc6_ == null)
               {
                  return;
               }
               _loc7_ = new SongDataEntry(_loc3_.id,_loc3_.length,_loc3_.name,_loc3_.author,_loc6_);
               this.var_141.add(_loc3_.id,_loc7_);
               _loc8_ = this.var_212[this.var_1232];
               if(_loc6_.ready && _loc3_.id == _loc8_)
               {
                  this.playSongObject(_loc8_,this.var_1000[_loc8_]);
               }
            }
            else
            {
               _loc9_ = new SongDataEntry(_loc3_.id,_loc3_.length,_loc3_.name,_loc3_.author,null);
               _loc9_.songData = _loc3_.data;
               this.var_141.add(_loc3_.id,_loc9_);
               this._events.dispatchEvent(new SongInfoReceivedEvent(SongInfoReceivedEvent.TRAX_SONG_INFO_RECEIVED,_loc3_.id));
            }
         }
         Logger.log("Received song info : " + _loc3_.id);
      }
      
      private function playSongObject(param1:int, param2:Number = -1) : Boolean
      {
         var _loc6_:* = null;
         var _loc7_:Number = NaN;
         var _loc3_:SongDataEntry = this.var_141.getValue(param1) as SongDataEntry;
         if(_loc3_ == null)
         {
            Logger.log("WARNING: Unable to find song entry id " + param1 + " that was supposed to be loaded.");
            return false;
         }
         var _loc4_:IHabboSound = _loc3_.soundObject;
         if(!_loc4_.ready)
         {
            return false;
         }
         _loc4_.volume = this.var_549.volume;
         if(param2 != const_1571)
         {
            _loc4_.position = param2;
            if(this.var_1001.getKeys().indexOf(param1) != -1)
            {
               _loc6_ = new Date();
               _loc7_ = (_loc6_.getTime() - this.var_1001[param1]) / 1000;
               _loc4_.position += _loc7_;
               this.var_1001.remove(param1);
            }
         }
         _loc4_.play();
         if(_loc3_.length >= 8000)
         {
            this.var_549.notifyPlayedSong(_loc3_.name,_loc3_.creator);
         }
         Logger.log("Started playing song : " + param1 + " at position : " + _loc4_.position);
         return true;
      }
      
      private function getTopPriority() : int
      {
         var _loc2_:int = 0;
         var _loc1_:int = -1;
         for each(_loc2_ in this.var_212.getKeys())
         {
            if(_loc2_ > _loc1_)
            {
               _loc1_ = _loc2_;
            }
         }
         return _loc1_;
      }
   }
}
