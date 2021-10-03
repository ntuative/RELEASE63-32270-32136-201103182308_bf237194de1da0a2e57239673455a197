package com.sulake.habbo.sound.trax
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.sound.IHabboSound;
   import com.sulake.habbo.sound.events.SoundCompleteEvent;
   import flash.events.IEventDispatcher;
   import flash.events.SampleDataEvent;
   import flash.events.TimerEvent;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import flash.utils.Timer;
   
   public class TraxSequencer implements IHabboSound
   {
      
      private static const const_275:uint = 8192;
      
      private static const const_1396:uint = 88200;
      
      private static const const_1397:uint = 88200;
       
      
      private var var_110:Vector.<Number> = null;
      
      private var _events:IEventDispatcher;
      
      private var _volume:Number;
      
      private var var_1220:Sound;
      
      private var _soundChannel:SoundChannel;
      
      private var var_1905:TraxData;
      
      private var var_1903:Map;
      
      private var var_1038:Boolean;
      
      private var var_2062:int;
      
      private var var_231:uint;
      
      private var var_787:Array;
      
      private var var_1904:Boolean;
      
      private var var_989:Boolean;
      
      private var _length:uint;
      
      private var var_1482:uint;
      
      private var var_1222:Boolean;
      
      private var var_1221:Boolean;
      
      private var var_987:int;
      
      private var var_786:int;
      
      private var var_988:int;
      
      private var var_986:int;
      
      public function TraxSequencer(param1:int, param2:TraxData, param3:Map, param4:IEventDispatcher)
      {
         this.var_1482 = uint(const_275 / 44.1);
         super();
         this._events = param4;
         this.var_2062 = param1;
         this._volume = 1;
         this.var_1220 = new Sound();
         this._soundChannel = null;
         this.var_1903 = param3;
         this.var_1905 = param2;
         this.var_1903 = param3;
         this.var_1038 = true;
         this.var_231 = 0;
         this.var_787 = [];
         this.var_1904 = false;
         this._length = 0;
         this.var_989 = false;
         this.var_1222 = false;
         this.var_1221 = false;
         this.var_987 = 0;
         this.var_786 = 0;
         this.var_988 = 0;
         this.var_986 = 0;
         this.var_110 = new Vector.<Number>(const_275,true);
      }
      
      public function set position(param1:Number) : void
      {
         this.var_231 = uint(param1 * 44100);
      }
      
      public function get volume() : Number
      {
         return this._volume;
      }
      
      public function get position() : Number
      {
         return this.var_231 / 44100;
      }
      
      public function get ready() : Boolean
      {
         return this.var_1038;
      }
      
      public function set ready(param1:Boolean) : void
      {
         this.var_1038 = param1;
      }
      
      public function get finished() : Boolean
      {
         return this.var_989;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return this.var_786 / 44100;
      }
      
      public function set fadeOutSeconds(param1:Number) : void
      {
         this.var_786 = int(param1 * 44100);
      }
      
      public function get fadeInSeconds() : Number
      {
         return this.var_987 / 44100;
      }
      
      public function set fadeInSeconds(param1:Number) : void
      {
         this.var_987 = int(param1 * 44100);
      }
      
      public function play() : Boolean
      {
         if(!this.prepare())
         {
            return false;
         }
         if(this._soundChannel != null)
         {
            this.stop();
         }
         if(this.var_987 > 0)
         {
            this.var_1222 = true;
            this.var_988 = 0;
         }
         this.var_1221 = false;
         this.var_989 = false;
         this.var_1220.addEventListener(SampleDataEvent.SAMPLE_DATA,this.onSampleData);
         this._soundChannel = this.var_1220.play();
         return true;
      }
      
      private function prepare() : Boolean
      {
         if(!this.var_1038)
         {
            Logger.log("Cannot start trax playback until samples ready!");
            return false;
         }
         if(!this.var_1904)
         {
            if(!this.prepareSequence())
            {
               Logger.log("Cannot start playback, prepare sequence failed!");
               return false;
            }
         }
         return true;
      }
      
      public function render(param1:SampleDataEvent) : Boolean
      {
         if(!this.prepare())
         {
            return false;
         }
         while(!this.var_989)
         {
            this.onSampleData(param1);
         }
         return true;
      }
      
      public function stop() : Boolean
      {
         var _loc1_:* = null;
         if(this.var_786 > 0)
         {
            this.var_1221 = true;
            this.var_986 = 0;
            _loc1_ = new Timer(this.var_1482 + this.var_786 / 44.1,1);
            _loc1_.start();
            _loc1_.addEventListener(TimerEvent.TIMER_COMPLETE,this.onFadeOutComplete);
         }
         else
         {
            if(this._soundChannel != null)
            {
               this._soundChannel.stop();
            }
            this.var_1220.removeEventListener(SampleDataEvent.SAMPLE_DATA,this.onSampleData);
            this._soundChannel = null;
         }
         return true;
      }
      
      public function set volume(param1:Number) : void
      {
         this._volume = param1;
         if(this._soundChannel != null)
         {
            this._soundChannel.soundTransform = new SoundTransform(this._volume);
         }
      }
      
      public function get length() : Number
      {
         return this._length;
      }
      
      private function getSampleBars(param1:uint) : int
      {
         return Math.ceil(param1 / const_1396);
      }
      
      private function prepareSequence() : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc1_:int = 0;
         while(_loc1_ < this.var_1905.channels.length)
         {
            _loc2_ = new Map();
            _loc3_ = this.var_1905.channels[_loc1_] as TraxChannel;
            _loc4_ = 0;
            _loc5_ = 0;
            _loc6_ = 0;
            while(_loc6_ < _loc3_.itemCount)
            {
               _loc7_ = _loc3_.getItem(_loc6_).id;
               _loc8_ = this.var_1903.getValue(_loc7_) as TraxSample;
               if(_loc8_ == null)
               {
                  Logger.log("Error in prepareSequence(), sample was null!");
               }
               continue;
               _loc9_ = this.getSampleBars(_loc8_.length);
               _loc10_ = _loc3_.getItem(_loc6_).length / _loc9_;
               _loc11_ = 0;
               while(_loc11_ < _loc10_)
               {
                  if(_loc7_ != 0)
                  {
                     _loc2_.add(_loc4_,_loc8_);
                  }
                  _loc5_ += _loc9_;
                  _loc4_ = uint(_loc5_ * const_1397);
                  _loc11_++;
               }
               if(this._length < _loc4_)
               {
                  this._length = _loc4_;
               }
               _loc6_++;
               return false;
            }
            this.var_787.push(_loc2_);
            _loc1_++;
         }
         this.var_1904 = true;
         return true;
      }
      
      private function onSampleData(param1:SampleDataEvent) : void
      {
         var _loc11_:int = 0;
         var _loc12_:* = null;
         var _loc13_:int = 0;
         var _loc14_:* = null;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:int = 0;
         var _loc18_:int = 0;
         var _loc19_:int = 0;
         var _loc20_:* = null;
         var _loc21_:int = 0;
         var _loc22_:Number = NaN;
         var _loc23_:int = 0;
         var _loc24_:Number = NaN;
         var _loc25_:int = 0;
         var _loc26_:* = null;
         var _loc2_:* = [];
         var _loc3_:* = [];
         var _loc4_:* = [];
         var _loc5_:* = null;
         var _loc6_:int = this.var_787.length;
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc2_.push(this.var_787[_loc7_].getKeys());
            _loc11_ = 0;
            while(_loc11_ < _loc2_[_loc7_].length && _loc2_[_loc7_][_loc11_] < this.var_231)
            {
               _loc11_++;
            }
            if(_loc11_ > 0)
            {
               _loc11_--;
               _loc4_.push(_loc11_);
            }
            else
            {
               _loc4_.push(-1);
            }
            _loc12_ = this.var_787[_loc7_].getWithIndex(_loc11_);
            _loc13_ = this.var_231 - _loc2_[_loc7_][_loc11_];
            if(_loc12_ == null)
            {
               _loc3_.push(null);
            }
            else if(_loc12_.id == 0 || _loc13_ < 0)
            {
               _loc3_.push(null);
            }
            else
            {
               _loc5_ = new TraxChannelSample(_loc12_,_loc13_);
               _loc3_.push(_loc5_);
            }
            _loc7_++;
         }
         _loc7_ = _loc6_ - 1;
         while(_loc7_ >= 0)
         {
            _loc5_ = _loc3_[_loc7_] as TraxChannelSample;
            _loc14_ = _loc2_[_loc7_] as Array;
            _loc15_ = _loc4_[_loc7_];
            _loc16_ = const_275;
            if(this._length - this.var_231 < _loc16_)
            {
               _loc16_ = this._length - this.var_231;
            }
            _loc17_ = 0;
            while(_loc17_ < _loc16_)
            {
               _loc18_ = _loc16_;
               if(_loc15_ < _loc14_.length - 1)
               {
                  if(_loc16_ + this.var_231 >= _loc14_[_loc15_ + 1])
                  {
                     _loc18_ = _loc14_[_loc15_ + 1] - this.var_231;
                  }
               }
               if(_loc16_ - _loc17_ < _loc18_)
               {
                  _loc18_ = _loc16_ - _loc17_;
               }
               _loc19_ = 0;
               if(_loc7_ == _loc6_ - 1)
               {
                  if(_loc5_ != null)
                  {
                     _loc5_.setSample(this.var_110,_loc17_,_loc18_);
                     _loc17_ += _loc18_;
                  }
                  else
                  {
                     _loc19_ = 0;
                     while(_loc19_ < _loc18_)
                     {
                        var _loc27_:*;
                        this.var_110[_loc27_ = _loc17_++] = 0;
                        _loc19_++;
                     }
                  }
               }
               else
               {
                  if(_loc5_ != null)
                  {
                     _loc5_.addSample(this.var_110,_loc17_,_loc18_);
                  }
                  _loc17_ += _loc18_;
               }
               if(_loc17_ < _loc16_)
               {
                  if(_loc15_ < this.var_787[_loc7_].length - 1)
                  {
                     _loc20_ = this.var_787[_loc7_].getWithIndex(++_loc15_);
                     if(_loc20_.id == 0)
                     {
                        _loc5_ = null;
                     }
                     else
                     {
                        _loc5_ = new TraxChannelSample(_loc20_,0);
                     }
                  }
                  else
                  {
                     _loc5_ = null;
                  }
               }
            }
            _loc7_--;
         }
         var _loc8_:* = 0;
         var _loc9_:int = const_275;
         if(this._length - this.var_231 < _loc9_)
         {
            _loc9_ = this._length - this.var_231;
            if(_loc9_ < 0)
            {
               _loc9_ = 0;
            }
         }
         if(!this.var_1222 && !this.var_1221)
         {
            _loc21_ = 0;
            while(_loc21_ < _loc9_)
            {
               _loc8_ = Number(this.var_110[_loc21_] * this.volume);
               param1.data.writeFloat(_loc8_);
               param1.data.writeFloat(_loc8_);
               _loc21_++;
            }
         }
         else if(this.var_1222)
         {
            _loc23_ = 0;
            while(_loc23_ < _loc9_)
            {
               _loc22_ = Math.min(this.var_988 / Number(this.var_987),1);
               ++this.var_988;
               _loc8_ = Number(this.var_110[_loc23_] * this.volume * _loc22_);
               param1.data.writeFloat(_loc8_);
               param1.data.writeFloat(_loc8_);
               _loc23_++;
            }
            if(this.var_988 > this.var_987)
            {
               this.var_1222 = false;
            }
         }
         else
         {
            _loc25_ = 0;
            while(_loc25_ < _loc9_)
            {
               _loc24_ = Math.max(1 - this.var_986 / Number(this.var_786),0);
               ++this.var_986;
               _loc8_ = Number(this.var_110[_loc25_] * this.volume * _loc24_);
               param1.data.writeFloat(_loc8_);
               param1.data.writeFloat(_loc8_);
               _loc25_++;
            }
            if(this.var_986 > this.var_786)
            {
               this.var_1221 = false;
            }
         }
         var _loc10_:int = _loc9_;
         while(_loc10_ < const_275)
         {
            _loc8_ = 0;
            param1.data.writeFloat(_loc8_);
            param1.data.writeFloat(_loc8_);
            _loc10_++;
         }
         this.var_231 += const_275;
         if(this._soundChannel != null)
         {
            this.var_1482 = param1.position / 44.1 - this._soundChannel.position;
         }
         if(this.var_231 > this._length + this.var_1482 * 44.1 && !this.var_989)
         {
            this.var_989 = true;
            _loc26_ = new Timer(2,1);
            _loc26_.start();
            _loc26_.addEventListener(TimerEvent.TIMER_COMPLETE,this.onComplete);
         }
      }
      
      private function onComplete(param1:TimerEvent) : void
      {
         this.stop();
         this._events.dispatchEvent(new SoundCompleteEvent(SoundCompleteEvent.const_893,this.var_2062));
      }
      
      private function onFadeOutComplete(param1:TimerEvent) : void
      {
         if(this._soundChannel != null)
         {
            this._soundChannel.stop();
         }
         this.var_1220.removeEventListener(SampleDataEvent.SAMPLE_DATA,this.onSampleData);
         this._soundChannel = null;
      }
   }
}
